
%% Set current folder to wave_clus folder %%
cd('S:\Google Drive (edu)\Rutgers University\Research\DBS\Project\Spike Sorting\wave_clus\code\wave_clus-testing')

%% Data Preprocessing: raw data
rawSignal1 = load('DBS\Raw\WaveformData-Ch1.mat');
temp = rawSignal1.apmdata.channels.continuous;
% plot(raw_signal)                                  % plot the raw signal data
% save('raw_signal')                                % save rawSignal1
data = transpose(temp);                             % Transpose the signal data
data = data(1, 60850000:62840000);                  % pick only part of the data 60850000:62840000
sr = 48000;                                         % Sampling rate
par.sr = 48000;                                     
save('Raw_data_readers\data\rawSignal.mat', 'sr', 'par', 'data');
clear

%% Data Preprocessing: filtered data
cd('S:\Google Drive (edu)\Rutgers University\Research\DBS\Project\Spike Sorting\wave_clus\code\wave_clus-testing')
hpfSignal1 = load('DBS\Filtered\hpf_sgnl1.mat');
temp = hpfSignal1.hpf_sgnl1;
data = transpose(temp);                             % Transpose the signal data
sr = 48000;                                         % Sampling rate
par.sr = 48000;                                     
save('Raw_data_readers\data\hpfSignal1.mat', 'sr', 'par', 'data');
clear

%% Spike Sorting
load('Raw_data_readers\data\rawSignal.mat');
wave_clus



