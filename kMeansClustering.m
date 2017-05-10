function [idx, C, sumd, D] = kMeansClustering(featureMatrixPath, ...
    clusteringPath, index, feature1, feature2, location, STNENTRY, STNEXIT)
% Function kMeansClustering() conducts k-means clustering on data and
% make a clustering plot in a specific 2D angle.
% k = 4 in this case. This is fixed at this stage.

X = importdata(featureMatrixPath);

%% parameters for k-means
k = 4;
distancetype = 'sqeuclidean'; 
% 'sqeuclidean' is default
% Other choices: 'cityblock', 'cosine', 'correlation', 'hamming'
initialization = 'plus';
% 'plus' (k-means ++ algorithm) is default
% Other choices: 'cluster', 'sample', 'uniform', numeric matrix, numeric
% array

[idx, C, sumd, D] = kmeans(X, k, 'Distance', distancetype, 'Start', initialization);

% Visualization from a 2D angle
figure;
plot(X(idx == 1, feature1), X(idx == 1, feature2), 'r.', 'MarkerSize', 12)
hold on
plot(X(idx == 2, feature1), X(idx == 2, feature2), 'b.', 'MarkerSize', 12)
plot(X(idx == 3, feature1), X(idx == 3, feature2), 'c.', 'MarkerSize', 12)
plot(X(idx == 4, feature1), X(idx == 4, feature2), 'g.', 'MarkerSize', 12)
plot(C(:, feature1), C(:, feature2), 'kx', 'MarkerSize', 15, 'LineWidth', 3)
legend('Cluster 1', 'Cluster 2', 'Cluster 3', 'Cluster 4', ...
    'Centroids', 'Location', 'NE')
h = title({['Cluster Assignments and Centroids for MER ' num2str(index)], ...
              location(index), ...
              ['STN Entry: ' num2str(STNENTRY)], ...
              ['STN Exit: ' num2str(STNEXIT)]});
set(h, 'FontSize', 12, 'FontWeight', 'normal')
hold off

saveFigure(gcf, clusteringPath);
close all;

end

