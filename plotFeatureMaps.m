function [ output_args ] = plotFeatureMaps(index, ...
    normFeatureMatrixPath, depthPath, imagePath1, imagePath2, ...
    location, STNENTRY, STNEXIT)
% function plotFeatureMaps
%   - plots an activity map for each feature.
%   - adds shade on STN region

% load normalized feature matrix and calculate x axis
disp(['Loading normalized feature matrix ' num2str(index) '...']);
load(normFeatureMatrixPath);
timeInterval = 2;       % 4 seconds for each epoch with 50% overlap
                        % this means 2 seconds on average
timeScale = size(normFeatureMatrix, 1) * timeInterval;
time = 2 : timeInterval : timeScale;

% load depth epoch matrix and calculate STN entry and exit on x-axis
disp(['Loading depth data ' num2str(index) '...']);
load(depthPath);
depthMean = mean(transpose(depthEpoch));
for i = 2 : length(depthMean)
    if depthMean(i - 1) > STNENTRY && depthMean(i) <= STNENTRY
        x1 = timeInterval * i;
    end
    if depthMean(i - 1) > STNEXIT && depthMean(i) <= STNEXIT
        x2 = timeInterval * i;
    end
end


% (1) feature map for spike dependent features

f1 = figure('visible', 'off');

ax(1) = subplot(4, 2, 1);
plot(time, normFeatureMatrix(:, 1));
xlabel('Time (s)')
ylabel('MISI')
title('Mean Inter-Spike Interval (MISI)')
addPatch(x1, x2, 0, 1);     % add a patch

ax(2) = subplot(4, 2, 2);
plot(time, normFeatureMatrix(:, 2))
xlabel('Time (s)')
ylabel('SISI')
title('Inter-Spike Interval Standard Deviation (SISI)')
addPatch(x1, x2, 0, 1);     % add a patch

ax(3) = subplot(4, 2, 3);
plot(time, normFeatureMatrix(:, 3));
xlabel('Time (s)')
ylabel('CVISI')
title('Inter-Spike Interval Coefficient of Variation (CVISI)');
addPatch(x1, x2, 0, 1);     % add a patch

ax(4) = subplot(4, 2, 4);
plot(time, normFeatureMatrix(:, 4));
xlabel('Time (s)')
ylabel('PS')
title('Percentage of Spikes in the Spike Signal (PS)');
addPatch(x1, x2, 0, 1);     % add a patch

ax(5) = subplot(4, 2, 5);
plot(time, normFeatureMatrix(:, 5));
xlabel('Time (s)')
ylabel('BR')
title('Bursting Rate (BR)');
addPatch(x1, x2, 0, 1);     % add a patch

ax(6) = subplot(4, 2, 6);
plot(time, normFeatureMatrix(:, 6));
xlabel('Time (s)')
ylabel('PB')
title('Percentage of Bursts (PB)');
addPatch(x1, x2, 0, 1);     % add a patch

ax(7) = subplot(4, 2, 7);
plot(time, normFeatureMatrix(:, 7));
xlabel('Time (s)')
ylabel('FR')
title('Firing Rate (FR)');
addPatch(x1, x2, 0, 1);     % add a patch

% depth map
ax(8) = subplot(4, 2, 8);
plot(time, depthMean);
set(gca, 'XMinorTick', 'on', 'YMinorTick', 'on')
grid on
grid minor
xlabel('Time (s)')
ylabel('Milimeters Above Target')
title('Depth Map');
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
saveFigure(f1, imagePath1);

close all


% (2) feature map for spike independent features

f2 = figure('visible', 'off');

ax(1) = subplot(4, 2, 1);
plot(time, normFeatureMatrix(:, 8));
xlabel('Time (s)')
ylabel('CL')
title('Curve Length (CL)')
addPatch(x1, x2, 0, 1);     % add a patch

ax(2) = subplot(4, 2, 2);
plot(time, normFeatureMatrix(:, 9));
xlabel('Time (s)')
ylabel('Threshold')
title('Threshold')
addPatch(x1, x2, 0, 1);     % add a patch

ax(3) = subplot(4, 2, 3);
plot(time, normFeatureMatrix(:, 10));
xlabel('Time (s)')
ylabel('Peaks')
title('Peaks')
addPatch(x1, x2, 0, 1);     % add a patch

ax(4) = subplot(4, 2, 4);
plot(time, normFeatureMatrix(:, 11));
xlabel('Time (s)')
ylabel('RMSA')
title('Root mean square amplitude')
addPatch(x1, x2, 0, 1);     % add a patch

ax(5) = subplot(4, 2, 5);
plot(time, normFeatureMatrix(:, 12));
xlabel('Time (s)')
ylabel('ANE')
title('Average nonlinear energy')
addPatch(x1, x2, 0, 1);     % add a patch

ax(6) = subplot(4, 2, 6);
plot(time, normFeatureMatrix(:, 13));
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
saveFigure(f2, imagePath2);

close all

end

