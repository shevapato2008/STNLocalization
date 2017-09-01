function [ output_args ] = plotRawRecording(rawRecordingPath, rawRecordingMapPath, STNENTRY, STNEXIT)
%PLOTRAWRECORDING Summary of this function goes here
%   Detailed explanation goes here

rawRecording = importdata(rawRecordingPath);
rawRecording_time = rawRecording;
for i = 1 : size(rawRecording, 1)
    rawRecording_time(i, 1) = (rawRecording(i, 1) - rawRecording(1, 1)) / 48000;
end

% calculate the times corresponding to STN boundaries

for i = 2 : size(rawRecording_time, 1)
    if rawRecording_time(i - 1, 3) > STNENTRY && rawRecording_time(i, 3) <= STNENTRY
        x1 = rawRecording_time(i, 1);
    end
    if rawRecording_time(i - 1, 3) > STNEXIT && rawRecording_time(i, 3) <= STNEXIT
        x2 = rawRecording_time(i, 1);
    end
end

% plot
f = figure('visible', 'off');
plot(rawRecording_time(:, 1), rawRecording_time(:, 2))
xlabel('Time (s)')
ylabel('Raw Signal')
ylim([min(rawRecording_time(:, 2))*1.05 max(rawRecording_time(:, 2))*1.05])

% add a patch
addPatch(x1, x2, min(rawRecording_time(:, 2))*1.05, max(rawRecording_time(:, 2))*1.05);

% save figure
saveFigure(f, rawRecordingMapPath);
close all;

end

