function matrix = getEpochMatrix(signal, epochDur, fs)

% This function converts 1D signal to a 50% overlapping epoch matrix. Extra
% value will be truncated.

% signal = N * 1 signal
% epochDur = number of seconds per epoch
% fs = sampling rate

% calculate number of sample points for each epoch
rowLen = epochDur * fs;

% create zero matrix to store epoch matrix
matrix = zeros(2 * floor(length(signal) / rowLen), rowLen);

% use while loop to fill the matrix with 50% overlapping signal values
rowIdx = 1;
while ((rowIdx + 1) * rowLen * 0.5 <= length(signal))
    matrix(rowIdx, 1 : rowLen) ...
        = signal( ((rowIdx - 1) * rowLen * 0.5 + 1) : ((rowIdx + 1) * rowLen * 0.5), 1);
    rowIdx = rowIdx + 1;
end

end