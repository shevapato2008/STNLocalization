%% Set current folder %%
cd('S:\Google Drive\Rutgers University\Research\DBS\Project\Matlab\Program')


%% Load raw signal, LFP signal, and depth data %%

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



%% Merge signal with depth data
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



%% Generate filtered data
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
figure
pwelch(rawRecording{1}(:, 2), [], [], [], 48000)
pwelch(hpfSignal, [], [], [], 48000)

load('Filtered\highGammaSignal1.mat');
pwelch(highGammaSignal, [], [], [], 1000)



%% Convert 1D input signal to a matrix of epochs with 50% overlapping as rows
% divide into epochs of 4 seconds
% (1) get signal epoch matrices
for i = 1 : 6
    
    disp(['Start group ' num2str(i) ' epoch matrices...']);
    
    temp = load(['Data\Filtered\hpfSignal' num2str(i) '.mat']);
    disp(['    Generating hpfSignalEpoch' num2str(i) '...']);
    hpfSignalEpoch = getEpochMatrix(temp.hpfSignal, 4, 48000);
    disp(['    Saving hpfSignalEpoch' num2str(i) '.mat...']);
    save(['Data\Epoch\hpfSignal' num2str(i) 'Epoch.mat'], 'hpfSignalEpoch', '-v7.3');

    temp = load(['Data\Filtered\lfp' num2str(i) '.mat']);
    disp(['    Generating lfpEpoch' num2str(i) '...']);
    lfpEpoch = getEpochMatrix(temp.lfp, 4, 1000);
    disp(['    Saving lfpEpoch' num2str(i) '.mat...']);
    save(['Data\Epoch\lfp' num2str(i) 'Epoch.mat'], 'lfpEpoch', '-v7.3');
    
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



%% Generate feature matrices

for i = 1 : 6
    getFeatureMatrix(i, 13, ...
        ['Data\Epoch\hpfSignal' num2str(i) 'Epoch.mat'], ...
        ['Data\Epoch\lfp' num2str(i) 'Epoch.mat'], ...
        ['Data\Epoch\alphaSignal' num2str(i) 'Epoch.mat'], ...
        ['Data\Epoch\betaSignal' num2str(i) 'Epoch.mat'], ...
        ['Data\Epoch\deltaSignal' num2str(i) 'Epoch.mat'], ...
        ['Data\Epoch\infraSlowSignal' num2str(i) 'Epoch.mat'], ...
        ['Data\Epoch\thetaSignal' num2str(i) 'Epoch.mat'], ...
        ['Data\Epoch\lowGammaSignal' num2str(i) 'Epoch.mat'], ...
        ['Data\Epoch\highGammaSignal' num2str(i) 'Epoch.mat'], ...
    	['Data\Feature\featureMatrix' num2str(i) '.mat'])
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



%% Normalization

for i = 1 : 6
    getNormFeatureMatrix(i, ...
        ['Data\Feature\featureMatrix' num2str(i) '.mat'], ...
        ['Data\Feature\normFeatureMatrix' num2str(i) '.mat']);
end



%% Generate Activity Maps

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
        ['Data\Feature\normFeatureMatrix' num2str(i) '.mat'], ...
        ['Data\Epoch\depth' num2str(i) 'Epoch.mat'], ...
        ['Figures\normFeatureMap_sdf' num2str(i) '.jpg'], ...
        ['Figures\normFeatureMap_sif' num2str(i) '.jpg'], ...
        location, STNBounds(i, 1), STNBounds(i, 2));
end









