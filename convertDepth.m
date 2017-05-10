function outputMat = convertDepth(depthMat)
%CONVERTDEPTH Summary of this function goes here
%   Detailed explanation goes here

nrow = size(depthMat, 1);
outputMat = zeros(nrow, 3);
outputMat(:, 1 : 2) = depthMat; 

for i = 1 : nrow
    outputMat(i, 3) = 30 - outputMat(i, 2) / 1000;
end

end

