function recording = mergeSgnlDpth(signal, depthData)
    % signal: 1-dimensional MER recording
    % depthData: 2-dimensional time-depth data
    % recording: 3-dimensional time-signal-depth data

    for i = 1 : size(signal, 1)
        signal(i, 2) = signal(i);
        signal(i, 1) = i;
    end;

    key = 1;
    len_signal = length(signal);
    len_depth = length(depthData);
    recording(:, 1) = signal(:, 1);
    recording(:, 2) = signal(:, 2);
    for i = 1 : len_signal
        recording(i, 3) = depthData(key, 2);
        if signal(i, 1) == depthData(key, 1)
            if key < len_depth
                key = key + 1;
            end
        end
    end
    
end