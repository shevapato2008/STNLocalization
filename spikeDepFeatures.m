%% Spike Depdent Features %%

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
    
    
    fh.mbi = @modifiedBurstIndex;   % MBI:      Modified Burst Index
    fh.pi = @pauseIndex;            % PI:       Pause Index
    fh.pr = @pauseRatio;            % PR:       Pause Ratio
    fh.sc = @spikeCount;            % SC:       Spike Count
    fh.msad = @msad;                % MSAD:     Mean Spike Amplitude Differential
end

%% The list on the proposal %%

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
    output = 100 * (lenSpike / lenSignal);
end

% (5) Bursting Rate (BR) %
% Source: L. Chen et. al. 2009 Progress in Natural Science
function output = findBurst(spikeLocs)
    % create ISI array
    len = length(spikeLocs);
    meanISI = misi(spikeLocs);
    isiArray = zeros(len - 1, 5);
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
    j = 1;
    for i = 2 : (len - 1)
        % corner case in the front
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
    temp = zeros(len, 7);
    temp(:, 1 : 6) = bursts(:, 1 : 6);
    % mark the burst related spikes with 1 in column 7 of bursts
    for i = 1 : (len - 1)
        if (bursts(i, 6) == 0 && bursts(i + 1, 6) ~= 0)
            temp(i, 7) = 1;
        end
        if (bursts(i, 6) ~= 0)
            temp(i, 7) = 1;
        end
    end
    % count the number of burst related spikes
    numBurstSpikes = 0;
    for i = 1 : len
        if (temp(i, 7) ~= 0)
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



%% 1.a (Dr. Stephen Wong's 2009 paper) %%

% (8) Modified Burst Index (MBI)
% MBI is the ratio of the number of interspike intervals less than 10 ms
% to the number greater than 10 ms.
function output = modifiedBurstIndex(spikeLocs)
    numISIsm = 0;      % counter for small interspike interval
    numISIlg = 0;      % counter for large interspike interval
    for i = 2 : length(spikeLocs)
        if (spikeLocs(i) - spikeLocs(i - 1)) < 4 * (48000 / 1000)
            numISIsm = numISIsm + 1;
        elseif (spikeLocs(i) - spikeLocs(i - 1)) >= 4 * (48000 / 1000)
            numISIlg = numISIlg + 1;
        end
    end
    output = numISIsm / numISIlg;
end


% (9) Pause Index (PI)
% PI is the ratio of the number of inter-spike intervals greater than 
% 50 ms to the number less than 50 ms.

function output = pauseIndex(spikeLocs)
    numISIsm = 0;      % counter for small interspike interval
    numISIlg = 0;      % counter for large interspike interval
    for i = 2 : length(spikeLocs)
        currISI = spikeLocs(i) - spikeLocs(i - 1);
        if currISI < 50 * (48000 / 1000)
            numISIsm = numISIsm + 1;
        elseif currISI >= 50 * (48000 / 1000)
            numISIlg = numISIlg + 1;
        end
    end
    
    if numISIsm == 0
        output = NaN;
    else
        output = numISIlg / numISIsm;
    end
end


% (10) Pause Ratio (PR)
% PR is the ratio of cumulative time of inter-spike intervals greater than
% 50 ms to the cumulative time of those less than 50 ms.
function output = pauseRatio(spikeLocs)
    sumISIsm = 0;      % counter for small interspike interval
    sumISIlg = 0;      % counter for large interspike interval
    for i = 2 : length(spikeLocs)
        currISI = spikeLocs(i) - spikeLocs(i - 1);
        if currISI < 50 * (48000 / 1000)
            sumISIsm = sumISIsm + currISI;
        elseif currISI >= 50 * (48000 / 1000)
            sumISIlg = sumISIlg + currISI;
        end
    end
    
    if sumISIsm == 0
        output = NaN;
    else
        output = sumISIlg / sumISIsm;
    end
end


% (*) Spike Fraction (SF)
% SF is the percentage of spikes accepted as genuine spikes amongst
% candidate spikes by our spike detector.


% (11) Spike Count (SC)
% SC is the number of spikes detected by the spike detection process
% outlined above.
function output = spikeCount(spikeLocs)
    output = length(spikeLocs);
end


% (12) Mean Spike Amplitude Differential (MSAD)
% MSAD is the 80% trimmed mean of the difference between consecutive
% spike amplitudes.
function output = msad(spikeAmpls)
    numSpike = length(spikeAmpls);
    diff = zeros(numSpike - 1, 1);
    for i = 1 : (numSpike - 1)
        diff(i) = spikeAmpls(i + 1) - spikeAmpls(i);
    end
    
    TEN_PRCNTILE = prctile(diff, 10);
    NINTY_PRCNTILE = prctile(diff, 90);
    sum = 0;
    count = 0;
    for i = 1 : (numSpike - 1)
        % trim 10% from top and bottom respectively
        if diff(i) >= TEN_PRCNTILE && diff(i) <= NINTY_PRCNTILE
            sum = sum + diff(i);
            count = count + 1;
        end
    end
    output = sum / count;
end








