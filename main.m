%% Set current folder %%
cd('S:\Google Drive\Rutgers University\Research\DBS\Project\Matlab\Program')


%% Load raw signal, LFP signal, and depth data %%

% 2010-11-30

% Left STN Trial 1
% Impedance checks:
% 15mm:	0.31 MOhm
% ZI Entry:	
% STN Entry:	 2.15
% STN Exit      -2.52
% SN Entry:     -2.97
% Bubbling with pulse causing some pulse artifact
% Implanted to  -2.5
rawSignal1_part1 = loadRawSignal('Data\Raw\2010-11-30\STN Left\Pass 1\C\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');
rawSignal1_part2 = loadRawSignal('Data\Raw\2010-11-30\STN Left\Pass 1\C\Snapshot - 3600.0 sec 1\WaveformData-Ch1.mat');
rawSignal{1} = vertcat(rawSignal1_part1, rawSignal1_part2);
lfp1_part1 = loadLFP('Data\Raw\2010-11-30\STN Left\Pass 1\C\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');
lfp1_part2 = loadLFP('Data\Raw\2010-11-30\STN Left\Pass 1\C\Snapshot - 3600.0 sec 1\WaveformData-Ch1.mat');
lfp{1} = vertcat(lfp1_part1, lfp1_part2);
depth1_part1 = loadDepth('Data\Raw\2010-11-30\STN Left\Pass 1\C\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');
depth1_part2 = loadDepth('Data\Raw\2010-11-30\STN Left\Pass 1\C\Snapshot - 3600.0 sec 1\WaveformData-Ch1.mat');
depth{1} = vertcat(depth1_part1, depth1_part2);

% Right STN Trial 1
% Impedance checks:
% 15mm:	0.34 MOhm
% ZI Entry:     N/A
% STN Entry:	5.94
% STN Exit:     1.73
% SN Entry:	
% Implant to 1.5 above target
rawSignal{2} = loadRawSignal('Data\Raw\2010-11-30\STN Right\Pass 1\C\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');
lfp{2} = loadLFP('Data\Raw\2010-11-30\STN Right\Pass 1\C\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');
depth{2} = loadDepth('Data\Raw\2010-11-30\STN Right\Pass 1\C\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');

% Right STN Trial 2 (2 mm posterior to track 1) ???
% Impedance checks:
% 15mm:	0.31 MOhm
% ZI Entry:     N/A
% STN Entry:	4.3
% STN Exit:     0.62
% SN Entry:     N/A
rawSignal{3} = loadRawSignal('Data\Raw\2010-11-30\STN Right\Pass 2\P\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');
lfp{3} = loadLFP('Data\Raw\2010-11-30\STN Right\Pass 2\P\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');
depth{3} = loadDepth('Data\Raw\2010-11-30\STN Right\Pass 2\P\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');


% 2010-12-07

% Left STN Trial 1
% Impedance checks:
% 15mm:	0.26 MOhm
% ZI Entry:	N/A
% STN Entry:	N/A
% STN Exit	N/A
% SN Entry:	N/A
% Cable switched during recording
%{
rawSignal5 = loadRawSignal('Data\Raw\2010-12-07\STN Left\Pass 1\C\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');
rawSignal6 = loadRawSignal('Data\Raw\2010-12-07\STN Left\Pass 1\C\Snapshot - 3600.0 sec 1\WaveformData-Ch1.mat');
rawSignal7 = loadRawSignal('Data\Raw\2010-12-07\STN Left\Pass 1\C\Snapshot - 3600.0 sec 2\WaveformData-Ch1.mat');
lfp5 = loadLFP('Data\Raw\2010-12-07\STN Left\Pass 1\C\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');
lfp6 = loadLFP('Data\Raw\2010-12-07\STN Left\Pass 1\C\Snapshot - 3600.0 sec 1\WaveformData-Ch1.mat');
lfp7 = loadLFP('Data\Raw\2010-12-07\STN Left\Pass 1\C\Snapshot - 3600.0 sec 2\WaveformData-Ch1.mat');
depth5 = loadDepth('Data\Raw\2010-12-07\STN Left\Pass 1\C\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');
depth6 = loadDepth('Data\Raw\2010-12-07\STN Left\Pass 1\C\Snapshot - 3600.0 sec 1\WaveformData-Ch1.mat');
depth7 = loadDepth('Data\Raw\2010-12-07\STN Left\Pass 1\C\Snapshot - 3600.0 sec 2\WaveformData-Ch1.mat');
%}

% Left STN Trial 2 (2mm posterior to track 1)
% 11mm:	0.25 MOhm
% ZI Entry:     N/A
% STN Entry:	1.3
% STN Exit:     0.2
% SN Entry:     N/A
% Quiet track from 4.5mm to -1mm
rawSignal4_part1 = loadRawSignal('Data\Raw\2010-12-07\STN Left\Pass 2\P\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');
rawSignal4_part2 = loadRawSignal('Data\Raw\2010-12-07\STN Left\Pass 2\P\Snapshot - 3600.0 sec 1\WaveformData-Ch1.mat');
rawSignal{4} = vertcat(rawSignal4_part1, rawSignal4_part2);
lfp4_part1 = loadLFP('Data\Raw\2010-12-07\STN Left\Pass 2\P\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');
lfp4_part2 = loadLFP('Data\Raw\2010-12-07\STN Left\Pass 2\P\Snapshot - 3600.0 sec 1\WaveformData-Ch1.mat');
lfp{4} = vertcat(lfp4_part1, lfp4_part2);
depth4_part1 = loadDepth('Data\Raw\2010-12-07\STN Left\Pass 2\P\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');
depth4_part2 = loadDepth('Data\Raw\2010-12-07\STN Left\Pass 2\P\Snapshot - 3600.0 sec 1\WaveformData-Ch1.mat');
depth{4} = vertcat(depth4_part1, depth4_part2);

% Left STN Trial 3 (2mm anterior to track 1)
% No impedance checks
% ZI Entry:      N/A
% STN Entry:	 2.5
% STN Exit:     -2.3
% SN Entry:     -2.7
% Implant to 2.3 mm below target
rawSignal5_part1 = loadRawSignal('Data\Raw\2010-12-07\STN Left\Pass 3\A\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');
rawSignal5_part2 = loadRawSignal('Data\Raw\2010-12-07\STN Left\Pass 3\A\Snapshot - 3600.0 sec 1\WaveformData-Ch1.mat');
rawSignal{5} = vertcat(rawSignal5_part1, rawSignal5_part2);
lfp5_part1 = loadLFP('Data\Raw\2010-12-07\STN Left\Pass 3\A\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');
lfp5_part2 = loadLFP('Data\Raw\2010-12-07\STN Left\Pass 3\A\Snapshot - 3600.0 sec 1\WaveformData-Ch1.mat');
lfp{5} = vertcat(lfp5_part1, lfp5_part2);
depth5_part1 = loadDepth('Data\Raw\2010-12-07\STN Left\Pass 3\A\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');
depth5_part2 = loadDepth('Data\Raw\2010-12-07\STN Left\Pass 3\A\Snapshot - 3600.0 sec 1\WaveformData-Ch1.mat');
depth{5} = vertcat(depth5_part1, depth5_part2);

% Right STN Trial 1
% Impedance checks:
% 15mm:	0.25 MOhm
% ZI Entry:     N/A
% STN Entry:	N/A
% STN Exit:     N/A
% SN Entry:     N/A
% Electrode not clamped until 3.0mm, produces false map
%{
loadRawSignal('Data\Raw\2010-12-07\STN Right\Pass 1\C\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');
loadLFP('Data\Raw\2010-12-07\STN Right\Pass 1\C\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');
loadDepth('Data\Raw\2010-12-07\STN Right\Pass 1\C\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');
%}

% Right STN Trial 2 (2 mm anterior to track 1)
% 15mm:	0.24 MOhm
% ZI Entry:     N/A
% STN Entry:	4.4
% STN Exit:     0.34
% SN Entry:    -0.42
% Implant to 0.2 above target
rawSignal{6} = loadRawSignal('Data\Raw\2010-12-07\STN Right\Pass 2\A\Snapshot - 3600.0 sec 1\WaveformData-Ch1.mat');
lfp{6} = loadLFP('Data\Raw\2010-12-07\STN Right\Pass 2\A\Snapshot - 3600.0 sec 1\WaveformData-Ch1.mat');
depth{6} = loadDepth('Data\Raw\2010-12-07\STN Right\Pass 2\A\Snapshot - 3600.0 sec 1\WaveformData-Ch1.mat');

disp('Saving rawSignal.mat ...');
save('Data\Raw\rawSignal.mat', 'rawSignal', '-v7.3');
disp('Saving lfp.mat ...');
save('Data\Raw\lfp.mat', 'lfp', '-v7.3');

disp('Loading rawSignal.mat ...');
load('Data\Raw\rawSignal.mat');
disp('Loading lfp.mat ...');
load('Data\Raw\lfp.mat');

pwelch(rawSignal{1}, [], [], [], 48000)
pwelch(lfp{1}, [], [], [], 1000)



%% Merge signal with depth data
for i = 1 : 6
    disp(['Start generating rawRecording{' num2str(i) '} ...']);
    rawRecording{i} = mergeSgnlDpth('rawSignal', rawSignal{i}, depth{i});
    disp(['Start generating lfpRecording{' num2str(i) '} ...']);
    lfpRecording{i} = mergeSgnlDpth('lfp', lfp{i}, depth{i});
end

disp('Saving rawRecording.mat ...');
save('Data\Raw\rawRecording.mat', 'rawRecording', '-v7.3');
disp('Saving lfpRecording.mat ...');
save('Data\Raw\lfpRecording.mat', 'lfpRecording', '-v7.3');

disp('Loading rawRecording.mat ...');
load('Data\Raw\rawRecording.mat');
disp('Loading lfpRecording.mat ...');
load('Data\Raw\lfpRecording.mat');



%% Apply the filters
for i = 1 : 6
    disp(['Generating filtered signals for recordings ' num2str(i) ' ...']);
    applyFilters(rawSignal{i}, lfp{i}, ...
        ['Data\Filtered\hpfSignal' num2str(i) '.mat'], ...
        ['Data\Filtered\highGammaSignal' num2str(i) '.mat'], ...
        ['Data\Filtered\lowGammaSignal' num2str(i) '.mat'], ...
        ['Data\Filtered\alphaSignal' num2str(i) '.mat'], ...
        ['Data\Filtered\betaSignal' num2str(i) '.mat'], ...
        ['Data\Filtered\thetaSignal' num2str(i) '.mat'], ...
        ['Data\Filtered\deltaSignal' num2str(i) '.mat'], ...
        ['Data\Filtered\infraSlowSignal' num2str(i) '.mat']);
end

load('Filtered\hpfSignal1.mat');
pwelch(rawSignal{1}, [], [], [], 48000)
pwelch(hpfSignal, [], [], [], 48000)

load('Filtered\highGammaSignal1.mat');
pwelch(highGammaSignal, [], [], [], 1000)



%% Convert 1D input signal to a matrix of epochs with 50% overlapping as rows
% divide into epochs of 4 seconds
for i = 1 : 6
    
    disp(['Start group ' num2str(i) ' epoch matrices...']);
    
    temp = load(['Data\Filtered\hpfSignal' num2str(i) '.mat']);
    disp(['    Generating hpfSignalEpoch' num2str(i) '...']);
    hpfSignalEpoch = getEpochMatrix(temp.hpfSignal, 4, 48000);
    disp(['    Saving hpfSignalEpoch' num2str(i) '.mat...']);
    save(['Data\Epoch\hpfSignal' num2str(i) 'Epoch.mat'], 'hpfSignalEpoch', '-v7.3');

    temp = load(['Data\Filtered\alphaSignal' num2str(i) '.mat']);
    disp(['    Generating alphaSignalEpoch' num2str(i) '...']);
    alphaSignalEpoch = getEpochMatrix(temp.alphaSignal, 4, 1000);
    disp(['    Saving alphaSignalEpoch' num2str(i) '.mat...']);
    save(['Data\Epoch\alphaSignal' num2str(i) 'Epoch.mat'], 'alphaSignalEpoch', '-v7.3');

    temp = load(['Data\Filtered\betaSignal' num2str(i) '.mat']);
    disp(['    Generating betaSignalEpoch' num2str(i) '...']);
    betaSignalEpoch = getEpochMatrix(temp.betaSignal, 4, 1000);
    disp(['    Saving betaSignalEpoch' num2str(i) '.mat...']);
    save(['Data\Epoch\betaSignal' num2str(i) 'Epoch.mat'], 'betaSignalEpoch', '-v7.3');

    temp = load(['Data\Filtered\deltaSignal' num2str(i) '.mat']);
    disp(['    Generating deltaSignalEpoch' num2str(i) '...']);
    deltaSignalEpoch = getEpochMatrix(temp.deltaSignal, 4, 1000);
    disp(['    Saving deltaSignalEpoch' num2str(i) '.mat...']);
    save(['Data\Epoch\deltaSignal' num2str(i) 'Epoch.mat'], 'deltaSignalEpoch', '-v7.3');

    temp = load(['Data\Filtered\thetaSignal' num2str(i) '.mat']);
    disp(['    Generating thetaSignalEpoch' num2str(i) '...']);
    thetaSignalEpoch = getEpochMatrix(temp.thetaSignal, 4, 1000);
    disp(['    Saving thetaSignalEpoch' num2str(i) '.mat...']);
    save(['Data\Epoch\thetaSignal' num2str(i) 'Epoch.mat'], 'thetaSignalEpoch', '-v7.3');

    temp = load(['Data\Filtered\lowGammaSignal' num2str(i) '.mat']);
    disp(['    Generating thetaSignalEpoch' num2str(i) '...']);
    lowGammaSignalEpoch = getEpochMatrix(temp.lowGammaSignal, 4, 1000);
    disp(['    Saving thetaSignalEpoch' num2str(i) '.mat...']);
    save(['Data\Epoch\lowGammaSignal' num2str(i) 'Epoch.mat'], 'lowGammaSignalEpoch', '-v7.3');

    temp = load(['Data\Filtered\highGammaSignal' num2str(i) '.mat']);
    disp(['    Generating highGammaSignalEpoch' num2str(i) '...']);
    highGammaSignalEpoch = getEpochMatrix(temp.highGammaSignal, 4, 1000);
    disp(['    Saving highGammaSignalEpoch' num2str(i) '.mat...']);
    save(['Data\Epoch\highGammaSignal' num2str(i) 'Epoch.mat'], 'highGammaSignalEpoch', '-v7.3');

    temp = load(['Data\Filtered\infraSlowSignal' num2str(i) '.mat']);
    disp(['    Generating infraSlowSignalEpoch' num2str(i) '...']);
    infraSlowSignalEpoch = getEpochMatrix(temp.infraSlowSignal, 4, 1000);
    disp(['    Saving infraSlowSignalEpoch' num2str(i) '.mat...']);
    save(['Data\Epoch\infraSlowSignal' num2str(i) 'Epoch.mat'], 'infraSlowSignalEpoch', '-v7.3');
    
end


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

