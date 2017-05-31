%% LFP Dependent Features %%

% Create a function handle to call feature functions %
function fh = lfpDepFeatures
    fh.powerxw = @PowerXw;          % feature 1
    fh.pkxw = @PKXw;                % feature 2
    fh.fmaxpkxw = @FmaxPKXw;        % feature 3
    fh.cvxw = @CVXw;                % feature 4
    fh.zerocrossxw = @ZeroCrossXw;  % feature 5
    fh.maxcohxy = @maxCohXY;        % feature 6 & 7
end



% (1) Power band ratio of signal X in frequency band W (similar to RMSA)
function output = PowerXw(signal, startFreq, endFreq)
    len = length(signal);
    sst = 0;
    for i = 1 : len
        sst = sst + signal(i) .^ 2;
    end
    
    avgFreq = (startFreq + endFreq) / 2.0;
    output = sst / (len * avgFreq);
end



% (2) Peak to average power ratio of signal X in frequency band W (PKXw)
function output = PKXw(signal, startFreq, endFreq, samplingRate)
    [pxx, f] = pwelch(signal, [], [], [], samplingRate);
        % pxx: power spectrum density estimate
        % f: corresponding frequency
    sum = 0;
    counter = 0;
    peak = 0;
    for i = 1 : length(pxx)
        if f(i) >= startFreq && f(i) < endFreq
            sum = sum + pxx(i);
            counter = counter + 1;
            if pxx(i) > peak
                peak = pxx(i);
            end
        end
    end
    avgPower = sum / counter;
    output = peak / avgPower;
end



% (3) Frequency corresponding to maximum peak to average power ratio of 
%     signal X in frequency band W (FmaxPKXw)
function output = FmaxPKXw(signal, startFreq, endFreq, samplingRate)
    [pxx, f] = pwelch(signal, [], [], [], samplingRate);
        % pxx: power spectrum density estimate
        % f: corresponding frequency
    sum = 0;
    counter = 0;
    peak = 0;
    peakIdx = 0;
    for i = 1 : length(pxx)
        if f(i) >= startFreq && f(i) < endFreq
            sum = sum + pxx(i);
            counter = counter + 1;
            if pxx(i) > peak
                peak = pxx(i);
                peakIdx = i;
            end
        end
    end
    avgPower = sum / counter;
    output = peakIdx / avgPower;
end



% (4) Coefficient of variation of signal X in frequency band W (CVXw)
% https://en.wikipedia.org/wiki/Coefficient_of_variation
% It is a standardized measure of dispersion of a probability distribution
% or frequency distribution.
function output = CVXw(signal)
    output = std(signal) / mean(signal);
end



% (5) LFP phase-amplitude cross frequency coupling index between the phase
%      in band W and amplitude in band Z (PAFCwz)



% (6) LFP phase-phase cross frequency coupling index between the phase in
%      band W and phase in band Z (PPFCwz)



% (7) Zero crossings in signal X in band W (ZeroCrossXw)
function output = ZeroCrossXw(signal)
    % vec: data epoch vector of length N 
    len = length(signal);
    total = 0;
    for i = 1 : (len - 1)
        diff = sign(signal(i + 1)) - sign(signal(i));
        total = total + abs(diff);
    end
    
    output = total / 2;
end




% (8) Maximum coherence between signals X and Y (maxCohXY)
% (9) Maximum coherence between X and Y in frequency band W (maxCohXYw)
% https://en.wikipedia.org/wiki/Coherence_(signal_processing)
% https://www.mathworks.com/help/signal/ref/mscohere.html
function output = maxCohXY(signal1, signal2, fs)
    % determine the array of frequencies you want to estimate the coherence
    % input signal1 and signal2 must have the same length
    f = transpose(1 : 1 : fs/2);
    [Cxy, F] = mscohere(signal1, signal2, [], [], f, fs);
        % For real signals, the range of F is [0, fs/2] when nfft
        % is even and [0, fs/2) when nfft is odd. For complex
        % signals, the range of F is [0, fs).
    temp = [Cxy, F];
    figure
    plot(temp(:, 1))
    xlabel('Hz')
    ylabel('Coherence')
    output = max(temp(:, 1));
end



% (10) Maximum phase locking index in band W for the LFP signal (max_PLw)


