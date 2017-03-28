%% Spike Indepdent Features %%

% Create a function handle to call feature functions %
function fh = spikeDepFeatures
    fh.misi = @misi;                % MISI:     Mean Inter-Spike Interval
    fh.sisi = @sisi;                % SISI:     Inter-Spike Interval Standard Deviation
    fh.cvisi = @cvisi;              % CVISI:    Inter-Spike Interval Coefficient of Variation
    fh.ps = @percentSpike;          % PS:       Percentage of Spikes in the Spike Signal
    fh.findBurst = @findBurst;
    fh.countBurst = @countBurst;
    fh.br = @burstRate;             % BR:       Bursting Rate
    fh.pb = @percentBurst;          % PB:       Percentage of Spikes Fired in Bursts
    fh.fr = @firingRate;            % FR:       Firing Rate
end


% (1) Mean Inter-Spike Interval (MISI) % 
% Source: Lin Chen et. al. 2009 Progress in Natural Science
function output = misi(spikeLocs)
    len = length(spikeLocs);
    sum = 0;
    for i = 2 : len
        sum = sum + (spikeLocs(i) - spikeLocs(i - 1));
    end
    output = sum / (len - 1);
end
% h = spikeDepFeatures;
% misi = h.misi(spikeLocs);


% (2) Inter-Spike Interval Standard Deviation (SISI) %
% Source: Lin Chen et. al. 2009 Progress in Natural Science
function output = sisi(spikeLocs)
    len = length(spikeLocs);
    isiArray = zeros(len - 1, 1);
    for i = 1 : (len - 1)
        isiArray(i, 1) = spikeLocs(i + 1) - spikeLocs(i);
    end
    output = std(isiArray);
end
% h = spikeDepFeatures;
% sisi = h.sisi(spikeLocs);


% (3) Inter-Spike Interval Coefficient of Variation (CVISI) %
% Source: https://en.wikipedia.org/wiki/Coefficient_of_variation
function output = cvisi(spikeLocs)
    mean = misi(spikeLocs);     % You can call another function
    std = sisi(spikeLocs);      % within the function handle
    output = std / mean;
end
% h = spikeDepFeatures;
% cvisi = h.cvisi(spikeLocs);


% (4) Percentage of Spikes in the Spike Signal (PS) %
% Source: ?
function output = percentSpike(spikeLocs, signal)
    lenSpike = length(spikeLocs) * 25;     % Assuming each spike takes 25 sample points
    lenSignal = length(signal);
    output = lenSpike / lenSignal;
end

% (5) Bursting Rate (BR) %
% Source: L. Chen et. al. 2009 Progress in Natural Science
function output = findBurst(spikeLocs)
    % create ISI array
    len = length(spikeLocs);
    meanISI = misi(spikeLocs);
    isiArray = zeros(len - 1, 1);
    for i = 1 : (len - 1)
        isiArray(i, 1) = spikeLocs(i + 1) - spikeLocs(i);
    end
    % create L array
    L = zeros(1, 1);
    counter = 1;
    for i = 1 : (len - 1)
        if isiArray(i, 1) < meanISI
            L(counter, 1) = isiArray(i, 1);
            counter = counter + 1;
        end
    end
    % calculate mL based on L array
    meanL = mean(L);
    % mark all the intervals < meanL
    i = 1;
    while i <= (len - 1)
        j = 0;
        sum = 0;
        while 1
            sum = sum + isiArray(i + j, 1);
            avg = sum / (j + 1);
            isiArray(i + j, 2) = sum;
            isiArray(i + j, 3) = avg;
            if avg < meanL
                isiArray(i + j, 4) = 1;
                j = j + 1;
                if (i + j) >= len
                    i = i + j;
                    break;
                end
            else
                j = j + 1;
                i = i + j;
                break;
            end
        end
    end
    
    % find the bursts
    for i = 1 : (len - 1)
        % corner case
        if isiArray(1, 4) == 1
            isiArray(1, 5) = 1;
        else
            isiArray(1, 5) = 0;
        end
        
        if isiArray(i, 4) == 1 && isiArray(i - 1, 4) == 0
            j = 1;
        elseif isiArray(i, 4) == 1 && isiArray(i - 1, 4) == 1
            j = j + 1;
        else
            j = 0;
        end
        isiArray(i, 5) = j;
    end
    for i = 2 : (len - 2)
        % corner cases
        if isiArray(1, 4) == 1 && isiArray(2, 4) == 0
        	isiArray(1, 5) = 0;
        end
        if isiArray(len - 1, 4) == 1 && isiArray(len - 2, 4) == 0
            isiArray(len - 1, 5) = 0;
        end
        
        if isiArray(i, 4) == 1 && isiArray(i - 1, 4) == 0 && isiArray(i + 1, 4) == 0
            isiArray(i, 5) = 0;
        end
    end
    % merge with spikelocs
    spikeLocs(2 : len, 2 : 6) = isiArray(:, 1 : 5);
    output = spikeLocs;
end

function output = countBurst(spikeLocs)
    len = length(spikeLocs);
    bursts = findBurst(spikeLocs);
    counter = 0;
    for i = len : -1 : 2                                % descending for loop...
        if bursts(i, 6) > 0 && bursts(i - 1, 6) == 0
            counter = counter + 1;
        end
    end
    output = counter;
end

function output = burstRate(spikeLocs, signal, samplingRate)
    count = countBurst(spikeLocs);
    time = length(signal) / samplingRate;
    output = count / time;
end


% (6) Percentage of Bursts (percentage of spikes fired in bursts?) (PB) %
% Source: L. Dahan et al. 2007 Neuropsychopharmacology
function output = percentBurst(spikeLocs)
    len = length(spikeLocs);            % number of spikes
    bursts = findBurst(spikeLocs);
    % mark the burst related spikes with 1 in column 7 of bursts
    for i = 1 : len
        if (bursts(i, 6) == 0 && bursts(i + 1, 6) ~= 0)
            bursts(i, 7) = 1;
        end
        if (bursts(i, 6) ~= 0)
            bursts(i, 7) = 1;
        end
    end
    % count the number of burst related spikes
    numBurstSpikes = 0;
    for i = 1 : len
        if (bursts(i, 7) ~= 0)
            numBurstSpikes = numBurstSpikes + 1;
        end
    end
    % get the percentage of spikes fired in bursts
    output = numBurstSpikes / len;
end


% (7) Firing Rate (FR) %
% Source: http://aiimpacts.org/rate-of-neuron-firing/
% So based on this rough extrapolation from neocortical firing rates, 
% we expect average firing rates across the brain to be around 0.29 per
% second, and probably less than 1.82 per second. This has been a very
% rough calculation however, and we do not have great confidence in these
% numbers.
function output = firingRate(spikeLocs, signal, samplingRate)
    len = length(spikeLocs);     % this is just the number of spikes
    time = length(signal) / samplingRate;
    output = len / time;
end







