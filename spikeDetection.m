function [spikeLocs, spikeAmpls, spikes] = spikeDetection(signal)
% functions called: findSpikes, getSpikes
% @signal: input signal, could be filtered signal
% @spikeLocs: locations of spikes
% @spikeAmpls: aplitudes of spikes
% @spikes: a matrix with
%          - first 25 columns as spike details
%          - 26th column as spike amplitudes
%          - 27th column as spike locations

%% Threshold
threshold = median(abs(signal)) / 0.6745;
    % according to R. Q. Quiroga 2015 paper

%% Find the spikes
[spikeLocs, spikeAmpls] = findSpikes(signal, threshold);

%% Get the spikes
% Set the parameters
POS_ALL = 25;       % set the total length of the spike
POS_FRONT = 12;     % set the length before the peak
POS_BACK = 12;      % set the length after the peak
pos_ampl = 26;      % set the column to store the amplitude of the peak
pos_loc = 27;       % set the column to store the locations of the peak
[spikes] = getSpikes(signal, spikeLocs, POS_ALL, POS_FRONT, POS_BACK, pos_ampl, pos_loc);

end