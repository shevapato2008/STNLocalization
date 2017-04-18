function applyFilters(rawSignal, lfp, ...
    hpfSignalPath, highGammaSignalPath, lowGammaSignalPath, ...
    alphaSignalPath, betaSignalPath, thetaSignalPath, ...
    deltaSignalPath, infraSlowSignalPath)

% (1) High-pass filter for Spikes - 48 kHz filter
disp('    Generating and saving high-pass filtered signal...');
hpfSignal = filtfilt(filter.HPFilt_300_3000, rawSignal);
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

