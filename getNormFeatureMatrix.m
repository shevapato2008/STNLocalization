function [ output_args ] = ...
    getNormFeatureMatrix(index, featureMatrixPath, normFeatureMatrixPath)
% Function getNormFeatureMatrix helps generate normalized feature matrices.

load(featureMatrixPath);
numRow = size(featureMatrix, 1);
numCol = size(featureMatrix, 2);
normFeatureMatrix = zeros(numRow, numCol);

for col = 1 : numCol
    MIN = min(featureMatrix(:, col));
    MAX = max(featureMatrix(:, col));
    for row = 1 : numRow
        normFeatureMatrix(row, col) ...
            = (featureMatrix(row, col) - MIN) / (MAX - MIN);
    end
end

disp(['Saving normalized featureMatrix' num2str(index) '...']);
save(normFeatureMatrixPath, 'normFeatureMatrix', '-v7.3');

end

