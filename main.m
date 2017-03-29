%% Set current folder %%
cd('S:\Google Drive (edu)\Rutgers University\Research\DBS\Project\Matlab\Program')


%% Load raw signal, LFP signal, and depth data %%
% 2010-11-30
rawSignal1 = loadRawSignal('Data\Raw\2010-11-30\STN Left\Pass 1\C\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');
rawSignal2 = loadRawSignal('Data\Raw\2010-11-30\STN Left\Pass 1\C\Snapshot - 3600.0 sec 1\WaveformData-Ch1.mat');
rawSignal3 = loadRawSignal('Data\Raw\2010-11-30\STN Right\Pass 1\C\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');
rawSignal4 = loadRawSignal('Data\Raw\2010-11-30\STN Right\Pass 2\P\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');
lfp1 = loadLFP('Data\Raw\2010-11-30\STN Left\Pass 1\C\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');
lfp2 = loadLFP('Data\Raw\2010-11-30\STN Left\Pass 1\C\Snapshot - 3600.0 sec 1\WaveformData-Ch1.mat');
lfp3 = loadLFP('Data\Raw\2010-11-30\STN Right\Pass 1\C\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');
lfp4 = loadLFP('Data\Raw\2010-11-30\STN Right\Pass 2\P\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');

% 2010-12-07
rawSignal5 = loadRawSignal('Data\Raw\2010-12-07\STN Left\Pass 1\C\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');
rawSignal6 = loadRawSignal('Data\Raw\2010-12-07\STN Left\Pass 1\C\Snapshot - 3600.0 sec 1\WaveformData-Ch1.mat');
rawSignal7 = loadRawSignal('Data\Raw\2010-12-07\STN Left\Pass 1\C\Snapshot - 3600.0 sec 2\WaveformData-Ch1.mat');
rawSignal8 = loadRawSignal('Data\Raw\2010-12-07\STN Left\Pass 2\P\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');
rawSignal9 = loadRawSignal('Data\Raw\2010-12-07\STN Left\Pass 2\P\Snapshot - 3600.0 sec 1\WaveformData-Ch1.mat');
rawSignal10 = loadRawSignal('Data\Raw\2010-12-07\STN Left\Pass 3\A\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');
rawSignal11 = loadRawSignal('Data\Raw\2010-12-07\STN Left\Pass 3\A\Snapshot - 3600.0 sec 1\WaveformData-Ch1.mat');
rawSignal12 = loadRawSignal('Data\Raw\2010-12-07\STN Right\Pass 1\C\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');
rawSignal13 = loadRawSignal('Data\Raw\2010-12-07\STN Right\Pass 2\A\Snapshot - 3600.0 sec 1\WaveformData-Ch1.mat');
lfp5 = loadLFP('Data\Raw\2010-12-07\STN Left\Pass 1\C\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');
lfp6 = loadLFP('Data\Raw\2010-12-07\STN Left\Pass 1\C\Snapshot - 3600.0 sec 1\WaveformData-Ch1.mat');
lfp7 = loadLFP('Data\Raw\2010-12-07\STN Left\Pass 1\C\Snapshot - 3600.0 sec 2\WaveformData-Ch1.mat');
lfp8 = loadLFP('Data\Raw\2010-12-07\STN Left\Pass 2\P\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');
lfp9 = loadLFP('Data\Raw\2010-12-07\STN Left\Pass 2\P\Snapshot - 3600.0 sec 1\WaveformData-Ch1.mat');
lfp10 = loadLFP('Data\Raw\2010-12-07\STN Left\Pass 3\A\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');
lfp11 = loadLFP('Data\Raw\2010-12-07\STN Left\Pass 3\A\Snapshot - 3600.0 sec 1\WaveformData-Ch1.mat');
lfp12 = loadLFP('Data\Raw\2010-12-07\STN Right\Pass 1\C\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');
lfp13 = loadLFP('Data\Raw\2010-12-07\STN Right\Pass 2\A\Snapshot - 3600.0 sec 1\WaveformData-Ch1.mat');



pwelch(rawSignal1, [], [], [], 48000)
pwelch(lfp13, [], [], [], 1000)
depth = temp.apmdata.drive_data(2).depth;


%% Apply the filters
applyFilters(rawSignal1, lfp1, ...
    	  'Data\Filtered\hpfSignal1.mat', 'Data\Filtered\highGammaSignal1.mat', ...
          'Data\Filtered\lowGammaSignal1.mat', 'Data\Filtered\alphaSignal1.mat', ...
          'Data\Filtered\betaSignal1.mat', 'Data\Filtered\thetaSignal1.mat', ...
          'Data\Filtered\deltaSignal1.mat', 'Data\Filtered\infraSlowSignal1.mat');

applyFilters(rawSignal2, lfp2, ...
    	  'Data\Filtered\hpfSignal2.mat', 'Data\Filtered\highGammaSignal2.mat', ...
          'Data\Filtered\lowGammaSignal2.mat', 'Data\Filtered\alphaSignal2.mat', ...
          'Data\Filtered\betaSignal2.mat', 'Data\Filtered\thetaSignal2.mat', ...
          'Data\Filtered\deltaSignal2.mat', 'Data\Filtered\infraSlowSignal2.mat');

applyFilters(rawSignal3, lfp3, ...
    	  'Data\Filtered\hpfSignal3.mat', 'Data\Filtered\highGammaSignal3.mat', ...
          'Data\Filtered\lowGammaSignal3.mat', 'Data\Filtered\alphaSignal3.mat', ...
          'Data\Filtered\betaSignal3.mat', 'Data\Filtered\thetaSignal3.mat', ...
          'Data\Filtered\deltaSignal3.mat', 'Data\Filtered\infraSlowSignal3.mat');

applyFilters(rawSignal4, lfp4, ...
    	  'Data\Filtered\hpfSignal4.mat', 'Data\Filtered\highGammaSignal4.mat', ...
          'Data\Filtered\lowGammaSignal4.mat', 'Data\Filtered\alphaSignal4.mat', ...
          'Data\Filtered\betaSignal4.mat', 'Data\Filtered\thetaSignal4.mat', ...
          'Data\Filtered\deltaSignal4.mat', 'Data\Filtered\infraSlowSignal4.mat');

applyFilters(rawSignal5, lfp5, ...
    	  'Data\Filtered\hpfSignal5.mat', 'Data\Filtered\highGammaSignal5.mat', ...
          'Data\Filtered\lowGammaSignal5.mat', 'Data\Filtered\alphaSignal5.mat', ...
          'Data\Filtered\betaSignal5.mat', 'Data\Filtered\thetaSignal5.mat', ...
          'Data\Filtered\deltaSignal5.mat', 'Data\Filtered\infraSlowSignal5.mat');

applyFilters(rawSignal6, lfp6, ...
    	  'Data\Filtered\hpfSignal6.mat', 'Data\Filtered\highGammaSignal6.mat', ...
          'Data\Filtered\lowGammaSignal6.mat', 'Data\Filtered\alphaSignal6.mat', ...
          'Data\Filtered\betaSignal6.mat', 'Data\Filtered\thetaSignal6.mat', ...
          'Data\Filtered\deltaSignal6.mat', 'Data\Filtered\infraSlowSignal6.mat');

applyFilters(rawSignal7, lfp7, ...
    	  'Data\Filtered\hpfSignal7.mat', 'Data\Filtered\highGammaSignal7.mat', ...
          'Data\Filtered\lowGammaSignal7.mat', 'Data\Filtered\alphaSignal7.mat', ...
          'Data\Filtered\betaSignal7.mat', 'Data\Filtered\thetaSignal7.mat', ...
          'Data\Filtered\deltaSignal7.mat', 'Data\Filtered\infraSlowSignal7.mat');

applyFilters(rawSignal8, lfp8, ...
    	  'Data\Filtered\hpfSignal8.mat', 'Data\Filtered\highGammaSignal8.mat', ...
          'Data\Filtered\lowGammaSignal8.mat', 'Data\Filtered\alphaSignal8.mat', ...
          'Data\Filtered\betaSignal8.mat', 'Data\Filtered\thetaSignal8.mat', ...
          'Data\Filtered\deltaSignal8.mat', 'Data\Filtered\infraSlowSignal8.mat');

applyFilters(rawSignal9, lfp9, ...
    	  'Data\Filtered\hpfSignal9.mat', 'Data\Filtered\highGammaSignal9.mat', ...
          'Data\Filtered\lowGammaSignal9.mat', 'Data\Filtered\alphaSignal9.mat', ...
          'Data\Filtered\betaSignal9.mat', 'Data\Filtered\thetaSignal9.mat', ...
          'Data\Filtered\deltaSignal9.mat', 'Data\Filtered\infraSlowSignal9.mat');

applyFilters(rawSignal10, lfp10, ...
    	  'Data\Filtered\hpfSignal10.mat', 'Data\Filtered\highGammaSignal10.mat', ...
          'Data\Filtered\lowGammaSignal10.mat', 'Data\Filtered\alphaSignal10.mat', ...
          'Data\Filtered\betaSignal10.mat', 'Data\Filtered\thetaSignal10.mat', ...
          'Data\Filtered\deltaSignal10.mat', 'Data\Filtered\infraSlowSignal10.mat');

applyFilters(rawSignal11, lfp11, ...
    	  'Data\Filtered\hpfSignal11.mat', 'Data\Filtered\highGammaSignal11.mat', ...
          'Data\Filtered\lowGammaSignal11.mat', 'Data\Filtered\alphaSignal11.mat', ...
          'Data\Filtered\betaSignal11.mat', 'Data\Filtered\thetaSignal11.mat', ...
          'Data\Filtered\deltaSignal11.mat', 'Data\Filtered\infraSlowSignal11.mat');

applyFilters(rawSignal12, lfp12, ...
    	  'Data\Filtered\hpfSignal12.mat', 'Data\Filtered\highGammaSignal12.mat', ...
          'Data\Filtered\lowGammaSignal12.mat', 'Data\Filtered\alphaSignal12.mat', ...
          'Data\Filtered\betaSignal12.mat', 'Data\Filtered\thetaSignal12.mat', ...
          'Data\Filtered\deltaSignal12.mat', 'Data\Filtered\infraSlowSignal12.mat');

applyFilters(rawSignal13, lfp13, ...
    	  'Data\Filtered\hpfSignal13.mat', 'Data\Filtered\highGammaSignal13.mat', ...
          'Data\Filtered\lowGammaSignal13.mat', 'Data\Filtered\alphaSignal13.mat', ...
          'Data\Filtered\betaSignal13.mat', 'Data\Filtered\thetaSignal13.mat', ...
          'Data\Filtered\deltaSignal13.mat', 'Data\Filtered\infraSlowSignal13.mat');

load('Filtered\hpfSignal1.mat');
pwelch(rawSignal1, [], [], [], 48000)
pwelch(hpfSignal1, [], [], [], 48000)

load('Filtered\highGammaSignal1.mat');
pwelch(highGammaSignal1, [], [], [], 48000)


%% Convert 1D input signal to a matrix of epochs with 50% overlapping as rows
% divide into epochs of 4 seconds
temp = load('Data\Filtered\hpfSignal1.mat');
hpfSignal1_epoch = epochMatrix(temp.hpfSignal, 4, 48000);

lfp1_epoch = epochMatrix(lfp1, 4, 1000);

save(sprintf('datafile_%02d', i), 'random_sample');







%% Spike detection
temp = load('Data\Filtered\hpfSignal1.mat');
[spikeLocs, spikeAmpls, spikes] = spikeDetection(temp.hpfSignal);

%% Spike dependent features
load('Filtered\hpfSignal.mat');
sdf = spikeDepFeatures;
sdf
sdf.br(spikeLocs, hpfSignal, 48000)
sdf.fr(spikeLocs, hpfSignal, 48000)
% you can try more

%% Spike independent features
load('Filtered\lpfSignal.mat');
sif = spikeIndepFeatures;
sif
sif.powerxw_fft(lpfSignal, 11, 30)                          % try band 11-30
powerBandRatio = sif.powerxw_pwelch(lfp1, 11, 30, 1000);	% try band 11-30
peak2avgPower = sif.pkxw(lfp1, 11, 30, 1000);               % try band 11-30
fmax2avgPower = sif.fmaxpkxw(lfp1, 11, 30, 1000);           % try band 11-30













%% Plot to see the effect %%
load('Filtered\raw_sgnl1.mat');
load('Filtered\lpf_sgnl1.mat');
load('Filtered\hpf_sgnl1.mat');

figure
ax(1) = subplot(3, 1, 1);
plot(raw_sgnl1)
xlabel('Time')
ylabel('Signal')
title('Raw Signal')
ax(2) = subplot(3, 1, 2);
plot(lpf_sgnl1)
xlabel('Time')
ylabel('Signal')
title('Local Field Potential (LFP)')
ax(3) = subplot(3, 1, 3);
plot(hpf_sgnl1)
xlabel('Time')
ylabel('Signal')
title('Spikes')
% link and zoom in to show the changes
linkaxes(ax(1 : 3),'xy')
axis(ax, [1 1000 -3000 3000])
axis(ax, [1 10000 -3000 3000])
axis(ax, [1 100000 -3000 3000])


%% Load depth data %%
depthData1 = load('depth1.mat');
depth1 = depthData1.depthData1;
figure
plot(depth1(:, 1), depth1(:, 2));                               % plot the depth data


%% Merge raw, LFP, and spike signals with depth data respectively %%
raw_record1 = mergeSgnlDpth(raw_sgnl1, depth1);
lpf_record1 = mergeSgnlDpth(lpf_sgnl1, depth1);
hpf_record1 = mergeSgnlDpth(hpf_sgnl1, depth1);

save('Data\Filtered\raw_record1.mat', 'raw_record1')
save('Data\Filtered\lpf_record1.mat', 'lpf_record1')
save('Data\Filtered\hpf_record1.mat', 'hpf_record1')

load('Data\Filtered\raw_record1.mat', 'raw_record1')
load('Data\Filtered\lpf_record1.mat', 'lpf_record1')
load('Data\Filtered\hpf_record1.mat', 'hpf_record1')

%% Plot the merged time-signal-depth recording to see the effect
plotMER(raw_record1, 'Raw Signal')
plotMER(lpf_record1, 'LFP')
plotMER(hpf_record1, 'Spikes')
% raw signal: depth - signal plot
figure
time = raw_record1(:, 1);
signal = raw_record1(:, 2);
depth = raw_record1(:, 3);
plot(depth, signal);
