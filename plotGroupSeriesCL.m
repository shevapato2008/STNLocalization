function [ output_args ] = plotGroupSeriesCL(epochNum, groupidx, ...
    featureMatrixPath, depthEpochPath, ...
    index, location, STNENTRY, STNEXIT, groupSeriesPath)
% Function plotGroup() plots the grouping results with time.

% convert group index into average level of curve length in that group
X = importdata(featureMatrixPath);
CL = X(:, 13);  % assign curve length feature vector to CL
sum = zeros(4, 1);
count = zeros(4, 1);
CLavg = zeros(4, 1);
for i = 1 : length(groupidx)
    if isnan(CL(i))
        continue;
    else
        if groupidx(i) == 1
            sum(1) = sum(1) + CL(i);
            count(1) = count(1) + 1;
        elseif groupidx(i) == 2
            sum(2) = sum(2) + CL(i);
            count(2) = count(2) + 1;
        elseif groupidx(i) == 3
            sum(3) = sum(3) + CL(i);
            count(3) = count(3) + 1;
        elseif groupidx(i) == 4
            sum(4) = sum(4) + CL(i);
            count(4) = count(4) + 1;
        end
    end
    
    if i == length(groupidx)
        CLavg(1) = sum(1) / count(1);
        CLavg(2) = sum(2) / count(2);
        CLavg(3) = sum(3) / count(3);
        CLavg(4) = sum(4) / count(4);
    end
end

idx1 = zeros(size(groupidx));
for i = 1 : length(idx1)
    if groupidx(i) == 1
        idx1(i) = CLavg(1);
    elseif groupidx(i) == 2
        idx1(i) = CLavg(2);
    elseif groupidx(i) == 3
        idx1(i) = CLavg(3);
    elseif groupidx(i) == 4
        idx1(i) = CLavg(4);
    end
end


for i = 1 : length(idx1)
    idx2(2 * i - 1) = idx1(i);
    idx2(2 * i) = idx1(i);
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

f = figure('visible', 'off');
bar(idx2, 'Blue');
xlabel('Time (s)');
ylabel('Curve Length');
addPatch(time1, time2, 0, 1);	% add a patch
h = title({['K-means Clustering for MER ' num2str(index)], ...
              location(index), ...
              ['STN Entry: ' num2str(STNENTRY)], ...
              ['STN Exit: ' num2str(STNEXIT)]});
set(h, 'FontSize', 12, 'FontWeight', 'normal')
saveFigure(f, groupSeriesPath);
close all;

end

