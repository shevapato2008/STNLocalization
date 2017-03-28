function [spikes] = getSpikes(signal, peakLocs, pos_all, pos_front, pos_back, pos_ampl, pos_time)
% removed one parameters depth and pos_depth temporarily

% take all the spikes for processing
spikes = zeros(length(peakLocs), pos_time);

% para
for i = 1 : size(spikes, 1)
    timing = peakLocs(i);
    if (timing > pos_front) && ((timing + pos_back) <= size(signal, 1)) % change from 2 to 1, no drive data now 
        for j = 1 : pos_all
            spikes(i, j) = signal(timing - pos_front + j - 1);
        end
    end   
end

%{
% Depth calculations
% para
for i = 1 : size(spikes, 1)
    timing = peakLocs(i);
    if (timing > pos_front) && ((timing + pos_back) <= size(signal, 2))
        spikes(i, pos_depth) = depth(timing);
    end   
end
%}

% Amplitude calculations
% para
for i = 1 : size(spikes, 1)
    timing = peakLocs(i);
    if (timing > pos_front) && ((timing + pos_back) <= size(signal, 1)) % changed from 2 to 1, no drive data now
        spikes(i, pos_ampl) = signal(timing);
    end   
end

% Spike time calculations
% para
for i = 1 : size(spikes, 1)
    timing = peakLocs(i);
    if (timing > pos_front) && ((timing + pos_back) <= size(signal, 1)) % changed from 2 to 1, no drive data now
        spikes(i, pos_time) = timing;
    end   
end
        

% Remove flats
spikes=removeconstantrows(spikes);

%{
Normalize all spikes to [0 1]
for i=1:size(spikes,1)
    spike_max = max(spikes(i,1:pos_all));
    spike_min = min(spikes(i,1:pos_all));
    spike_ratio = 1/(spike_max - spike_min);
    spike_min_val = spike_min * spike_ratio;
    spikes(i,1:pos_all) = spikes(i,1:pos_all) * spike_ratio - spike_min_val;
end
%}







