function [] = plotMER(recording, signalType)

    % recording: input 3-dimensional data with time, signal, and depth

    time = recording(:, 1);
    signal = recording(:, 2);
    depth = recording(:, 3);

    figure
    ax(1) = subplot(3, 1, 1);
    plot(time, signal)
    axis(ax(1), [-inf inf -inf inf])
    xlabel('Time')
    ylabel('Signal')
    title(['Time - Signal (', signalType, ')'])

    ax(2) = subplot(3, 1, 2);
    plot(depth, signal)
    axis(ax(2), [-inf inf -inf inf])
    xlabel('Depth')
    ylabel('Signal')
    title(['Depth - Signal (', signalType, ')'])

    ax(3) = subplot(3, 1, 3);
    plot(time, depth)
    axis(ax(3), [-inf inf -inf inf])
    xlabel('Time')
    ylabel('Depth')
    title(['Time - Depth (', signalType, ')'])
    
end