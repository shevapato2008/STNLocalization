function noise = getWhiteNoise(fs, timeSpan, mu, sigma)
% function getWhiteNoise() generates Gaussian White Noise (GWN)

% create the noise
fs = 48000;                 % Sampling frequency
t = 0 : 1/fs : timeSpan;	% Time vector: t
mu = 1000;
sigma = 100;
noise = mu + sigma * randn(size(t));

%% Plots GWN
% noise plot
% figure(1)
% plot(noise)
% title('White Noise');
% xlabel('Samples');
% ylabel('Sample Values');
% grid on;

%% plot power spectral density of GWN
% time domain to frequency domain
% figure(2)
% pwelch(noise, [], [], [], fs)

end

