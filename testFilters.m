%% Test "high-pass" filters
% Generate Gaussian White Noise (GWN) for high pass filters
fs = 48000;     % Sampling frequency
timeSpan = 10;  % time span of the noise
mu = 1000;      % average
sigma = 100;    % standard deviation
noise = getWhiteNoise(fs, timeSpan, mu, sigma);

% Apply "high-pass" filters
figure
ax(1) = subplot(3, 1, 1);
pwelch(noise, [], [], [], fs)
title('White Noise');
xlabel('Samples');
ylabel('Sample Values');
grid on;

ax(2) = subplot(3, 1, 2);
load('Filters\HPFilt_300_3000.mat');
HPFilt_300_3000Signal = filtfilt(HPFilt_300_3000, noise);
pwelch(HPFilt_300_3000Signal, [], [], [], fs)
title('High-Pass Filtered Signal (300-3000 Hz)')

ax(3) = subplot(3, 1, 3);
load('Filters\HPFilt_300.mat');
HPFilt_300Signal = filtfilt(HPFilt_300, noise);
pwelch(HPFilt_300Signal, [], [], [], fs)
title('High-Pass Filtered Signal (> 300 Hz)')

saveFigure(gcf, 'Figures\testFilters_hpf.jpg');
close all;



%% Test "lfp" filters
% Generate Gaussian White Noise (GWN) for "lfp" filters
fs = 1000;      % Sampling frequency
timeSpan = 10;  % time span of the noise
mu = 1000;      % average
sigma = 100;    % standard deviation
noise = getWhiteNoise(fs, timeSpan, mu, sigma);

% Apply "lfp" filters
figure
ax(1) = subplot(4, 2, 1);
pwelch(noise, [], [], [], fs)
title('White Noise');
xlabel('Samples');
ylabel('Sample Values');
grid on;

ax(2) = subplot(4, 2, 2);
load('Filters\deltaFilter.mat');
deltaSignal = filtfilt(deltaFilter, noise);
pwelch(deltaSignal, [], [], [], fs)
title('Delta Signal (1 - 4 Hz)')

ax(3) = subplot(4, 2, 3);
load('Filters\thetaFilter.mat');
thetaSignal = filtfilt(thetaFilter, noise);
pwelch(thetaSignal, [], [], [], fs)
title('Theta Signal (4 - 8 Hz)')

ax(4) = subplot(4, 2, 4);
load('Filters\alphaFilter.mat');
alphaSignal = filtfilt(alphaFilter, noise);
pwelch(alphaSignal, [], [], [], fs)
title('Alpha Signal (9 - 11 Hz)')

ax(5) = subplot(4, 2, 5);
load('Filters\betaFilter.mat');
betaSignal = filtfilt(betaFilter, noise);
pwelch(betaSignal, [], [], [], fs)
title('Beta Signal (13 - 30 Hz)')

ax(6) = subplot(4, 2, 6);
load('Filters\lowGammaFilter.mat');
lowGammaSignal = filtfilt(lowGammaFilter, noise);
pwelch(lowGammaSignal, [], [], [], fs)
title('Low Gamma Signal (30 - 50 Hz)')

ax(7) = subplot(4, 2, 7);
load('Filters\highGammaFilter.mat');
highGammaSignal = filtfilt(highGammaFilter, noise);
pwelch(highGammaSignal, [], [], [], fs)
title('High Gamma Signal (50 - 90 Hz)')

saveFigure(gcf, 'Figures\testFilters_lfp.jpg');
close all;

