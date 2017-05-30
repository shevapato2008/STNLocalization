function [ output_args ] = getWeightedFeatureMatrix(weightVector, ...
    inputFeatureMatrixPath, outputFeatureMatrixPath)
%GETWEIGHTEDFEATUREMATRIX Summary of this function goes here
%   Detailed explanation goes here

weight_diag = diag(weightVector);
normFeatureMatrix = importdata(inputFeatureMatrixPath);
weightedFeatureMatrix = normFeatureMatrix * weight_diag;

disp('Saving weighted feature Matrix ...');
save(outputFeatureMatrixPath, 'weightedFeatureMatrix', '-v7.3');

end

