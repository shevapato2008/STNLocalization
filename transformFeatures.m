function [ output_args ] = transformFeatures(featureList, ...
    featureMatrixPath, transformMatrixPath)
% Function transformFeatures() transforms the specified features by taking
% square root.
% featureList: an array of features to take the square root transformation

X = importdata(featureMatrixPath);

nfeature = length(featureList);
nrow = size(X, 1);
ncol = size(X, 2);

for j = 1 : ncol
    
    MIN = min(X(:, j));
    
    % If MIN < 0 and the feature is on the list of features for
    % transformation, make the feature values non-negative before
    % transformation.
    if MIN < 0 && any(j == featureList)
        for i = 1 : nrow
            X(i, j) = X(i, j) + abs(MIN);
        end
    end

end

% take transformation on those on the feature list
for j = 1 : nfeature

    for i = 1 : nrow
        % no transformation
        X(i, featureList(j)) = sqrt(X(i, featureList(j)));      % ^(1/2)
        % X(i, featureList(j)) = X(i, featureList(j)) ^ (1/3);	% ^(1/3)
    end
    
end

save(transformMatrixPath, 'X', '-v7.3');

end

