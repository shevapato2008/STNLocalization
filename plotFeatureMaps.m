function [ output_args ] = plotFeatureMaps(index, ...
    normFeatureMatrixPath, imagePath1, imagePath2)
%PLOTFEATUREMAPS Summary of this function goes here
%   Detailed explanation goes here

disp(['Loading normalized feature matrix ' num2str(index) '...']);
load(normFeatureMatrixPath);
timeInterval = 2;       % 4 seconds for each epoch with 50% overlap
                        % this means 2 seconds on average
time = 2 : timeInterval : (size(normFeatureMatrix, 1) * timeInterval);

% (1) feature map for spike dependent features

figure
ax(1) = subplot(4, 2, 1);
plot(time, normFeatureMatrix(:, 1));
xlabel('Time (s)')
ylabel('MISI')
title('Mean Inter-Spike Interval (MISI)')

ax(2) = subplot(4, 2, 2);
plot(time, normFeatureMatrix(:, 2))
xlabel('Time (s)')
ylabel('SISI')
title('Inter-Spike Interval Standard Deviation (SISI)')

ax(3) = subplot(4, 2, 3);
plot(time, normFeatureMatrix(:, 3));
xlabel('Time (s)')
ylabel('CVISI')
title('Inter-Spike Interval Coefficient of Variation (CVISI)');

ax(4) = subplot(4, 2, 4);
plot(time, normFeatureMatrix(:, 4));
xlabel('Time (s)')
ylabel('PS')
title('Percentage of Spikes in the Spike Signal (PS)');

ax(5) = subplot(4, 2, 5);
plot(time, normFeatureMatrix(:, 5));
xlabel('Time (s)')
ylabel('BR')
title('Bursting Rate (BR)');

ax(6) = subplot(4, 2, 6);
plot(time, normFeatureMatrix(:, 6));
xlabel('Time (s)')
ylabel('PB')
title('Percentage of Bursts (PB)');

ax(7) = subplot(4, 2, 7);
plot(time, normFeatureMatrix(:, 6));
xlabel('Time (s)')
ylabel('FR')
title('Firing Rate (FR)');

suptitle(['Spike Dependent Features for MER ' num2str(index)])

% save figure as full screen
disp(['Saving normalized spike dependent feature maps for MER ' ...
    num2str(index) '...']);
saveFigure(gcf, imagePath1);

close all


% (2) feature map for spike independent features

figure
ax(1) = subplot(3, 2, 1);
plot(time, normFeatureMatrix(:, 8));
xlabel('Time (s)')
ylabel('CL')
title('Curve Length (CL)')

ax(2) = subplot(3, 2, 2);
plot(time, normFeatureMatrix(:, 9));
xlabel('Time (s)')
ylabel('Threshold')
title('Threshold')

ax(3) = subplot(3, 2, 3);
plot(time, normFeatureMatrix(:, 10));
xlabel('Time (s)')
ylabel('Peaks')
title('Peaks')

ax(4) = subplot(3, 2, 4);
plot(time, normFeatureMatrix(:, 10));
xlabel('Time (s)')
ylabel('RMSA')
title('Root mean square amplitude')

ax(5) = subplot(3, 2, 5);
plot(time, normFeatureMatrix(:, 10));
xlabel('Time (s)')
ylabel('ANE')
title('Average nonlinear energy')

ax(6) = subplot(3, 2, 6);
plot(time, normFeatureMatrix(:, 10));
xlabel('Time (s)')
ylabel('ZC')
title('Zero crossings')

suptitle(['Spike Independent Features for MER ' num2str(index)])

% save figure as full screen
disp(['Saving normalized spike independent feature maps for MER ' ...
    num2str(index) '...']);
saveFigure(gcf, imagePath2);

close all

end

