function [ output_args ] = ...
    getNormFeatureMatrix(index, featureMatrixPath, normFeatureMatrixPath)
% Function getNormFeatureMatrix helps generate normalized feature matrices.

featureMatrix = importdata(featureMatrixPath);

numRow = size(featureMatrix, 1);
numCol = size(featureMatrix, 2);

% Standardization
stdFeatureMatrix = zeros(numRow, numCol);
for col = 1 : numCol
    % nanstd calculates standard deviation ignoring the NaN values
    STD = nanstd(featureMatrix(:, col));
    % nanmedian calculates median ignoring the NaN values
    MEDIAN = nanmedian(featureMatrix(:, col));
    for row = 1 : numRow
        stdFeatureMatrix(row, col) ...
            = (featureMatrix(row, col) - MEDIAN) / STD;
    end
end

% Normalization
normFeatureMatrix = zeros(numRow, numCol);

for col = 1 : numCol
    MIN = min(stdFeatureMatrix(:, col));
    MAX = max(stdFeatureMatrix(:, col));
    for row = 1 : numRow
        normFeatureMatrix(row, col) ...
            = (stdFeatureMatrix(row, col) - MIN) / (MAX - MIN);
    end
end

disp(['Saving normalized featureMatrix' num2str(index) '...']);
save(normFeatureMatrixPath, 'normFeatureMatrix', '-v7.3');

end

