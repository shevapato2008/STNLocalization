function recording = mergeSgnlDpth(type, signal, depthData)
    % signal: 1-dimensional MER recording
    % depthData: 2-dimensional time-depth data
    % recording: 3-dimensional time-signal-depth data
    
    signalLen = length(signal);
    depthLen = length(depthData);
    recording = zeros(signalLen, 3);
    for i = 1 : signalLen
        if strcmp(type, 'rawSignal')
            recording(i, 1) = depthData(1, 1) + i - 1;
        elseif strcmp(type, 'lfp')
            recording(i, 1) = depthData(1, 1) + (i - 1) * (48000 / 1000);
        end
        
        recording(i, 2) = signal(i);
    end

    key = 1;
    for i = 1 : signalLen
        if recording(i, 1) <= depthData(key, 1)
            recording(i, 3) = depthData(key, 2);
        else
            if key < depthLen
                recording(i, 3) = depthData(key + 1, 2);
                key = key + 1;
            else
                recording(i, 3) = depthData(key, 2);
            end
        end
    end
    
end