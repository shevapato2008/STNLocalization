%% Set current folder
cd('S:\Google Drive\Rutgers University\Research\DBS\Project\Matlab\Program')

%{
%% Design anti-aliasing filter
AAFilt_3000_3200 = designfilt('lowpassfir', ...
    'PassbandFrequency', 3000, ...
    'StopbandFrequency', 3200, ...
    'PassbandRipple', 0.0000001, ...
    'StopbandAttenuation', 65, ...
    'DesignMethod', 'equiripple', ...
    'SampleRate', 48000);
fvtool(AAFilt_3000_3200)
saveas(gcf, 'Filters\AAFilt_3000_3200.png')
save('Filters\AAFilt_3000_3200.mat', 'AAFilt_3000_3200')
%}


%% Design low-pass filters
%{
LPFilt_110_119_6kHz = designfilt('lowpassfir', ...
    'PassbandFrequency', 110, ...       % was 185 before
    'StopbandFrequency', 119, ...
    'PassbandRipple', 0.0001, ...
    'StopbandAttenuation', 65, ...
    'DesignMethod', 'equiripple', ...
    'SampleRate', 6000);
fvtool(LPFilt_110_119_6kHz)
saveas(gcf, 'Filters\LPFilt_110_119_6kHz.png')
save('Filters\LPFilt_110_119_6kHz.mat', 'LPFilt_110_119_6kHz')


LPFilt_110_119_48kz = designfilt('lowpassfir', ...
    'PassbandFrequency', 110, ...       % was 185 before
    'StopbandFrequency', 119, ...
    'PassbandRipple', 0.0001, ...
    'StopbandAttenuation', 65, ...
    'DesignMethod', 'equiripple', ...
    'SampleRate', 48000);
fvtool(LPFilt_110_119_48kHz)
saveas(gcf, 'Filters\LPFilt_110_119_48kHz.png')
save('Filters\LPFilt_110_119_48kHz.mat', 'LPFilt_110_119_48kHz')


LPFilt_50_59 = designfilt('lowpassfir', ...
    'PassbandFrequency', 50, ...        % was 185 before
    'StopbandFrequency', 59, ...
    'PassbandRipple', 0.0001, ...
    'StopbandAttenuation', 65, ...
    'DesignMethod', 'equiripple', ...
    'SampleRate', 6000);
fvtool(LPFilt_50_59)
saveas(gcf, 'Filters\LPFilt_50_59.png')
save('Filters\LPFilt_50_59.mat', 'LPFilt_50_59')
%}



%% Design high-pass filters
HPFilt_300 = designfilt('highpassfir', ...
    'StopbandFrequency', 285, ...
    'PassbandFrequency', 300, ...
    'PassbandRipple', 0.001, ...
    'StopbandAttenuation', 65, ...
    'SampleRate', 48000, ...
    'DesignMethod', 'equiripple');
fvtool(HPFilt_300)
title('High Pass Filter (> 300 Hz)')
saveas(gcf, 'Filters\HPFilt_300.png')
save('Filters\HPFilt_300.mat', 'HPFilt_300')

% load('Filters\HPFilt_300.mat');
% fvtool(HPFilt_300)
% title('High Pass Filter (> 300 Hz)')



%% Design band-pass filters
% according to R. Q. Quiroga's 2015 paper.
HPFilt_300_3000 = designfilt('bandpassfir', ...
                    'StopbandFrequency1', 285, 'PassbandFrequency1', 300, ...
                    'PassbandFrequency2', 3000, 'StopbandFrequency2', 3015, ...
                    'StopbandAttenuation1', 65, ...
                    'PassbandRipple', 0.001, ...
                    'StopbandAttenuation2', 65, ...
                    'SampleRate', 48000, ...
                    'DesignMethod', 'equiripple');
fvtool(HPFilt_300_3000)
title('High Pass Filter (300-3000 Hz)')
saveas(gcf, 'Filters\HPFilt_300_3000.png')
save('Filters\HPFilt_300_3000.mat', 'HPFilt_300_3000')

% load('Filters\HPFilt_300_3000.mat');
% fvtool(HPFilt_300_3000)
% title('High Pass Filter (300-3000 Hz)')



% according to Dr. Stephen Wong's 2009 paper.
HPFilt_500_8000 = designfilt('bandpassfir', ...
                    'StopbandFrequency1', 485, 'PassbandFrequency1', 500, ...
                    'PassbandFrequency2', 8000, 'StopbandFrequency2', 8015, ...
                    'StopbandAttenuation1', 65, ...
                    'PassbandRipple', 0.001, ...
                    'StopbandAttenuation2', 65, ...
                    'SampleRate', 48000, ...
                    'DesignMethod', 'equiripple');
fvtool(HPFilt_500_8000)
title('High Pass Filter (500-8000 Hz)')
saveas(gcf, 'Filters\HPFilt_500_8000.png')
save('Filters\HPFilt_500_8000.mat', 'HPFilt_500_8000')

% load('Filters\HPFilt_500_8000.mat');
% fvtool(HPFilt_500_8000)
% title('High Pass Filter (500-8000 Hz)')



% high gamma filter 50Hz - 90Hz
% Source: https://en.wikipedia.org/wiki/Gamma_wave
highGammaFilter = designfilt('bandpassfir', ...
                    'StopbandFrequency1', 49, 'PassbandFrequency1', 50, ...
                    'PassbandFrequency2', 90, 'StopbandFrequency2', 91, ...
                    'StopbandAttenuation1', 60, ...
                    'PassbandRipple', 0.001, ...
                    'StopbandAttenuation2', 60, ...
                    'SampleRate', 1000, ...
                    'DesignMethod', 'equiripple');
fvtool(highGammaFilter)
title('High Gamma Filter (50 - 90 Hz)')
saveas(gcf, 'Filters\highGammaFilter.png')
save('Filters\highGammaFilter.mat', 'highGammaFilter')

% load('Filters\highGammaFilter.mat');
% fvtool(highGammaFilter)
% title('High Gamma Filter (50 - 90 Hz)')


% low gamma filter 30Hz - 50Hz
% Source: https://en.wikipedia.org/wiki/Gamma_wave
lowGammaFilter = designfilt('bandpassfir', ...
                    'StopbandFrequency1', 29, 'PassbandFrequency1', 30, ...
                    'PassbandFrequency2', 50, 'StopbandFrequency2', 51, ...
                    'StopbandAttenuation1', 60, ...
                    'PassbandRipple', 0.001, ...
                    'StopbandAttenuation2', 60, ...
                    'SampleRate', 1000, ...
                    'DesignMethod', 'equiripple');
fvtool(lowGammaFilter)
title('Low Gamma Filter (30 - 50 Hz)')
saveas(gcf, 'Filters\lowGammaFilter.png')
save('Filters\lowGammaFilter.mat', 'lowGammaFilter')

% load('Filters\lowGammaFilter.mat');
% fvtool(lowGammaFilter)
% title('Low Gamma Filter (30 - 50 Hz)')


% alpha filter 8Hz - 12Hz
% Source: https://en.wikipedia.org/wiki/Alpha_wave
alphaFilter = designfilt('bandpassfir', ...
                    'StopbandFrequency1', 7.5, 'PassbandFrequency1', 8, ...
                    'PassbandFrequency2', 12, 'StopbandFrequency2', 12.5, ...
                    'StopbandAttenuation1', 60, ...
                    'PassbandRipple', 0.001, ...
                    'StopbandAttenuation2', 60, ...
                    'SampleRate', 1000, ...
                    'DesignMethod', 'equiripple');
fvtool(alphaFilter)
title('Alpha Filter (8 - 12 Hz)')
saveas(gcf, 'Filters\alphaFilter.png')
save('Filters\alphaFilter.mat', 'alphaFilter')

% load('Filters\alphaFilter.mat');
% fvtool(alphaFilter)
% title('Alpha Filter (8 - 12 Hz)')


% beta filter 13Hz - 30Hz
betaFilter = designfilt('bandpassfir', ...
                    'StopbandFrequency1', 12.5, 'PassbandFrequency1', 13, ...
                    'PassbandFrequency2', 30, 'StopbandFrequency2', 30.5, ...
                    'StopbandAttenuation1', 60, ...
                    'PassbandRipple', 0.001, ...
                    'StopbandAttenuation2', 60, ...
                    'SampleRate', 1000, ...
                    'DesignMethod', 'equiripple');
fvtool(betaFilter)
title('Beta Filter (13 - 30 Hz)')
saveas(gcf, 'Filters\betaFilter.png')
save('Filters\betaFilter.mat', 'betaFilter')

% load('Filters\betaFilter.mat');
% fvtool(betaFilter)
% title('Beta Filter (13 - 30 Hz)')


% theta filter 4Hz - 8Hz
thetaFilter = designfilt('bandpassfir', ...
                    'StopbandFrequency1', 3.75, 'PassbandFrequency1', 4, ...
                    'PassbandFrequency2', 8, 'StopbandFrequency2', 8.25, ...
                    'StopbandAttenuation1', 60, ...
                    'PassbandRipple', 0.001, ...
                    'StopbandAttenuation2', 60, ...
                    'SampleRate', 1000, ...
                    'DesignMethod', 'equiripple');
fvtool(thetaFilter)
title('Theta Filter (4 - 8 Hz)')
saveas(gcf, 'Filters\thetaFilter.png')
save('Filters\thetaFilter.mat', 'thetaFilter')

% load('Filters\thetaFilter.mat');
% fvtool(thetaFilter)
% title('Theta Filter (4 - 8 Hz)')


% delta filter 1Hz - 4Hz
deltaFilter = designfilt('bandpassfir', ...
                    'StopbandFrequency1', 0.5, 'PassbandFrequency1', 1, ...
                    'PassbandFrequency2', 4, 'StopbandFrequency2', 4.5, ...
                    'StopbandAttenuation1', 60, ...
                    'PassbandRipple', 0.01, ...
                    'StopbandAttenuation2', 60, ...
                    'SampleRate', 1000, ...
                    'DesignMethod', 'equiripple');
fvtool(deltaFilter)
title('Delta Filter (1 - 4 Hz)')
saveas(gcf, 'Filters\deltaFilter.png')
save('Filters\deltaFilter.mat', 'deltaFilter')

% load('Filters\deltaFilter.mat');
% fvtool(deltaFilter)
% title('Delta Filter (1 - 4 Hz)')


% Infra-Slow Oscillation 0.1-1 Hz
% use low-pass filter (1 1.4) instead of bandpass filter
infraSlowFilter = designfilt('lowpassfir', ...
                    'PassbandFrequency', 1, ...
                    'StopbandFrequency', 1.4, ...
                    'PassbandRipple', 0.001, ...
                    'StopbandAttenuation', 60, ...
                    'SampleRate', 1000, ...
                    'DesignMethod', 'equiripple');
fvtool(infraSlowFilter)
title('Infra Slow Filter (0 - 1 Hz)')
saveas(gcf, 'Filters\infraSlowFilter.png')
save('Filters\infraSlowFilter.mat', 'infraSlowFilter')

% load('Filters\infraSlowFilter.mat');
% fvtool(infraSlowFilter)
% title('Infra Slow Filter (0 - 1 Hz)')

