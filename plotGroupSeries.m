function [ output_args ] = plotGroupSeries(epochNum, groupidx, ...
    depthEpochPath, STNENTRY, STNEXIT, numGroup, groupSeriesPath)
% Function plotGroup() plots the grouping results with time.

for i = 1 : length(groupidx)
    idx1(2 * i - 1) = groupidx(i);
    idx1(2 * i) = groupidx(i);
end

timeInterval = 2;       % 4 seconds for each epoch with 50% overlap
                        % this means 2 seconds on average
timeScale = epochNum * timeInterval;
time = 2 : timeInterval : timeScale;

depthEpoch = importdata(depthEpochPath);
depthMean = mean(transpose(depthEpoch));

% convert STN entry and exit to corresponding time points x1 and x2
for i = 2 : length(depthMean)
    if depthMean(i - 1) > STNENTRY && depthMean(i) <= STNENTRY
        time1 = timeInterval * i;
    end
    if depthMean(i - 1) > STNEXIT && depthMean(i) <= STNEXIT
        time2 = timeInterval * i;
    end
end

bar(idx1, 'cyan');
addPatch(time1, time2, 0, numGroup);     % add a patch
saveFigure(gcf, groupSeriesPath);
close all;

end

