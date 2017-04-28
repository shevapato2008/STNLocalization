function [ output_args ] = kMeansClustering(featureMatrixPath, ...
    clusterPlotPath, feature1, feature2)
% Function kMeansClustering() conducts k-means clustering on data and
% make a clustering plot in a specific 2D angle.
% k = 4 in this case

X = importdata(featureMatrixPath);

k = 4;
[idx, C, sumd, D] = kmeans(X, k);

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
title 'Cluster Assignments and Centroids'
hold off

saveFigure(gcf, clusterPlotPath)

end

