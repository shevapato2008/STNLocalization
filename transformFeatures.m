function [ output_args ] = transformFeatures(featureList, ...
    featureMatrixPath, transformMatrixPath)
% Function transformFeatures() transforms the specified features by taking
% square root.
% featureList: an array of features to take the square root transformation

X = importdata(featureMatrixPath);

nfeature = length(featureList);
nrow = size(X, 1);
ncol = size(X, 2);

for j = 1 : nfeature
    for i = 1 : nrow
        % no transformation
        % X(i, featureList(j)) = sqrt(X(i, featureList(j)));    % ^(1/2)
        X(i, featureList(j)) = X(i, featureList(j)) ^ (1/3);    % ^(1/3)
    end
end

save(transformMatrixPath, 'X', '-v7.3');

end

