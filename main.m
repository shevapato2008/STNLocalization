%% Set current folder %%
cd('S:\Google Drive\Rutgers University\Research\DBS\Project\Matlab\Program')


%% 1. Feature Extraction

%% 1.1 Generate feature matrices
for i = 1 : 10
    getFeatureMatrix(i, 13, ...
        ['Data\Epoch\hpfSignal' num2str(i) 'Epoch.mat'], ...
        ['Data\Epoch\alphaSignal' num2str(i) 'Epoch.mat'], ...
        ['Data\Epoch\betaSignal' num2str(i) 'Epoch.mat'], ...
        ['Data\Epoch\deltaSignal' num2str(i) 'Epoch.mat'], ...
        ['Data\Epoch\infraSlowSignal' num2str(i) 'Epoch.mat'], ...
        ['Data\Epoch\thetaSignal' num2str(i) 'Epoch.mat'], ...
        ['Data\Epoch\lowGammaSignal' num2str(i) 'Epoch.mat'], ...
        ['Data\Epoch\highGammaSignal' num2str(i) 'Epoch.mat'], ...
    	['Data\Feature\featureMatrix' num2str(i) '.mat'])
end



%% 1.2 Take transformations (^1/3) to make variables more normally distributed
% Scatter plot before transformation
for i = 1 : 10
    
    featureScatterplot( ...
        ['Pairwise Feature Scatter Plots before Transformation ' num2str(i)], ...
        ['Data\Feature\featureMatrix' num2str(i) '.mat'], ...
        ['Figures\Scatterplot\' num2str(i) '.1.orig.bmp']);
    
    close all;
    clear;
    
end

% Transformation
for i = 1 : 10
    
    % right skewed feature list
    featureList = [1, 2, 3, 4, 5, 7, 8, 9, 11, 12];
    
    transformFeatures(featureList, ...
        ['Data\Feature\featureMatrix' num2str(i) '.mat'], ...
        ['Data\Feature\transformFeatureMatrix' num2str(i) '.mat']);
    
    close all;
    clear;
    
end

% Scatter plot after transformation
for i = 1 : 10
    
    featureScatterplot( ...
        ['Pairwise Scatter Plots of Feature Matrix after Transformation ' num2str(i)], ...
        ['Data\Feature\transformFeatureMatrix' num2str(i) '.mat'], ...
        ['Figures\Scatterplot\' num2str(i) '.2.trans.bmp']);
    
    close all;
    clear;
    
end



%% 1.3 Standardization, Normalization, Outlier Detection
for i = 1 : 10
    getNormFeatureMatrix(i, ...
        ['Data\Feature\transformFeatureMatrix' num2str(i) '.mat'], ...
        ['Data\Feature\normFeatureMatrix' num2str(i) '.mat']);
end

% Scatter plot after normalization
for i = 1 : 10
    featureScatterplot( ...
        ['Pairwise Scatter Plots of Feature Matrix after Normalization ' num2str(i)], ...
        ['Data\Feature\normFeatureMatrix' num2str(i) '.mat'], ...
        ['Figures\Scatterplot\' num2str(i) '.3.norm.bmp']);
    close all;
    clear;
end



%% 2. Feature Activity Maps
% create a matrix to load all STN entries and exits
STNBounds = zeros(10, 2);
STNBounds(1, :) = [2.95, 0.30];
STNBounds(2, :) = [2.20, -0.25];
STNBounds(3, :) = [0.65, -3.82];
STNBounds(4, :) = [0.47, -3.84];
STNBounds(5, :) = [-2.19, -6.30];
STNBounds(6, :) = [5.51, 0.80];
STNBounds(7, :) = [4.20, -0.40];
STNBounds(8, :) = [3.80, -1.30];
STNBounds(9, :) = [5.12, 0.30];
STNBounds(10, :) = [0.90, -2.50];

location = ["[2010-01-07] [Left] [Pass 1] [Center]", ...
            "[2010-01-07] [Right] [Pass 1] [Center]", ...
            "[2010-01-28] [Left] [Pass 3] [Lateral]", ...
            "[2010-01-28] [Right] [Pass 1] [Center]", ...
            "[2010-02-18] [Right] [Pass 1] [Center]", ...
            "[2010-03-11] [Left] [Pass 2] [Posterior]", ...
            "[2010-03-25] [Left] [Pass 2] [Center]", ...
            "[2010-03-25] [Right] [Pass 2] [Anterior]", ...
            "[2010-04-01] [Right] [Pass 2] [Anterior]", ...
            "[2010-05-18] [Left] [Pass 1] [Center]"];

for i = 1 : 10
    plotFeatureMaps(i, ...
        ['Data\Feature\normFeatureMatrix' num2str(i) '.mat'], ...
        ['Data\Epoch\depth' num2str(i) 'Epoch.mat'], ...
        ['Figures\ActivityMap\' num2str(i) 'normFeatureMap_sdf.bmp'], ...
        ['Figures\ActivityMap\' num2str(i) 'normFeatureMap_sif.bmp'], ...
        location, STNBounds(i, 1), STNBounds(i, 2));
end



%% 3. Clustering Algorithms

%% 3.1 K-means clustering

for i = 1 : 10
    
    [idx, C, sumd, D] = kMeansClustering( ...
        ['Data\Feature\normFeatureMatrix' num2str(i) '.mat'], ...
        ['Figures\K-Means\' num2str(i) '.1.k-Means.bmp'], ...
        i, 4, 8, location, STNBounds(i, 1), STNBounds(i, 2));
    
    X = importdata(['Data\Epoch\hpfSignal' num2str(i) 'Epoch.mat']);
    epochNum = size(X, 1);
    
    plotGroupSeries(epochNum, idx, ...
        ['Data\Epoch\depth' num2str(i) 'Epoch.mat'], ...
        i, location, STNBounds(i, 1), STNBounds(i, 2), 4, ...
        ['Figures\K-Means\' num2str(i) '.2.groupSeries.bmp']);
    
end

% Take a "majority vote" based on neighboring points in order to remove
% some noise. This mimics the way a KNN classifier works.
armlength = 10;
winSize = armlength * 2 + 1;

for i = (armlength + 1) : (length(vector) - armlength)
    low = i - armlength;    % starting index of the window
    high = i + armlength;   % ending index of the window
    window = vector(low : high);
end


%% 3.2 Hierarchical Clustering
X = importdata('Data\Feature\O300\transformNormFeatureMatrix1.mat');
Y1 = pdist(X, 'euclidean');  % euclidean is default
Z1 = linkage(Y1, 'average');
c1 = cophenet(Z1, Y1);       % 0.6942

% use the cophenetic correlation coefficient to compare the results of
% clustering the same data set using different distance calculation methods
% or clustering algorithms

Y2 = pdist(X, 'cityblock');
Z2 = linkage(Y2, 'average');
c2 = cophenet(Z2, Y2);       % 0.6545


dendrogram(Z1);
%{
About dendrogram output:
(1) If there are 30 or fewer data points in the original data set, then each
leaf in the dendrogram corresponds to one data point.
(2) If there are more than 30 data points, then dendrogram collapses lower 
branches so that there are 30 leaf nodes. As a result, some leaves in the
plot correspond to more than one data point.
%}
% specify 4 clusters
idx = cluster(Z1, 'maxclust', 5);

% Visualization from a 2D angle
feature1 = 4;
feature2 = 8;
figure;
plot(X(idx == 1, feature1), X(idx == 1, feature2), 'r.', 'MarkerSize', 12)
hold on
plot(X(idx == 2, feature1), X(idx == 2, feature2), 'b.', 'MarkerSize', 12)
plot(X(idx == 3, feature1), X(idx == 3, feature2), 'c.', 'MarkerSize', 12)
plot(X(idx == 4, feature1), X(idx == 4, feature2), 'g.', 'MarkerSize', 12)
title 'Cluster Assignments and Centroids'
hold off



%% 3.3 DBSCAN clustering

for i = 1 : 10
    
    idx = DBSCANClustering( ...
        ['Data\Feature\normFeatureMatrix' num2str(i) '.mat'], ...
        0.20, 10);
    
    X = importdata(['Data\Epoch\hpfSignal' num2str(i) 'Epoch.mat']);
    epochNum = size(X, 1);
    plotGroupSeries(epochNum, idx, ...
        ['Data\Epoch\depth' num2str(i) 'Epoch.mat'], ...
        STNBounds(i, 1), STNBounds(i, 2), 10, ...
        ['Figures\DBSCAN\groupSeries' num2str(i) '.bmp']);
    
end


