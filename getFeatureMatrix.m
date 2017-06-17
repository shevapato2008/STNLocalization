function [ output_args ] = getFeatureMatrix(index, numFeature, ...
    hpfSignalEpochPath, alphaSignalEpochPath, ...
    betaSignalEpochPath, deltaSignalEpochPath, ...
    infraSlowSignalEpochPath, thetaSignalEpochPath, ...
    lowGammaSignalEpochPath, highGammaSignalEpochPath, ...
    featureMatrixPath, lfpFeatureMatrixPath)
% getFeatureMatrix helps generate a feature matrix containing both
% spike-dependent features and spike independent features. Then save it
% to featureMatrix folder.


disp(['Start generating featureMatrix' num2str(index) '...']);


% (1) Spike dependent features

disp('Creating spike dependent features...')

% load hpfSignalEpoch
hpfSignalEpoch = importdata(hpfSignalEpochPath);
numEpoch = size(hpfSignalEpoch, 1);

% Create empty feature matrix
featureMatrix = zeros(numEpoch, numFeature);

% Load function handle of spike dependent features
sdf = spikeDepFeatures;

for i = 1 : numEpoch
    % spike detection
    [spikeLocs, spikeAmpls] = spikeDetection(transpose(hpfSignalEpoch(i, :)));
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
    % (1.8) Modified Burst Index (MBI)
    featureMatrix(i, 8) = sdf.mbi(spikeLocs);
    % (1.9) Pause Index (PI)
    featureMatrix(i, 9) = sdf.pi(spikeLocs);
    % (1.10) Pause Ratio (PR)
    featureMatrix(i, 10) = sdf.pr(spikeLocs);
    % (1.11) Spike Count (SC)
    featureMatrix(i, 11) = sdf.sc(spikeLocs);
    % (1.12) Mean Spike Amplitude Differential (MSAD)
    featureMatrix(i, 12) = sdf.msad(spikeAmpls);
    
end


% (2) Spike independent features

disp('Creating spike independent features...')

% Load function handle of spike independent features
sif = spikeIndepFeatures;

for i = 1 : numEpoch
    
    % (2.1) Curve length
    featureMatrix(i, 13) = sif.curv_len(hpfSignalEpoch(i, :));
    % (2.2) Threshold
    featureMatrix(i, 14) = sif.thrshld(hpfSignalEpoch(i, :));
    % (2.3) Peaks
    featureMatrix(i, 15) = sif.peaks(hpfSignalEpoch(i, :));
    % (2.4) Root mean square amplitude
    featureMatrix(i, 16) = sif.rmsa(hpfSignalEpoch(i, :));
    % (2.5) Average nonlinear energy
    featureMatrix(i, 17) = sif.avg_nonlnr_energy(hpfSignalEpoch(i, :));
    % (2.6) Zero crossings
    featureMatrix(i, 18) = sif.zero_crossing(hpfSignalEpoch(i, :));
    
end



% (3) lfp-based features
disp('Creating lfp-based features...')

% load lfp-related signals
alphaSignalEpoch = importdata(alphaSignalEpochPath);            % alpha signal 9Hz - 11Hz
betaSignalEpoch = importdata(betaSignalEpochPath);              % beta signal 13Hz - 30Hz
deltaSignalEpoch = importdata(deltaSignalEpochPath);            % delta signal 1Hz - 4Hz
infraSlowSignalEpoch = importdata(infraSlowSignalEpochPath);    % infra-slow signal 0Hz - 1Hz
thetaSignalEpoch = importdata(thetaSignalEpochPath);            % theta signal 4Hz - 8Hz
lowGammaSignalEpoch = importdata(lowGammaSignalEpochPath);      % low gamma signal 30Hz - 50Hz
highGammaSignalEpoch = importdata(highGammaSignalEpochPath);    % high gamma signal 50Hz - 90Hz

% Load function handle of lfp dependent features
ldf = lfpDepFeatures;
lfpFeatureMatrix = zeros(size(alphaSignalEpoch, 1), 35);

% (3.1) alpha band (9 - 11 Hz) related features
for i = 1 : numEpoch
    
    % (3.1.1) Power band ratio of signal X in frequency band W (similar to RMSA)
    lfpFeatureMatrix(i, 1) = ldf.powerxw(alphaSignalEpoch(i, :), 9, 11);
    % (3.1.2) Peak to average power ratio of signal X in frequency band W (PKXw)
    lfpFeatureMatrix(i, 2) = ldf.pkxw(alphaSignalEpoch(i, :), 9, 11, 1000);
    % (3.1.3) Frequency corresponding to maximum peak to average power ratio of 
    %         signal X in frequency band W (FmaxPKXw)
    lfpFeatureMatrix(i, 3) = ldf.fmaxpkxw(alphaSignalEpoch(i, :), 9, 11, 1000);
    % (3.1.4) Coefficient of variation of signal X in frequency band W (CVXw)
    lfpFeatureMatrix(i, 4) = ldf.cvxw(alphaSignalEpoch(i, :));
    % (3.1.5) Percentage of zero crossings in signal X (ZeroCrossX)
    lfpFeatureMatrix(i, 5) = ldf.zerocrossxw(alphaSignalEpoch(i, :));
    
end

% (3.2) beta band (13 - 30 Hz) related features
for i = 1 : numEpoch
    
    % (3.2.1) Power band ratio of signal X in frequency band W (similar to RMSA)
    lfpFeatureMatrix(i, 6) = ldf.powerxw(betaSignalEpoch(i, :), 13, 30);
    % (3.2.2) Peak to average power ratio of signal X in frequency band W (PKXw)
    lfpFeatureMatrix(i, 7) = ldf.pkxw(betaSignalEpoch(i, :), 13, 30, 1000);
    % (3.2.3) Frequency corresponding to maximum peak to average power ratio of 
    %         signal X in frequency band W (FmaxPKXw)
    lfpFeatureMatrix(i, 8) = ldf.fmaxpkxw(betaSignalEpoch(i, :), 13, 30, 1000);
    % (3.2.4) Coefficient of variation of signal X in frequency band W (CVXw)
    lfpFeatureMatrix(i, 9) = ldf.cvxw(betaSignalEpoch(i, :));
    % (3.2.5) Percentage of zero crossings in signal X (ZeroCrossX)
    lfpFeatureMatrix(i, 10) = ldf.zerocrossxw(betaSignalEpoch(i, :));
    
end

% (3.3) delta band (1 - 4 Hz) related features
for i = 1 : numEpoch
    
    % (3.3.1) Power band ratio of signal X in frequency band W (similar to RMSA)
    lfpFeatureMatrix(i, 11) = ldf.powerxw(deltaSignalEpoch(i, :), 1, 4);
    % (3.3.2) Peak to average power ratio of signal X in frequency band W (PKXw)
    lfpFeatureMatrix(i, 12) = ldf.pkxw(deltaSignalEpoch(i, :), 1, 4, 1000);
    % (3.3.3) Frequency corresponding to maximum peak to average power ratio of 
    %         signal X in frequency band W (FmaxPKXw)
    lfpFeatureMatrix(i, 13) = ldf.fmaxpkxw(deltaSignalEpoch(i, :), 1, 4, 1000);
    % (3.3.4) Coefficient of variation of signal X in frequency band W (CVXw)
    lfpFeatureMatrix(i, 14) = ldf.cvxw(deltaSignalEpoch(i, :));
    % (3.3.5) Percentage of zero crossings in signal X (ZeroCrossX)
    lfpFeatureMatrix(i, 15) = ldf.zerocrossxw(deltaSignalEpoch(i, :));
    
end

% (3.4) infra-slow band (0 - 1 Hz) related features
for i = 1 : numEpoch
    
    % (3.4.1) Power band ratio of signal X in frequency band W (similar to RMSA)
    lfpFeatureMatrix(i, 16) = ldf.powerxw(infraSlowSignalEpoch(i, :), 0, 1);
    % (3.4.2) Peak to average power ratio of signal X in frequency band W (PKXw)
    lfpFeatureMatrix(i, 17) = ldf.pkxw(infraSlowSignalEpoch(i, :), 0, 1, 1000);
    % (3.4.3) Frequency corresponding to maximum peak to average power ratio of 
    %         signal X in frequency band W (FmaxPKXw)
    lfpFeatureMatrix(i, 18) = ldf.fmaxpkxw(infraSlowSignalEpoch(i, :), 0, 1, 1000);
    % (3.4.4) Coefficient of variation of signal X in frequency band W (CVXw)
    lfpFeatureMatrix(i, 19) = ldf.cvxw(infraSlowSignalEpoch(i, :));
    % (3.4.5) Percentage of zero crossings in signal X (ZeroCrossX)
    lfpFeatureMatrix(i, 20) = ldf.zerocrossxw(infraSlowSignalEpoch(i, :));
    
end

% (3.5) theta band (4 - 8 Hz) related features
for i = 1 : numEpoch
    
    % (3.5.1) Power band ratio of signal X in frequency band W (similar to RMSA)
    lfpFeatureMatrix(i, 21) = ldf.powerxw(thetaSignalEpoch(i, :), 4, 8);
    % (3.5.2) Peak to average power ratio of signal X in frequency band W (PKXw)
    lfpFeatureMatrix(i, 22) = ldf.pkxw(thetaSignalEpoch(i, :), 4, 8, 1000);
    % (3.5.3) Frequency corresponding to maximum peak to average power ratio of 
    %         signal X in frequency band W (FmaxPKXw)
    lfpFeatureMatrix(i, 23) = ldf.fmaxpkxw(thetaSignalEpoch(i, :), 4, 8, 1000);
    % (3.5.4) Coefficient of variation of signal X in frequency band W (CVXw)
    lfpFeatureMatrix(i, 24) = ldf.cvxw(thetaSignalEpoch(i, :));
    % (3.5.5) Percentage of zero crossings in signal X (ZeroCrossX)
    lfpFeatureMatrix(i, 25) = ldf.zerocrossxw(thetaSignalEpoch(i, :));
    
end

% (3.6) low gamma band (30 - 50 Hz) related features
for i = 1 : numEpoch
    
    % (3.6.1) Power band ratio of signal X in frequency band W (similar to RMSA)
    lfpFeatureMatrix(i, 26) = ldf.powerxw(lowGammaSignalEpoch(i, :), 30, 50);
    % (3.6.2) Peak to average power ratio of signal X in frequency band W (PKXw)
    lfpFeatureMatrix(i, 27) = ldf.pkxw(lowGammaSignalEpoch(i, :), 30, 50, 1000);
    % (3.6.3) Frequency corresponding to maximum peak to average power ratio of 
    %         signal X in frequency band W (FmaxPKXw)
    lfpFeatureMatrix(i, 28) = ldf.fmaxpkxw(lowGammaSignalEpoch(i, :), 30, 50, 1000);
    % (3.6.4) Coefficient of variation of signal X in frequency band W (CVXw)
    lfpFeatureMatrix(i, 29) = ldf.cvxw(lowGammaSignalEpoch(i, :));
    % (3.6.5) Percentage of zero crossings in signal X (ZeroCrossX)
    lfpFeatureMatrix(i, 30) = ldf.zerocrossxw(lowGammaSignalEpoch(i, :));
    
end

% (3.7) high gamma band (50 - 90 Hz) related features
for i = 1 : numEpoch
    
    % (3.7.1) Power band ratio of signal X in frequency band W (similar to RMSA)
    lfpFeatureMatrix(i, 31) = ldf.powerxw(highGammaSignalEpoch(i, :), 50, 90);
    % (3.7.2) Peak to average power ratio of signal X in frequency band W (PKXw)
    lfpFeatureMatrix(i, 32) = ldf.pkxw(highGammaSignalEpoch(i, :), 50, 90, 1000);
    % (3.7.3) Frequency corresponding to maximum peak to average power ratio of 
    %         signal X in frequency band W (FmaxPKXw)
    lfpFeatureMatrix(i, 33) = ldf.fmaxpkxw(highGammaSignalEpoch(i, :), 50, 90, 1000);
    % (3.7.4) Coefficient of variation of signal X in frequency band W (CVXw)
    lfpFeatureMatrix(i, 34) = ldf.cvxw(highGammaSignalEpoch(i, :));
    % (3.7.5) Percentage of zero crossings in signal X (ZeroCrossX)
    lfpFeatureMatrix(i, 35) = ldf.zerocrossxw(highGammaSignalEpoch(i, :));
    
end


% (4) Deal with missing values: last observation carried forward
for j = 1 : numFeature
    for i = 1 : numEpoch
        if i == 1 && isnan(featureMatrix(i, j))
            featureMatrix(i, j) = 0;
        elseif isnan(featureMatrix(i, j))
            featureMatrix(i, j) = featureMatrix(i - 1, j);
        end
    end
end


disp(['Saving featureMatrix' num2str(index) '...']);
save(featureMatrixPath, 'featureMatrix', '-v7.3');


disp(['Saving lfpFeatureMatrix' num2str(index) '...']);
save(lfpFeatureMatrixPath, 'lfpFeatureMatrix', '-v7.3');


end

