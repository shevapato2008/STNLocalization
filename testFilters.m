%% Generate Gaussian White Noise (GWN)

% Method 1
% create the noise
fs = 1000;              % Sampling frequency
t = 0 : 1/fs : 10;      % Time vector: t
mu = 1000;
sigma = 100;
noise = mu + sigma * randn(size(t));

%% Plots GWN
% noise plot
figure(1)
plot(noise1)
title('White Noise');
xlabel('Samples');
ylabel('Sample Values');
grid on;

% power spectral density (time domain to frequency domain)
figure(2)
pwelch(noise, [], [], [], fs)


%% Apply filter
load('Filters\lowGammaFilter.mat');
lowGammaSignal = filter(lowGammaFilter, noise);
pwelch(lowGammaSignal, [], [], [], fs)

load('Filters\highGammaFilter.mat');
highGammaSignal = filter(highGammaFilter, noise);
pwelch(highGammaSignal, [], [], [], fs)

load('Filters\thetaFilter.mat');
thetaSignal = filter(thetaFilter, noise);
pwelch(thetaSignal, [], [], [], fs)
