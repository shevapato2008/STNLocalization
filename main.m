%% Set current folder %%
cd('S:\Google Drive\Rutgers University\Research\DBS\Project\Matlab\Program')



%% 1. Data Preprocessing

%% 1.1 Load raw signal, LFP signal, and depth data %%

% 2010-11-30

% [Signal 1]
%{
Left STN Trial 1
Impedance checks:
15mm:	0.31 MOhm
ZI Entry:	
STN Entry:     2.15
STN Exit      -2.52 [?]
SN Entry:     -2.97 [?]
Bubbling with pulse causing some pulse artifact
Implanted to  -2.5 [?]
%}

% signal
rawSignal1_part1 = loadRawSignal('Data\Raw\2010-11-30\STN Left\Pass 1\C\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');
rawSignal1_part2 = loadRawSignal('Data\Raw\2010-11-30\STN Left\Pass 1\C\Snapshot - 3600.0 sec 1\WaveformData-Ch1.mat');
rawSignal{1} = vertcat(rawSignal1_part1, rawSignal1_part2);
lfp1_part1 = loadLFP('Data\Raw\2010-11-30\STN Left\Pass 1\C\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');
lfp1_part2 = loadLFP('Data\Raw\2010-11-30\STN Left\Pass 1\C\Snapshot - 3600.0 sec 1\WaveformData-Ch1.mat');
lfp{1} = vertcat(lfp1_part1, lfp1_part2);

% depth
depth1_part1 = loadDepth('Data\Raw\2010-11-30\STN Left\Pass 1\C\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');
depth1_part2 = loadDepth('Data\Raw\2010-11-30\STN Left\Pass 1\C\Snapshot - 3600.0 sec 1\WaveformData-Ch1.mat');
% remove the difference in time before concatenating the depth data
diff = depth1_part2(1, 1) - depth1_part1(size(depth1_part1, 1), 1);
depth1_part2(:, 1) = depth1_part2(:, 1) - diff + 1;
depth_temp = vertcat(depth1_part1, depth1_part2);
% convert original depth data to milimeters above target
depth{1} = convertDepth(depth_temp);


% [Signal 2]
%{
Right STN Trial 1
Impedance checks:
15mm:	0.34 MOhm
ZI Entry:     N/A
STN Entry:	  5.94
STN Exit:     1.73
SN Entry:	
Implant to 1.5 above target
%}

rawSignal{2} = loadRawSignal('Data\Raw\2010-11-30\STN Right\Pass 1\C\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');
lfp{2} = loadLFP('Data\Raw\2010-11-30\STN Right\Pass 1\C\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');
depth_temp = loadDepth('Data\Raw\2010-11-30\STN Right\Pass 1\C\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');
depth{2} = convertDepth(depth_temp);


% [Signal 3]
%{
Right STN Trial 2 (2 mm posterior to track 1)
Impedance checks:
15mm:	0.31 MOhm
ZI Entry:      N/A
STN Entry:	   4.3
STN Exit:     0.62
SN Entry:      N/A
%}

rawSignal{3} = loadRawSignal('Data\Raw\2010-11-30\STN Right\Pass 2\P\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');
lfp{3} = loadLFP('Data\Raw\2010-11-30\STN Right\Pass 2\P\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');
depth_temp = loadDepth('Data\Raw\2010-11-30\STN Right\Pass 2\P\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');
depth{3} = convertDepth(depth_temp);


% 2010-12-07

%{
% Left STN Trial 1
% Impedance checks:
% 15mm:	0.26 MOhm
% ZI Entry:	N/A
% STN Entry:	N/A
% STN Exit	N/A
% SN Entry:	N/A
% Cable switched during recording

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


% [Signal 4]
%{
Left STN Trial 2 (2mm posterior to track 1)
11mm:	0.25 MOhm
ZI Entry:     N/A
STN Entry:	  1.3
STN Exit:     0.2
SN Entry:     N/A
Quiet track from 4.5mm to -1mm
%}

rawSignal4_part1 = loadRawSignal('Data\Raw\2010-12-07\STN Left\Pass 2\P\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');
rawSignal4_part2 = loadRawSignal('Data\Raw\2010-12-07\STN Left\Pass 2\P\Snapshot - 3600.0 sec 1\WaveformData-Ch1.mat');
rawSignal{4} = vertcat(rawSignal4_part1, rawSignal4_part2);
lfp4_part1 = loadLFP('Data\Raw\2010-12-07\STN Left\Pass 2\P\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');
lfp4_part2 = loadLFP('Data\Raw\2010-12-07\STN Left\Pass 2\P\Snapshot - 3600.0 sec 1\WaveformData-Ch1.mat');
lfp{4} = vertcat(lfp4_part1, lfp4_part2);
depth4_part1 = loadDepth('Data\Raw\2010-12-07\STN Left\Pass 2\P\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');
depth4_part2 = loadDepth('Data\Raw\2010-12-07\STN Left\Pass 2\P\Snapshot - 3600.0 sec 1\WaveformData-Ch1.mat');
% remove the difference in time before concatenating the depth data
diff = depth4_part2(1, 1) - depth4_part1(size(depth4_part1, 1), 1);
depth4_part2(:, 1) = depth4_part2(:, 1) - diff + 1;
depth_temp = vertcat(depth4_part1, depth4_part2);
depth{4} = convertDepth(depth_temp);



% [Signal 5]
%{
Left STN Trial 3 (2mm anterior to track 1)
No impedance checks
ZI Entry:      N/A
STN Entry:	   2.5
STN Exit:     -2.3
SN Entry:     -2.7
Implant to 2.3 mm below target
%}

rawSignal5_part1 = loadRawSignal('Data\Raw\2010-12-07\STN Left\Pass 3\A\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');
rawSignal5_part2 = loadRawSignal('Data\Raw\2010-12-07\STN Left\Pass 3\A\Snapshot - 3600.0 sec 1\WaveformData-Ch1.mat');
rawSignal{5} = vertcat(rawSignal5_part1, rawSignal5_part2);
lfp5_part1 = loadLFP('Data\Raw\2010-12-07\STN Left\Pass 3\A\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');
lfp5_part2 = loadLFP('Data\Raw\2010-12-07\STN Left\Pass 3\A\Snapshot - 3600.0 sec 1\WaveformData-Ch1.mat');
lfp{5} = vertcat(lfp5_part1, lfp5_part2);

% depth
depth5_part1 = loadDepth('Data\Raw\2010-12-07\STN Left\Pass 3\A\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');
depth5_part2 = loadDepth('Data\Raw\2010-12-07\STN Left\Pass 3\A\Snapshot - 3600.0 sec 1\WaveformData-Ch1.mat');
% remove the difference in time before concatenating the depth data
diff = depth5_part2(1, 1) - depth5_part1(size(depth5_part1, 1), 1);
depth5_part2(:, 1) = depth5_part2(:, 1) - diff + 1;
depth_temp = vertcat(depth5_part1, depth5_part2);
depth{5} = convertDepth(depth_temp);



%{
Right STN Trial 1
Impedance checks:
15mm:	0.25 MOhm
ZI Entry:     N/A
STN Entry:	N/A
STN Exit:     N/A
SN Entry:     N/A
Electrode not clamped until 3.0mm, produces false map

loadRawSignal('Data\Raw\2010-12-07\STN Right\Pass 1\C\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');
loadLFP('Data\Raw\2010-12-07\STN Right\Pass 1\C\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');
loadDepth('Data\Raw\2010-12-07\STN Right\Pass 1\C\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');
%}


% [Signal 6]
%{
Right STN Trial 2 (2 mm anterior to track 1)
15mm:	0.24 MOhm
ZI Entry:      N/A
STN Entry:	   4.4
STN Exit:     0.34
SN Entry:    -0.42
Implant to 0.2 above target
%}

rawSignal{6} = loadRawSignal('Data\Raw\2010-12-07\STN Right\Pass 2\A\Snapshot - 3600.0 sec 1\WaveformData-Ch1.mat');
lfp{6} = loadLFP('Data\Raw\2010-12-07\STN Right\Pass 2\A\Snapshot - 3600.0 sec 1\WaveformData-Ch1.mat');
depth_temp = loadDepth('Data\Raw\2010-12-07\STN Right\Pass 2\A\Snapshot - 3600.0 sec 1\WaveformData-Ch1.mat');
depth{6} = convertDepth(depth_temp);


% save rawSignal.mat, lfp.mat, and depth.mat
disp('Saving rawSignal.mat ...');
save('Data\Raw\rawSignal.mat', 'rawSignal', '-v7.3');
disp('Saving lfp.mat ...');
save('Data\Raw\lfp.mat', 'lfp', '-v7.3');
disp('Saving depth.mat ...');
save('Data\Raw\depth.mat', 'depth', '-v7.3');

% load rawSignal.mat, lfp.mat, and depth.mat
disp('Loading rawSignal.mat ...');
load('Data\Raw\rawSignal.mat');
disp('Loading lfp.mat ...');
load('Data\Raw\lfp.mat');
disp('Loading depth.mat ...');
load('Data\Raw\depth.mat');

pwelch(rawSignal{1}, [], [], [], 48000)
pwelch(lfp{1}, [], [], [], 1000)



%% 1.2 Merge signal with depth data
for i = 1 : 6
    disp(['Generating rawRecording{' num2str(i) '} ...']);
    rawRecording{i} = mergeSgnlDpth('rawSignal', rawSignal{i}, depth{i});
    disp(['Generating lfpRecording{' num2str(i) '} ...']);
    lfpRecording{i} = mergeSgnlDpth('lfp', lfp{i}, depth{i});
end

% save rawRecording.mat and lfpRecording.mat
disp('Saving rawRecording.mat ...');
save('Data\Raw\rawRecording.mat', 'rawRecording', '-v7.3');
disp('Saving lfpRecording.mat ...');
save('Data\Raw\lfpRecording.mat', 'lfpRecording', '-v7.3');



%% 1.3 Generate filtered data
% save local field potential (lfp) data to filtered folder
temp = load('Data\Raw\lfp.mat');
for i = 1 : 6
    lfp = temp.lfp{i};
    save(['Data\Filtered\lfp' num2str(i) '.mat'], varname(lfp));
end

% Apply the filters
% load rawRecording.mat and lfpRecording.mat
disp('Loading rawRecording.mat ...');
load('Data\Raw\rawRecording.mat');
disp('Loading lfpRecording.mat ...');
load('Data\Raw\lfpRecording.mat');

for i = 1 : 6
    disp(['Generating filtered signals for recordings ' num2str(i) ' ...']);
    applyFilters(rawRecording{i}(:, 2), lfpRecording{i}(:, 2), ...
        ['Data\Filtered\300-3000\hpfSignal' num2str(i) '.mat'], ...
        ['Data\Filtered\O300\hpfSignal' num2str(i) '.mat'], ...
        ['Data\Filtered\highGammaSignal' num2str(i) '.mat'], ...
        ['Data\Filtered\lowGammaSignal' num2str(i) '.mat'], ...
        ['Data\Filtered\alphaSignal' num2str(i) '.mat'], ...
        ['Data\Filtered\betaSignal' num2str(i) '.mat'], ...
        ['Data\Filtered\thetaSignal' num2str(i) '.mat'], ...
        ['Data\Filtered\deltaSignal' num2str(i) '.mat'], ...
        ['Data\Filtered\infraSlowSignal' num2str(i) '.mat']);
end

load('Filtered\300-3000\hpfSignal1.mat');
figure
pwelch(rawRecording{1}(:, 2), [], [], [], 48000)
pwelch(hpfSignal, [], [], [], 48000)

load('Filtered\O300\hpfSignal1.mat');
figure
pwelch(rawRecording{1}(:, 2), [], [], [], 48000)
pwelch(hpfSignal, [], [], [], 48000)

load('Filtered\highGammaSignal1.mat');
pwelch(highGammaSignal, [], [], [], 1000)



%% 1.4 Convert 1D input signal to a matrix of epochs with 50% overlapping as rows
% divide into epochs of 4 seconds
% (1) get signal epoch matrices
for i = 1 : 6
    
    disp(['Start group ' num2str(i) ' epoch matrices...']);
    
    temp = load(['Data\Filtered\300-3000\hpfSignal' num2str(i) '.mat']);
    disp(['    Generating hpfSignalEpoch' num2str(i) '...']);
    hpfSignalEpoch = getEpochMatrix(temp.hpfSignal, 4, 48000);
    disp(['    Saving hpfSignalEpoch' num2str(i) '.mat...']);
    save(['Data\Epoch\300-3000\hpfSignal' num2str(i) 'Epoch.mat'], ...
        'hpfSignalEpoch', '-v7.3');

    temp = load(['Data\Filtered\O300\hpfSignal' num2str(i) '.mat']);
    disp(['    Generating hpfSignalEpoch' num2str(i) '...']);
    hpfSignalEpoch = getEpochMatrix(temp.hpfSignal, 4, 48000);
    disp(['    Saving hpfSignalEpoch' num2str(i) '.mat...']);
    save(['Data\Epoch\O300\hpfSignal' num2str(i) 'Epoch.mat'], ...
        'hpfSignalEpoch', '-v7.3');


    disp(['    Generating rawSignalEpoch' num2str(i) '...']);
    rawSignalEpoch = getEpochMatrix(rawRecording{1}(:, 2), 4, 48000);
    disp(['    Saving rawSignal' num2str(i) 'Epoch.mat...']);
    save(['Data\Epoch\rawSignal' num2str(i) 'Epoch.mat'], 'rawSignalEpoch', '-v7.3');
    
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


% (2) get depth epoch matrices

% load rawRecording which has depth data integrated in it
temp = load('Data\Raw\rawRecording.mat');

% generate depth epoch matrices
for i = 1 : 6
    
    disp(['Generating depth epoch matrix ' num2str(i) '...']);
    depthData = temp.rawRecording{i}(:, 3);
    depthEpoch = getEpochMatrix(depthData, 4, 48000);
    disp(['    Saving depth' num2str(i) 'Epoch.mat...']);
    save(['Data\Epoch\depth' num2str(i) 'Epoch.mat'], 'depthEpoch', '-v7.3');
    
end



%% 2. Feature Extraction

%% 2.1 Generate feature matrices
for i = 1 : 6
    getFeatureMatrix(i, 13, ...
        ['Data\Epoch\300-3000\hpfSignal' num2str(i) 'Epoch.mat'], ...
        ['Data\Epoch\alphaSignal' num2str(i) 'Epoch.mat'], ...
        ['Data\Epoch\betaSignal' num2str(i) 'Epoch.mat'], ...
        ['Data\Epoch\deltaSignal' num2str(i) 'Epoch.mat'], ...
        ['Data\Epoch\infraSlowSignal' num2str(i) 'Epoch.mat'], ...
        ['Data\Epoch\thetaSignal' num2str(i) 'Epoch.mat'], ...
        ['Data\Epoch\lowGammaSignal' num2str(i) 'Epoch.mat'], ...
        ['Data\Epoch\highGammaSignal' num2str(i) 'Epoch.mat'], ...
    	['Data\Feature\300-3000\featureMatrix' num2str(i) '.mat'])
end

for i = 1 : 6
    getFeatureMatrix(i, 13, ...
        ['Data\Epoch\O300\hpfSignal' num2str(i) 'Epoch.mat'], ...
        ['Data\Epoch\alphaSignal' num2str(i) 'Epoch.mat'], ...
        ['Data\Epoch\betaSignal' num2str(i) 'Epoch.mat'], ...
        ['Data\Epoch\deltaSignal' num2str(i) 'Epoch.mat'], ...
        ['Data\Epoch\infraSlowSignal' num2str(i) 'Epoch.mat'], ...
        ['Data\Epoch\thetaSignal' num2str(i) 'Epoch.mat'], ...
        ['Data\Epoch\lowGammaSignal' num2str(i) 'Epoch.mat'], ...
        ['Data\Epoch\highGammaSignal' num2str(i) 'Epoch.mat'], ...
    	['Data\Feature\O300\featureMatrix' num2str(i) '.mat'])
end

%{
% (1) Spike dependent features
% load hpfSignalEpoch
temp = load('Data\Epoch\hpfSignal1Epoch.mat');
hpfSignalEpoch = temp.hpfSignalEpoch;
numEpoch = size(hpfSignalEpoch, 1);

% Create empty feature matrix
featureMatrix = zeros(numEpoch, 50);

% Load function handle of spike dependent features
sdf = spikeDepFeatures;

for i = 1 : numEpoch
    % spike detection
    spikeLocs = spikeDetection(transpose(hpfSignalEpoch(i, :)));
    % [spikeLocs, spikeAmpls, spikes] = spikeDetection(transpose(hpfSignalEpoch(i, :)));
    
    % (1.1) Mean Inter-Spike Interval (MISI)
    featureMatrix(i, 1) = sdf.misi(spikeLocs);
    % (1.2) Inter-Spike Interval Standard Deviation (SISI)
    featureMatrix(i, 2) = sdf.sisi(spikeLocs);
    % (1.3) Inter-Spike Interval Coefficient of Variation (CVISI)
    featureMatrix(i, 3) = sdf.cvisi(spikeLocs);
    % (1.4) Percentage of Spikes in the Spike Signal (PS)
    featureMatrix(i, 4) = sdf.ps(spikeLocs, transpose(hpfSignalEpoch(i, :)));
    % (1.5) Bursting Rate (BR)
    featureMatrix(i, 5) = sdf.br(spikeLocs, transpose(hpfSignalEpoch(i, :)), 48000);
    % (1.6) Percentage of Bursts (PB)
    featureMatrix(i, 6) = sdf.pb(spikeLocs);
    % (1.7) Firing Rate (FR)
    featureMatrix(i, 7) = sdf.fr(spikeLocs, transpose(hpfSignalEpoch(i, :)), 48000);
end

% (2) Spike independent features
% load filtered signals
load('Data\Epoch\lfp1Epoch.mat');               % lfp signal
numEpoch = size(lfpEpoch, 1);

load('Data\Epoch\alphaSignal1Epoch.mat');       % alpha signal 9Hz - 11Hz
load('Data\Epoch\betaSignal1Epoch.mat');        % beta signal 13Hz - 30Hz
load('Data\Epoch\deltaSignal1Epoch.mat');       % delta signal 1Hz - 4Hz
load('Data\Epoch\infraSlowSignal1Epoch.mat');	% infra-slow signal 1Hz - 4Hz
load('Data\Epoch\thetaSignal1Epoch.mat');       % theta signal 4Hz - 8Hz
load('Data\Epoch\lowGammaSignal1Epoch.mat');	% low gamma signal 30Hz - 50Hz
load('Data\Epoch\highGammaSignal1Epoch.mat');	% high gamma signal 50Hz - 90Hz

% Load function handle of spike dependent features
sdf = spikeIndepFeatures;

for i = 1 : numEpoch
    
    % (2.1) Curve length
    featureMatrix(i, 8) = sdf.curv_len(lfpEpoch(i, :));
    % (2.2) Threshold
    featureMatrix(i, 9) = sdf.thrshld(lfpEpoch(i, :));
    % (2.3) Peaks
    featureMatrix(i, 10) = sdf.peaks(lfpEpoch(i, :));
    % (2.4) Root mean square amplitude
    featureMatrix(i, 11) = sdf.rmsa(lfpEpoch(i, :));
    % (2.5) Average nonlinear energy
    featureMatrix(i, 12) = sdf.avg_nonlnr_energy(lfpEpoch(i, :));
    % (2.6) Zero crossings
    featureMatrix(i, 13) = sdf.zero_crossing(lfpEpoch(i, :));
    
end
%}



%% 2.2 Standardization & Normalization
for i = 1 : 6
    getNormFeatureMatrix(i, ...
        ['Data\Feature\300-3000\featureMatrix' num2str(i) '.mat'], ...
        ['Data\Feature\300-3000\normFeatureMatrix' num2str(i) '.mat']);
end

for i = 1 : 6
    getNormFeatureMatrix(i, ...
        ['Data\Feature\O300\featureMatrix' num2str(i) '.mat'], ...
        ['Data\Feature\O300\normFeatureMatrix' num2str(i) '.mat']);
end



%% 2.3 Scatter plot before transformation
for i = 1 : 6
featureScatterplot( ...
    ['Pairwise Feature Scatter Plots before Transformation ' num2str(i)], ...
    ['Data\Feature\O300\featureMatrix' num2str(i) '.mat'], ...
    ['Figures\O300\Scatterplot\' num2str(i) 'orig.jpg']);
end

for i = 1 : 6
featureScatterplot( ...
    ['Pairwise Scatter Plots of Normalized Feature Matrix before Transformation ' num2str(i)], ...
    ['Data\Feature\O300\normFeatureMatrix' num2str(i) '.mat'], ...
    ['Figures\O300\Scatterplot\' num2str(i) 'norm.jpg']);
end



%% 2.4 Take transformations to make variables follow normal distribution
for i = 1 : 6
featureList = [1, 2, 3, 4, 5, 7, 8, 9, 11, 12];
transformFeatures(featureList, ...
    ['Data\Feature\O300\normFeatureMatrix' num2str(i) '.mat'], ...
    ['Data\Feature\O300\transformNormFeatureMatrix' num2str(i) '.mat']);

transformFeatures(featureList, ...
    ['Data\Feature\300-3000\normFeatureMatrix' num2str(i) '.mat'], ...
    ['Data\Feature\300-3000\transformNormFeatureMatrix' num2str(i) '.mat']);
end



%% 2.5 Scatter plot after transformation
for i = 1 : 6
featureScatterplot( ...
    ['Pairwise Scatter Plots of Normalized Feature Matrix before Transformation ' num2str(i)], ...
    ['Data\Feature\O300\transformNormFeatureMatrix' num2str(i) '.mat'], ...
    ['Figures\O300\Scatterplot\' num2str(i) 'trans.jpg']);
end



%% 3. Feature Activity Maps
% create a matrix to load all STN entries and exits
STNBounds = zeros(6, 2);
STNBounds(1, :) = [2.15, -2.52];
STNBounds(2, :) = [5.94, 1.73];
STNBounds(3, :) = [4.30, 0.62];
STNBounds(4, :) = [1.30, 0.20];
STNBounds(5, :) = [2.50, -2.3];
STNBounds(6, :) = [4.40, 0.34];

location = ["2010-11-30\STN Left\Pass 1", ...
            "2010-11-30\STN Right\Pass 1", ...
            "2010-11-30\STN Right\Pass 2", ...
            "2010-12-07\STN Left\Pass 2", ...
            "2010-12-07\STN Left\Pass 3", ...
            "2010-12-07\STN Right\Pass 2"];

for i = 1 : 6
    plotFeatureMaps(i, ...
        ['Data\Feature\300-3000\transformNormFeatureMatrix' num2str(i) '.mat'], ...
        ['Data\Epoch\depth' num2str(i) 'Epoch.mat'], ...
        ['Figures\300-3000\normFeatureMap_sdf' num2str(i) '.jpg'], ...
        ['Figures\300-3000\normFeatureMap_sif' num2str(i) '.jpg'], ...
        location, STNBounds(i, 1), STNBounds(i, 2));
end

for i = 1 : 6
    plotFeatureMaps(i, ...
        ['Data\Feature\O300\transformNormFeatureMatrix' num2str(i) '.mat'], ...
        ['Data\Epoch\depth' num2str(i) 'Epoch.mat'], ...
        ['Figures\O300\normFeatureMap_sdf' num2str(i) '.jpg'], ...
        ['Figures\O300\normFeatureMap_sif' num2str(i) '.jpg'], ...
        location, STNBounds(i, 1), STNBounds(i, 2));
end



%% 4. Clustering Algorithms

%% 4.1 K-means clustering
%{

idx = kmeans(X, k)
idx = kmeans(X, k, Name, Value)
[idx, C] = kmeans(___)
[idx, C, sumd] = kmeans(___)
[idx, C, sumd, D] = kmeans(___)

Input Arguments:
(1) X — Data
    numeric matrix
(2) k — Number of clusters
    positive integer
(3) Name-Value Pair Arguments
    Specify optional comma-separated pairs of Name,Value arguments. Name
    is the argument name and Value is the corresponding value. Name must
    appear inside single quotes (' '). You can specify several name and
    value pair arguments in any order as Name1, Value1, ..., NameN, ValueN.

    Example:
    'Distance', 'cosine', 'Replicates', 10, 'Options',
    statset('UseParallel',1) specifies the cosine distance,
    10 replicate clusters at different starting values,
    and to use parallel computing.

Output Arguments:
(1) idx — Cluster indices
    numeric column vector
    idx has as many rows as X, and each row indicates the cluster
    assignment of the corresponding observation.
(2) C — Cluster centroid locations
    numeric matrix
    C is a k-by-p matrix, where row j is the centroid of cluster j.
(3) sumd — Within-cluster sums of point-to-centroid distances
    numeric column vector
    sumd is a k-by-1 vector, where element j is the sum of
    point-to-centroid distances within cluster j.
(4) D — Distances from each point to every centroid
    numeric matrix
    D is an n-by-k matrix, where element (j, m) is the distance
    from observation j to centroid m.

%}

for i = 1 : 6
    
    [idx, C, sumd, D] = kMeansClustering( ...
        ['Data\Feature\O300\transformNormFeatureMatrix' num2str(i) '.mat'], ...
        ['Figures\O300\K-Means\k-Means' num2str(i) '.bmp'], ...
        4, 8);
    
    X = importdata(['Data\Epoch\O300\hpfSignal' num2str(i) 'Epoch.mat']);
    epochNum = size(X, 1);
    
    plotGroupSeries(epochNum, idx, ...
        ['Data\Epoch\depth' num2str(i) 'Epoch.mat'], ...
        STNBounds(i, 1), STNBounds(i, 2), 4, ...
        ['Figures\O300\K-Means\groupSeries' num2str(i) '.bmp']);
    
end



%% 4.2 Hierarchical Clustering
X = importdata('Data\Feature\O300\transformNormFeatureMatrix1.mat');
Y1 = pdist(X, 'euclidean');  % euclidean is default
Z1 = linkage(Y1, 'average');
c1 = cophenet(Z1, Y1);       % 0.6942

% use the cophenetic correlation coefficient to compare the results of
% clustering the same data set using different distance calculation methods
% or clustering algorithms

Y2 = pdist(X, 'cityblock');
Z2 = linkage(Y2, 'average');
c2 = cophenet(Z2, Y2);       % 0.6545


dendrogram(Z1);
%{
About dendrogram output:
(1) If there are 30 or fewer data points in the original data set, then each
leaf in the dendrogram corresponds to one data point.
(2) If there are more than 30 data points, then dendrogram collapses lower 
branches so that there are 30 leaf nodes. As a result, some leaves in the
plot correspond to more than one data point.
%}
% specify 4 clusters
idx = cluster(Z1, 'maxclust', 5);

% Visualization from a 2D angle
feature1 = 4;
feature2 = 8;
figure;
plot(X(idx == 1, feature1), X(idx == 1, feature2), 'r.', 'MarkerSize', 12)
hold on
plot(X(idx == 2, feature1), X(idx == 2, feature2), 'b.', 'MarkerSize', 12)
plot(X(idx == 3, feature1), X(idx == 3, feature2), 'c.', 'MarkerSize', 12)
plot(X(idx == 4, feature1), X(idx == 4, feature2), 'g.', 'MarkerSize', 12)
title 'Cluster Assignments and Centroids'
hold off



%% 4.3 DBSCAN clustering

%{
X = importdata('Data\Feature\O300\transformNormFeatureMatrix1.mat');

epsilon = 0.2;
MinPts = 8;
idx = DBSCAN(X, epsilon, MinPts);
tabulate(idx)

% Visualization from a 2D angle
feature1 = 4;
feature2 = 8;
figure;
plot(X(idx == 0, feature1), X(idx == 0, feature2), 'k.', 'MarkerSize', 12)
hold on
plot(X(idx == 1, feature1), X(idx == 1, feature2), 'r.', 'MarkerSize', 12)
plot(X(idx == 2, feature1), X(idx == 2, feature2), 'b.', 'MarkerSize', 12)
plot(X(idx == 3, feature1), X(idx == 3, feature2), 'c.', 'MarkerSize', 12)
plot(X(idx == 4, feature1), X(idx == 4, feature2), 'g.', 'MarkerSize', 12)
title 'Cluster Assignments and Centroids'
hold off
%}

for i = 1 : 6
    
    idx = DBSCANClustering( ...
        ['Data\Feature\O300\transformNormFeatureMatrix' num2str(i) '.mat'], ...
        0.2, 8);
    
    X = importdata(['Data\Epoch\O300\hpfSignal' num2str(i) 'Epoch.mat']);
    epochNum = size(X, 1);
    plotGroupSeries(epochNum, idx, ...
        ['Data\Epoch\depth' num2str(i) 'Epoch.mat'], ...
        STNBounds(1, 1), STNBounds(1, 2), 10, ...
        ['Figures\O300\DBSCAN\groupSeries' num2str(i) '.bmp']);
    
end


