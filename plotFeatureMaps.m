function [ depthMean ] = plotFeatureMaps(index, ...
    normFeatureMatrixPath, lfpFeatureMatrixPath, depthPath, ...
    imagePath1, imagePath2, lfpImageFolder, location, STNENTRY, STNEXIT)
% function plotFeatureMaps
%   - plots an activity map for each feature.
%   - adds shade on STN region

% load normalized feature matrix
disp(['Loading normalized feature matrix ' num2str(index) '...']);
normFeatureMatrix = importdata(normFeatureMatrixPath);

% calculate x-axis (time)
timeInterval = 2;	% 4 seconds for each epoch with 50% overlap
                 	% this means 2 seconds on average
timeScale = size(normFeatureMatrix, 1) * timeInterval;
time = 2 : timeInterval : timeScale;

% load lfp-based feature matrix
disp(['Loading lfp-based feature matrix ' num2str(index) '...']);
lfpFeatureMatrix = importdata(lfpFeatureMatrixPath);

% load depth epoch matrix and calculate STN entry and exit on x-axis
disp(['Loading depth data ' num2str(index) '...']);
depthEpoch = importdata(depthPath);
depthMean = mean(transpose(depthEpoch));
for i = 2 : length(depthMean)
    if depthMean(i - 1) > STNENTRY && depthMean(i) <= STNENTRY
        x1 = timeInterval * i;
    end
    if depthMean(i - 1) > STNEXIT && depthMean(i) <= STNEXIT
        x2 = timeInterval * i;
    end
end


% (1.1) feature map for spike dependent features

f = figure('visible', 'off');

ax(1) = subplot(5, 3, 1);
plot(time, normFeatureMatrix(:, 1));
xlabel('Time (s)', 'FontSize', 8);
ylabel('MISI', 'FontSize', 8);
title('Mean Inter-Spike Interval (MISI)', 'FontSize', 8);
addPatch(x1, x2, 0, 1);     % add a patch

ax(2) = subplot(5, 3, 2);
plot(time, normFeatureMatrix(:, 2))
xlabel('Time (s)', 'FontSize', 8);
ylabel('SISI', 'FontSize', 8);
title('Inter-Spike Interval Standard Deviation (SISI)', 'FontSize', 8);
addPatch(x1, x2, 0, 1);     % add a patch

ax(3) = subplot(5, 3, 3);
plot(time, normFeatureMatrix(:, 3));
xlabel('Time (s)', 'FontSize', 8);
ylabel('CVISI', 'FontSize', 8);
title('Inter-Spike Interval Coefficient of Variation (CVISI)', 'FontSize', 8);
addPatch(x1, x2, 0, 1);     % add a patch

ax(4) = subplot(5, 3, 4);
plot(time, normFeatureMatrix(:, 4));
xlabel('Time (s)', 'FontSize', 8);
ylabel('PS', 'FontSize', 8);
title('Percentage of Spikes in the Spike Signal (PS)', 'FontSize', 8);
addPatch(x1, x2, 0, 1);     % add a patch

ax(5) = subplot(5, 3, 5);
plot(time, normFeatureMatrix(:, 5));
xlabel('Time (s)', 'FontSize', 8);
ylabel('BR', 'FontSize', 8);
title('Bursting Rate (BR)', 'FontSize', 8);
addPatch(x1, x2, 0, 1);     % add a patch

ax(6) = subplot(5, 3, 6);
plot(time, normFeatureMatrix(:, 6));
xlabel('Time (s)', 'FontSize', 8);
ylabel('PB', 'FontSize', 8);
title('Percentage of Bursts (PB)', 'FontSize', 8);
addPatch(x1, x2, 0, 1);     % add a patch

ax(7) = subplot(5, 3, 7);
plot(time, normFeatureMatrix(:, 7));
xlabel('Time (s)', 'FontSize', 8);
ylabel('FR', 'FontSize', 8);
title('Firing Rate (FR)', 'FontSize', 8);
addPatch(x1, x2, 0, 1);     % add a patch

ax(8) = subplot(5, 3, 8);
plot(time, normFeatureMatrix(:, 8));
xlabel('Time (s)', 'FontSize', 8);
ylabel('MBI', 'FontSize', 8);
title('Modified Burst Index (MBI)', 'FontSize', 8);
addPatch(x1, x2, 0, 1);     % add a patch

ax(9) = subplot(5, 3, 9);
plot(time, normFeatureMatrix(:, 9))
xlabel('Time (s)', 'FontSize', 8);
ylabel('PI', 'FontSize', 8);
title('Pause Index (PI)', 'FontSize', 8);
addPatch(x1, x2, 0, 1);     % add a patch

ax(10) = subplot(5, 3, 10);
plot(time, normFeatureMatrix(:, 10));
xlabel('Time (s)', 'FontSize', 8);
ylabel('PR', 'FontSize', 8);
title('Pause Ratio (PR)', 'FontSize', 8);
addPatch(x1, x2, 0, 1);     % add a patch

ax(11) = subplot(5, 3, 11);
plot(time, normFeatureMatrix(:, 11));
xlabel('Time (s)', 'FontSize', 8);
ylabel('SC', 'FontSize', 8);
title('Spike Count (SC)', 'FontSize', 8);
addPatch(x1, x2, 0, 1);     % add a patch

ax(12) = subplot(5, 3, 12);
plot(time, normFeatureMatrix(:, 12));
xlabel('Time (s)', 'FontSize', 8);
ylabel('MSAD', 'FontSize', 8);
title('Mean Spike Amplitude Differential (MSAD)', 'FontSize', 8);
addPatch(x1, x2, 0, 1);     % add a patch

% depth map
ax(13) = subplot(5, 3, 13);
plot(time, depthMean);
set(gca, 'XMinorTick', 'on', 'YMinorTick', 'on')
grid on
grid minor
xlabel('Time (s)', 'FontSize', 8);
ylabel('Milimeters Above Target', 'FontSize', 8);
title('Depth Map', 'FontSize', 8);
addPatch(0, timeScale, STNENTRY, STNEXIT);	% add a patch

h = suptitle({['Spike Dependent Features for MER ' num2str(index)], ...
              location(index), ...
              ['STN Entry: ' num2str(STNENTRY)], ...
              ['STN Exit: ' num2str(STNEXIT)]});
set(h, 'FontSize', 12, 'FontWeight', 'normal')

% add grid to subplot(s)
% grid(ax(8),'on')

% save figure as full screen
disp(['Saving normalized spike dependent feature maps for MER ' ...
    num2str(index) '...']);
saveFigure(f, imagePath1);

close all



% (2) feature map for spike independent features

f = figure('visible', 'off');

ax(1) = subplot(4, 2, 1);
plot(time, normFeatureMatrix(:, 13));
xlabel('Time (s)')
ylabel('CL')
title('Curve Length (CL)')
addPatch(x1, x2, 0, 1);     % add a patch

ax(2) = subplot(4, 2, 2);
plot(time, normFeatureMatrix(:, 14));
xlabel('Time (s)')
ylabel('Threshold')
title('Threshold')
addPatch(x1, x2, 0, 1);     % add a patch

ax(3) = subplot(4, 2, 3);
plot(time, normFeatureMatrix(:, 15));
xlabel('Time (s)')
ylabel('Peaks')
title('Peaks')
addPatch(x1, x2, 0, 1);     % add a patch

ax(4) = subplot(4, 2, 4);
plot(time, normFeatureMatrix(:, 16));
xlabel('Time (s)')
ylabel('RMSA')
title('Root mean square amplitude')
addPatch(x1, x2, 0, 1);     % add a patch

ax(5) = subplot(4, 2, 5);
plot(time, normFeatureMatrix(:, 17));
xlabel('Time (s)')
ylabel('ANE')
title('Average nonlinear energy')
addPatch(x1, x2, 0, 1);     % add a patch

ax(6) = subplot(4, 2, 6);
plot(time, normFeatureMatrix(:, 18));
xlabel('Time (s)')
ylabel('ZC')
title('Zero crossings')
addPatch(x1, x2, 0, 1);     % add a patch

% depth map
ax(7) = subplot(4, 2, 7);
plot(time, depthMean);
set(gca, 'XMinorTick', 'on', 'YMinorTick', 'on')
grid on
grid minor
xlabel('Time (s)')
ylabel('Milimeters Above Target')
title('Depth Map');
addPatch(0, timeScale, STNENTRY, STNEXIT);	% add a patch

h = suptitle({['Spike Independent Features for MER ' num2str(index)], ...
              location(index), ...
              ['STN Entry: ' num2str(STNENTRY)], ...
              ['STN Exit: ' num2str(STNEXIT)]});
set(h, 'FontSize', 12, 'FontWeight', 'normal')

% add grid to subplot(s)
% grid(ax(7),'on')

% save figure as full screen
disp(['Saving normalized spike independent feature maps for MER ' ...
    num2str(index) '...']);
saveFigure(f, imagePath2);

close all


% (3) feature maps for lfp-based features

% lfp-related band-pass signals
lfpBandNames = ["Alpha", "Beta", "Delta", "Infra-Slow", "Theta", ...
    "Low Gamma", "High Gamma"];

for i = 1 : 7
f = figure('visible', 'off');

ax(1) = subplot(3, 2, 1);
plot(time, lfpFeatureMatrix(:, (i - 1) * 5 + 1));
xlabel('Time (s)')
ylabel('PowerXw')
title('Power band ratio of signal X in frequency band W')
addPatch(x1, x2, 0, 1);     % add a patch

ax(2) = subplot(3, 2, 2);
plot(time, lfpFeatureMatrix(:, (i - 1) * 5 + 2));
xlabel('Time (s)')
ylabel('PKXw')
title('Peak to average power ratio of signal X in frequency band W')
addPatch(x1, x2, 0, 1);     % add a patch

ax(3) = subplot(3, 2, 3);
plot(time, lfpFeatureMatrix(:, (i - 1) * 5 + 3));
xlabel('Time (s)')
ylabel('FmaxPKXw')
title(['Frequency corresponding to maximum peak to average power ' ...
    'ratio of signal X in frequency band W'])
addPatch(x1, x2, 0, 1);     % add a patch

ax(4) = subplot(3, 2, 4);
plot(time, lfpFeatureMatrix(:, (i - 1) * 5 + 4));
xlabel('Time (s)')
ylabel('CVXw')
title('Coefficient of variation of signal X in frequency band W')
addPatch(x1, x2, 0, 1);     % add a patch

ax(5) = subplot(3, 2, 5);
plot(time, lfpFeatureMatrix(:, (i - 1) * 5 + 5));
xlabel('Time (s)')
ylabel('ZeroCrossX')
title('Percentage of zero crossings in signal X')
addPatch(x1, x2, 0, 1);     % add a patch

% depth map
ax(6) = subplot(3, 2, 6);
plot(time, depthMean);
set(gca, 'XMinorTick', 'on', 'YMinorTick', 'on')
grid on
grid minor
xlabel('Time (s)')
ylabel('Milimeters Above Target')
title('Depth Map');
addPatch(0, timeScale, STNENTRY, STNEXIT);	% add a patch

h = suptitle({strcat(lfpBandNames(i), " Signal Related Features for MER ", num2str(index)), ...
              location(index), ...
              ['STN Entry: ' num2str(STNENTRY)], ...
              ['STN Exit: ' num2str(STNEXIT)]});
set(h, 'FontSize', 12, 'FontWeight', 'normal')

% add grid to subplot(s)
% grid(ax(7),'on')

% save figure as full screen
disp(['Saving lfp-based feature maps for MER ' ...
    num2str(index) '...']);
image3Path = strcat(lfpImageFolder, num2str(index), lfpBandNames(i), ".bmp");
disp(['Saving to ' char(image3Path)]);
saveFigure(f, char(image3Path));

close all

end


end

