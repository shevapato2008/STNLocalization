%% 1. K-means clustering

% Add depth (with different scales) as a dimension
for SCALE = 1 : 5
    
    disp(['Generating normalized feature matrices with depth scale = ' ...
        num2str(SCALE) '...']);
    
    for i = 1 : 53
        
        disp(['Adding depth vector to normalized feature matrix ' ...
            num2str(i) ' ...']);
        
        % load normalized feature matrix
        X = importdata(['Data\Feature\normFeatureMatrix' num2str(i) '.mat']);
        numEpoch = size(X, 1);
        numFeature = size(X, 2);

        % load depth epoch matrix
        depthEpoch = importdata(['Data\Epoch\depth' num2str(i) 'Epoch.mat']);

        % get depth vector by averaging depths in each period
        depthVector = zeros(size(depthEpoch, 1), 1);
        for j = 1 : size(depthEpoch, 1)
            depthVector(j) = mean(depthEpoch(j, :));
        end

        % normalization
        MAX = max(depthVector);
        MIN = min(depthVector);
        for j = 1 : length(depthVector)
            depthVector(j) = (depthVector(j) - MIN) / (MAX - MIN);
        end

        % attach the depth vector to the last column of the feature matrix
        for j = 1 : numEpoch
            X(j, numFeature + 1) = SCALE * depthVector(j);
        end

        disp(['Saving feature matrix ' num2str(i) ' ...']);
        save(['Data\Feature\normFeatureMatrix' num2str(i) '_depthScale' ...
            num2str(SCALE) '.mat'], 'X', '-v7.3');
    end
    
end


% evaluate the optimal k for k-means
optimalK = zeros(53, 3);

for i = 1 : 53
    
    X = importdata(['Data\Feature\normFeatureMatrix' num2str(i) '_depthScale3.mat']);
    
    disp(['Calculating optimal k for group ' num2str(i) '...']);

    % Calinski-Harabasz Criterion
    eva1 = evalclusters(X, 'kmeans', 'CalinskiHarabasz', 'KList', [1 : 6]);
    optimalK(i, 1) = eva1.OptimalK;
    
    % Silhouette Criterion
    eva2 = evalclusters(X, 'kmeans', 'silhouette', 'KList', [1 : 6]);
    optimalK(i, 2) = eva2.OptimalK;
    
    % Gap Criterion
    eva3 = evalclusters(X, 'kmeans', 'gap', 'KList', [1 : 6]);
    optimalK(i, 3) = eva3.OptimalK;
    
end



% 3.1.1 no transformation and fixed k (k = 4)
for i = 1 : 53
    
    disp(['Generating and saving the K-Means clustering figure ' ...
        num2str(i) ' ...']);
    [idx, C, sumd, D] = kMeansClustering(4, ...
        ['Data\Feature\normFeatureMatrix_notrans' num2str(i) '.mat'], ...
        ['Figures\K-Means\NoTrans\' num2str(i) '.1.k-Means.bmp'], ...
        i, 4, 8, location, STNBounds(i, 1), STNBounds(i, 2));
    
    X = importdata(['Data\Epoch\hpfSignal' num2str(i) 'Epoch.mat']);
    epochNum = size(X, 1);
    
    disp(['Generating and saving the grouping plot ' num2str(i) ' ...']);
    plotGroupSeries(epochNum, idx, ...
        ['Data\Epoch\depth' num2str(i) 'Epoch.mat'], ...
        i, location, STNBounds(i, 1), STNBounds(i, 2), 4, ...
        ['Figures\K-Means\NoTrans\' num2str(i) '.2.groupSeries.bmp']);
      
% take a majority vote to smooth the output
%     newIdx = majorityVote(idx, 10);
%     
%     plotGroupSeries(epochNum, newIdx, ...
%     ['Data\Epoch\depth' num2str(i) 'Epoch.mat'], ...
%     i, location, STNBounds(i, 1), STNBounds(i, 2), 4, ...
%     ['Figures\K-Means\' num2str(i) '.2.1.groupSeries_majvot.bmp']);

end



% 3.1.2 with transformation and fixed k (k = 4)

% (1) no depth involved
for i = 1 : 53

    disp(['Generating and saving the K-Means clustering figure ' ...
        num2str(i) ' ...']);
    [idx, C, sumd, D] = kMeansClustering(4, ...
        ['Data\Feature\normFeatureMatrix' num2str(i) '.mat'], ...
        ['Figures\K-Means\' num2str(i) '.1.k-Means.bmp'], ...
        i, 4, 8, location, STNBounds(i, 1), STNBounds(i, 2));

    X = importdata(['Data\Epoch\hpfSignal' num2str(i) 'Epoch.mat']);
    epochNum = size(X, 1);

    disp(['Generating and saving the grouping plot ' num2str(i) ' ...']);
    plotGroupSeries(epochNum, idx, ...
        ['Data\Epoch\depth' num2str(i) 'Epoch.mat'], ...
        i, location, STNBounds(i, 1), STNBounds(i, 2), 4, ...
        ['Figures\K-Means\' num2str(i) '.2.groupSeries.bmp']);

end

% (2) with different depth scales
for i = 1 : 53
    disp(['For Group ' num2str(i)]);
    
    for SCALE = 1 : 5
        disp(['depth scale = ' num2str(SCALE)]);
        
        disp(['Generating and saving the K-Means clustering figure ' ...
            num2str(i) ' ...']);
        [idx, C, sumd, D] = kMeansClustering(4, ...
            ['Data\Feature\normFeatureMatrix' num2str(i) '_depthScale' ...
                num2str(SCALE) '.mat'], ...
            ['Figures\K-Means\' num2str(i) '.1.k-Means_depthScale' ...
                num2str(SCALE) '.bmp'], ...
            i, 4, 8, location, STNBounds(i, 1), STNBounds(i, 2));

        X = importdata(['Data\Epoch\hpfSignal' num2str(i) 'Epoch.mat']);
        epochNum = size(X, 1);

        disp(['Generating and saving the grouping plot ' num2str(i) '...']);
        plotGroupSeries(epochNum, idx, ...
            ['Data\Epoch\depth' num2str(i) 'Epoch.mat'], ...
            i, location, STNBounds(i, 1), STNBounds(i, 2), 4, ...
            ['Figures\K-Means\' num2str(i) '.2.groupSeries_depthScale' ...
                num2str(SCALE) '.bmp']);
    end
    
end


% 3.1.3 with transformation and optimal k
% (1) Calinski-Harabasz Criterion
for i = 1 : 53
    
    disp(['Generating and saving the K-Means clustering figure ' num2str(i) '...']);
    [idx, C, sumd, D] = kMeansClustering(optimalK(i, 1), ...
        ['Data\Feature\normFeatureMatrix' num2str(i) '.mat'], ...
        ['Figures\K-Means\' num2str(i) '.1.k-Means.bmp'], ...
        i, 4, 8, location, STNBounds(i, 1), STNBounds(i, 2));

    X = importdata(['Data\Epoch\hpfSignal' num2str(i) 'Epoch.mat']);
    epochNum = size(X, 1);

    disp(['Generating and saving the grouping plot ' num2str(i) '...']);
    plotGroupSeries(epochNum, idx, ...
        ['Data\Epoch\depth' num2str(i) 'Epoch.mat'], ...
        i, location, STNBounds(i, 1), STNBounds(i, 2), optimalK(i, 1), ...
        ['Figures\K-Means\' num2str(i) '.2.groupSeries.bmp']);

end

% (2) Silouette Criterion
for i = 1 : 53
    
    disp(['Generating and saving the K-Means clustering figure ' num2str(i) '...']);
    [idx, C, sumd, D] = kMeansClustering(optimalK(i, 2), ...
        ['Data\Feature\normFeatureMatrix' num2str(i) '.mat'], ...
        ['Figures\K-Means\' num2str(i) '.1.k-Means.bmp'], ...
        i, 4, 8, location, STNBounds(i, 1), STNBounds(i, 2));

    X = importdata(['Data\Epoch\hpfSignal' num2str(i) 'Epoch.mat']);
    epochNum = size(X, 1);

    disp(['Generating and saving the grouping plot ' num2str(i) '...']);
    plotGroupSeries(epochNum, idx, ...
        ['Data\Epoch\depth' num2str(i) 'Epoch.mat'], ...
        i, location, STNBounds(i, 1), STNBounds(i, 2), optimalK(i, 2), ...
        ['Figures\K-Means\' num2str(i) '.2.groupSeries.bmp']);

end


% (2) Gap Criterion
for i = 1 : 53
    
    disp(['Generating and saving the K-Means clustering figure ' num2str(i) '...']);
    [idx, C, sumd, D] = kMeansClustering(optimalK(i, 2), ...
        ['Data\Feature\normFeatureMatrix' num2str(i) '.mat'], ...
        ['Figures\K-Means\' num2str(i) '.1.k-Means.bmp'], ...
        i, 4, 8, location, STNBounds(i, 1), STNBounds(i, 2));

    X = importdata(['Data\Epoch\hpfSignal' num2str(i) 'Epoch.mat']);
    epochNum = size(X, 1);

    disp(['Generating and saving the grouping plot ' num2str(i) '...']);
    plotGroupSeries(epochNum, idx, ...
        ['Data\Epoch\depth' num2str(i) 'Epoch.mat'], ...
        i, location, STNBounds(i, 1), STNBounds(i, 2), optimalK(i, 2), ...
        ['Figures\K-Means\' num2str(i) '.2.groupSeries.bmp']);

end



% 3.1.4 transform + outlier detect + fixed k (k = 4) + weight + depth

% Setup and apply weights to the normalized feature matrix
weight = [1, ...      % MISI
          1, ...      % SISI
          0.5, ...    % CVISI
          1, ...      % PS
          1, ...      % BR
          0.5, ...    % PB
          1, ...      % FR
          2, ...      % CL
          0.5, ...    % Threshold
          0.5, ...    % Peaks
          2, ...      % RMSA
          2, ...      % ANE
          0.5];       % ZC

for i = 1 : 53
    disp(['Creating weighted feature matrix ' num2str(i) '...']);
    getWeightedFeatureMatrix(weight, ...
        ['Data\Feature\normFeatureMatrix' num2str(i) '.mat'], ...
        ['Data\Feature\weightedFeatureMatrix' num2str(i) '.mat'])
end

% (1) without weight
for i = 1 : 53

    disp(['Generating and saving the K-Means clustering figure ' num2str(i) '...']);
    [idx, C, sumd, D] = kMeansClustering(4, ...
        ['Data\Feature\normFeatureMatrix' num2str(i) '.mat'], ...
        ['Figures\K-Means\' num2str(i) '.1.k-Means.bmp'], ...
        i, 4, 8, location, STNBounds(i, 1), STNBounds(i, 2));

    X = importdata(['Data\Epoch\hpfSignal' num2str(i) 'Epoch.mat']);
    epochNum = size(X, 1);

    disp(['Generating and saving the grouping plot ' num2str(i) '...']);
    plotGroupSeries(epochNum, idx, ...
        ['Data\Epoch\depth' num2str(i) 'Epoch.mat'], ...
        i, location, STNBounds(i, 1), STNBounds(i, 2), 4, ...
        ['Figures\K-Means\' num2str(i) '.2.groupSeries.bmp']);

end

% (2) weighted
for i = 1 : 53

    disp(['Generating and saving the K-Means clustering figure ' num2str(i) '...']);
    [idx, C, sumd, D] = kMeansClustering(4, ...
        ['Data\Feature\weightedFeatureMatrix' num2str(i) '.mat'], ...
        ['Figures\K-Means\' num2str(i) '.1.k-Means_weighted.bmp'], ...
        i, 4, 8, location, STNBounds(i, 1), STNBounds(i, 2));

    X = importdata(['Data\Epoch\hpfSignal' num2str(i) 'Epoch.mat']);
    epochNum = size(X, 1);

    disp(['Generating and saving the grouping plot ' num2str(i) '...']);
    plotGroupSeries(epochNum, idx, ...
        ['Data\Epoch\depth' num2str(i) 'Epoch.mat'], ...
        i, location, STNBounds(i, 1), STNBounds(i, 2), 4, ...
        ['Figures\K-Means\' num2str(i) '.2.groupSeries_weighted.bmp']);

end

% (3) weighted + depth
weight_depth=[1, ...      % MISI
              1, ...      % SISI
              0.5, ...    % CVISI
              1, ...      % PS
              1, ...      % BR
              0.5, ...    % PB
              1, ...      % FR
              2, ...      % CL
              0.5, ...    % Threshold
              0.5, ...    % Peaks
              2, ...      % RMSA
              2, ...      % ANE
              0.5, ...    % ZC
              1];         % Depth

for i = 1 : 53
    for DEPTHSCALE = 1 : 5
        disp(['Creating weighted feature matrix ' num2str(i) '...']);
        getWeightedFeatureMatrix(weight_depth, ...
            ['Data\Feature\normFeatureMatrix' num2str(i) '_depthScale' num2str(DEPTHSCALE) '.mat'], ...
            ['Data\Feature\weightedFeatureMatrix' num2str(i) '_depthScale' num2str(DEPTHSCALE) '.mat'])
    end
end


for i = 1 : 53
    
    for DEPTHSCALE = 1 : 5
        
        disp(['Generating and saving the K-Means clustering figure ' num2str(i) '...']);
        [idx, C, sumd, D] = kMeansClustering(4, ...
            ['Data\Feature\weightedFeatureMatrix' num2str(i) '_depthScale' num2str(DEPTHSCALE) '.mat'], ...
            ['Figures\K-Means\' num2str(i) '.1.k-Means_weighted_depthScale' num2str(DEPTHSCALE) '.bmp'], ...
            i, 4, 8, location, STNBounds(i, 1), STNBounds(i, 2));

        X = importdata(['Data\Epoch\hpfSignal' num2str(i) 'Epoch.mat']);
        epochNum = size(X, 1);

        disp(['Generating and saving the grouping plot ' num2str(i) '...']);
        plotGroupSeries(epochNum, idx, ...
            ['Data\Epoch\depth' num2str(i) 'Epoch.mat'], ...
            i, location, STNBounds(i, 1), STNBounds(i, 2), 4, ...
            ['Figures\K-Means\' num2str(i) '.2.groupSeries_weighted_depthScale' num2str(DEPTHSCALE) '.bmp']);
        
    end

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
    
    disp(['Generating and saving the DBSCAN clustering figure ' num2str(i) '...']);
    idx = DBSCANClustering( ...
        ['Data\Feature\normFeatureMatrix' num2str(i) '.mat'], ...
        0.20, 10, ...
        ['Figures\DBSCAN\' num2str(i) '.1.k-Means.bmp'], ...
        i, location, STNBounds(i, 1), STNBounds(i, 2));
    
    X = importdata(['Data\Epoch\hpfSignal' num2str(i) 'Epoch.mat']);
    epochNum = size(X, 1);
    
    disp(['Generating and saving the grouping plot ' num2str(i) '...']);
    plotGroupSeries(epochNum, idx, ...
        ['Data\Epoch\depth' num2str(i) 'Epoch.mat'], ...
        i, location, STNBounds(i, 1), STNBounds(i, 2), 4, ...
        ['Figures\DBSCAN\' num2str(i) '.2.groupSeries.bmp']);
    
end



%% Principal Component Analysis
X = importdata('Data\Feature\normFeatureMatrix1.mat');
[coeff, score, latent, tsquared, explained, mu] = pca(X);

cumulexplained = zeros(size(explained));
sum = 0;
idxO99 = [];
for i = 1 : size(explained, 1)
    sum = sum + explained(i);
    cumulexplained(i) = sum;
    if sum > 99
        idxO99 = [idxO99; i];
    end
end

minIdxO99 = min(idxO99);
disp(['The minimum number of principal components that ' ...
    'counts 99% of the variance: ' minIdxO99]);

princomp99Mat = score(:, 1 : minIdxO99);

disp(['Saving princomp99Mat' num2str(1) '...']);
save('Data\Feature\princomp99Mat.mat', 'princomp99Mat', '-v7.3');

