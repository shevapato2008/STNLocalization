function applyFilters(rawSignal, lfp, ...
    hpfSignalPath, highGammaSignalPath, ...
    lowGammaSignalPath, alphaSignalPath, betaSignalPath, ...
    thetaSignalPath, deltaSignalPath, infraSlowSignalPath)

%% Load filters
% (1) High-pass filter for Spikes - 48 kHz filter
disp('    loading high-pass filters...');
% load('Filters\HPFilt_300_3000.mat');
    % fvtool(filter.HPFilt_300_3000)      % choose 300-3000 Hz: according to 
    % title('High-pass filter 300-3000')  % R. Q. Quiroga's 2015 paper.
load('Filters\HPFilt_300.mat');
    % fvtool(HPFilt_300)
    % title('High Pass Filter (> 300 Hz)')

% (2) Band-pass filters for the given LFP - 1 kHz filters
disp('    loading band-pass filters...');
% (2.1) high gamma filter 50Hz - 90Hz
load('Filters\highGammaFilter.mat');
    % fvtool(highGammaFilter)
    % title('High Gamma Filter')
% (2.2) low gamma filter 30Hz - 50Hz
load('Filters\lowGammaFilter.mat');
    % fvtool(lowGammaFilter)
    % title('Low Gamma Filter')
% (2.3) alpha filter 9Hz - 11Hz
load('Filters\alphaFilter.mat');
    % fvtool(alphaFilter)
    % title('Alpha Filter')
% (2.4) beta filter 13Hz - 30Hz
load('Filters\betaFilter.mat');
    % fvtool(betaFilter)
    % title('Beta Filter')
% (2.5) theta filter 4Hz - 8Hz
load('Filters\thetaFilter.mat');
    % fvtool(thetaFilter)
    % title('Theta Filter')
% (2.6) delta filter 1Hz - 4Hz
load('Filters\deltaFilter.mat');
    % fvtool(deltaFilter)
    % title('Delta Filter')
% (2.7) Infra-Slow Oscillation 0.1-1 Hz
load('Filters\infraSlowFilter.mat');
    % fvtool(infraSlowFilter)
    % title('Infra Slow Filter')

%% Apply filters
% (1) High-pass filters for Spikes - 48 kHz
% (1.1) high-pass filter 300 - 3000 Hz
% disp('    Generating and saving high-pass filtered signal...');
% hpfSignal = filtfilt(HPFilt_300_3000, rawSignal);
% save(hpfSignalPath1, varname(hpfSignal));

% (1.2) high-pass filter over 300 Hz
disp('    Generating and saving high-pass filtered signal...');
hpfSignal = filtfilt(HPFilt_300, rawSignal);
save(hpfSignalPath, varname(hpfSignal));

% (2) Band-pass filters for the given LFP - 1 kHz filters
disp('    Generating and saving band-pass filtered signals...');
% (2.1) high gamma filter 50Hz - 90Hz
highGammaSignal = filtfilt(highGammaFilter, lfp);
save(highGammaSignalPath, varname(highGammaSignal));

% (2.2) low gamma filter 30Hz - 50Hz
lowGammaSignal = filtfilt(lowGammaFilter, lfp);
save(lowGammaSignalPath, varname(lowGammaSignal));

% (2.3) alpha filter 9Hz - 11Hz
alphaSignal = filtfilt(alphaFilter, lfp);
save(alphaSignalPath, varname(alphaSignal));

% (2.4) beta filter 13Hz - 30Hz
betaSignal = filtfilt(betaFilter, lfp);
save(betaSignalPath, varname(betaSignal));

% (2.5) theta filter 4Hz - 8Hz
thetaSignal = filtfilt(thetaFilter, lfp);
save(thetaSignalPath, varname(thetaSignal));

% (2.6) delta filter 1Hz - 4Hz
deltaSignal = filtfilt(deltaFilter, lfp);
save(deltaSignalPath, varname(deltaSignal));

% (2.7) Infra-Slow Oscillation 0.1-1 Hz - Actually a low-pass filter
infraSlowSignal = filtfilt(infraSlowFilter, lfp);
save(infraSlowSignalPath, varname(infraSlowSignal));

end

