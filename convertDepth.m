function outputMat = convertDepth(depthMat)
%CONVERTDEPTH Summary of this function goes here
%   Detailed explanation goes here

MIN = min(depthMat(:, 2));
MAX = max(depthMat(:, 2));
RANGE = MAX - MIN;
numRow = size(depthMat, 1);
outputMat = zeros(numRow, 3);
outputMat(:, 1 : 2) = depthMat; 

for i = 1 : numRow
    PERCENT = (outputMat(i, 2) - MIN) / RANGE;
    outputMat(i, 3) = 15 - 20 * PERCENT;
end

end

