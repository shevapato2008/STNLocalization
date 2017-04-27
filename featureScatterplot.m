function [ output_args ] = featureScatterplot(headline, ...
    featurematrixPath, figurePath)
% Function featureScatterplot() generates pairwise scatter plots for all
% input features.

% import feature matrix
mat = importdata(featurematrixPath);

% generate the plot
[H, AX] = plotmatrix(mat);

% label the plots
data_labels = {'MISI', 'SISI', 'CVISI', 'PS', 'BR', 'PB', 'FR', ...
               'CL', 'Thrhld', 'Peaks', 'RMSA', 'ANE', 'ZC'};

for i = 1 : length(AX)
    ylabel(AX(i, 1), data_labels{i});
    xlabel(AX(end, i), data_labels{i});
end

title(headline, 'FontSize', 14);

saveFigure(gcf, figurePath);

end

