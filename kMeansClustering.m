function [idx, C, sumd, D] = kMeansClustering(k, featureMatrixPath, ...
    clusteringPath, index, feature1, feature2, location, STNENTRY, STNEXIT)
% Function kMeansClustering() conducts k-means clustering on data and
% make a clustering plot in a specific 2D angle.
% k = number of clusters.

X = importdata(featureMatrixPath);

%% parameters for k-means
distancetype = 'sqeuclidean'; 
% 'sqeuclidean' is default
% Other choices: 'cityblock', 'cosine', 'correlation', 'hamming'
initialization = 'plus';
% 'plus' (k-means ++ algorithm) is default
% Other choices: 'cluster', 'sample', 'uniform', numeric matrix, numeric
% array
repeats = 10;
% 'Replicates' — Number of times to repeat clustering using new initial 
% cluster centroid positions
% 1 (default) | positive integer

[idx, C, sumd, D] = kmeans(X, k, 'Distance', distancetype, ...
                                 'Start', initialization, ...
                                 'Replicates', repeats);

% Visualization from a 2D angle
f = figure('visible', 'off');
plot(X(idx == 1, feature1), X(idx == 1, feature2), 'r.', 'MarkerSize', 12)
hold on
if k >= 2; plot(X(idx == 2, feature1), X(idx == 2, feature2), 'b.', 'MarkerSize', 12); end
if k >= 3; plot(X(idx == 3, feature1), X(idx == 3, feature2), 'c.', 'MarkerSize', 12); end
if k >= 4; plot(X(idx == 4, feature1), X(idx == 4, feature2), 'g.', 'MarkerSize', 12); end
if k >= 5; plot(X(idx == 5, feature1), X(idx == 5, feature2), 'm.', 'MarkerSize', 12); end
if k >= 6; plot(X(idx == 6, feature1), X(idx == 6, feature2), 'y.', 'MarkerSize', 12); end
plot(C(:, feature1), C(:, feature2), 'kx', 'MarkerSize', 15, 'LineWidth', 3);

if k == 2; h_legend = legend('Cluster 1', 'Cluster 2', 'Centroids', 'Location', ...
        'NE'); end
if k == 3; h_legend = legend('Cluster 1', 'Cluster 2', 'Cluster 3', 'Centroids', ...
        'Location', 'NE'); end
if k == 4; h_legend = legend('Cluster 1', 'Cluster 2', 'Cluster 3', 'Cluster 4', ...
    'Centroids', 'Location', 'NE'); end
if k == 5; h_legend = legend('Cluster 1', 'Cluster 2', 'Cluster 3', 'Cluster 4', ...
    'Cluster 5', 'Centroids', 'Location', 'NE'); end
if k == 6; h_legend = legend('Cluster 1', 'Cluster 2', 'Cluster 3', 'Cluster 4', ...
    'Cluster 5', 'Cluster 6', 'Centroids', 'Location', 'NE'); end
set(h_legend, 'FontSize', 15);

h = title({['Cluster Assignments and Centroids for MER ' num2str(index)], ...
              location(index), ...
              ['STN Entry: ' num2str(STNENTRY)], ...
              ['STN Exit: ' num2str(STNEXIT)]});
set(h, 'FontSize', 12, 'FontWeight', 'normal')

hold off

saveFigure(f, clusteringPath);
close all;

end

