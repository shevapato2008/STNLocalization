function [ output_args ] = transformFeatures(featureList, ...
    normFeatureMatrixPath, transformMatrixPath)
% Function transformFeatures() transforms the specified features by taking
% square root.
% featureList: an array of features to take the square root transformation

load(normFeatureMatrixPath);

nfeature = length(featureList);
nrow = size(normFeatureMatrix, 1);
ncol = size(normFeatureMatrix, 2);

for j = 1 : nfeature
    for i = 1 : nrow
        normFeatureMatrix(i, featureList(j)) = sqrt(normFeatureMatrix(i, j));
    end
end

save(transformMatrixPath, 'normFeatureMatrix', '-v7.3');

end

