function [ output_args ] = getFeatureMatrix(index, numFeatures, ...
    hpfSignalEpochPath, alphaSignalEpochPath, ...
    betaSignalEpochPath, deltaSignalEpochPath, ...
    infraSlowSignalEpochPath, thetaSignalEpochPath, ...
    lowGammaSignalEpochPath, highGammaSignalEpochPath, ...
    featureMatrixPath)
% getFeatureMatrix helps generate a feature matrix containing both
% spike-dependent features and spike independent features. Then save it
% to featureMatrix folder.

disp(['Start generating featureMatrix' num2str(index) '...']);

% (1) Spike dependent features

disp('Creating spike dependent features...')

% load hpfSignalEpoch
temp = load(hpfSignalEpochPath);
hpfSignalEpoch = temp.hpfSignalEpoch;
numEpoch = size(hpfSignalEpoch, 1);

% Create empty feature matrix
featureMatrix = zeros(numEpoch, numFeatures);

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

disp('Creating spike independent features...')

% load filtered signals
load(alphaSignalEpochPath);         % alpha signal 9Hz - 11Hz
load(betaSignalEpochPath);          % beta signal 13Hz - 30Hz
load(deltaSignalEpochPath);         % delta signal 1Hz - 4Hz
load(infraSlowSignalEpochPath);     % infra-slow signal 1Hz - 4Hz
load(thetaSignalEpochPath);         % theta signal 4Hz - 8Hz
load(lowGammaSignalEpochPath);      % low gamma signal 30Hz - 50Hz
load(highGammaSignalEpochPath);     % high gamma signal 50Hz - 90Hz

% Load function handle of spike dependent features
sif = spikeIndepFeatures;

for i = 1 : numEpoch
    
    % (2.1) Curve length
    featureMatrix(i, 8) = sif.curv_len(hpfSignalEpoch(i, :));
    % (2.2) Threshold
    featureMatrix(i, 9) = sif.thrshld(hpfSignalEpoch(i, :));
    % (2.3) Peaks
    featureMatrix(i, 10) = sif.peaks(hpfSignalEpoch(i, :));
    % (2.4) Root mean square amplitude
    featureMatrix(i, 11) = sif.rmsa(hpfSignalEpoch(i, :));
    % (2.5) Average nonlinear energy
    featureMatrix(i, 12) = sif.avg_nonlnr_energy(hpfSignalEpoch(i, :));
    % (2.6) Zero crossings
    featureMatrix(i, 13) = sif.zero_crossing(hpfSignalEpoch(i, :));
    
end


% (3) Spike independent features
disp('Creating lfp-based features...')


disp(['Saving featureMatrix' num2str(index) '...']);
save(featureMatrixPath, 'featureMatrix', '-v7.3');

end

