%% Spike Indepdent Features %%

% Create a function handle to call feature functions %
function fh = spikeIndepFeatures
    fh.curv_len = @curv_len;                        % feature 1
    fh.thrshld = @thrshld;                          % feature 2
    fh.peaks = @peaks;                              % feature 3: It has some deficiency.
    fh.rmsa = @rmsa;                                % feature 4
    fh.avg_nonlnr_energy = @avg_nonlnr_energy;      % feature 5
    fh.zero_crossing = @zero_crossing;              % feature 6
    fh.powerxw_fft = @PowerXw_FFT;                  % feature 7.1
    fh.powerxw_pwelch = @PowerXw_PWELCH;            % feature 7.2
    fh.pkxw = @PKXw;                                % feature 8
    fh.fmaxpkxw = @FmaxPKXw;                        % feature 9
    fh.cvxw = @CVXw;                                % feature 10
    fh.zerocrossx = @ZeroCrossX;                    % feature 13
    fh.maxcohxy = @maxCohXY;                        % feature 14 & 15
end



% (1) Curve length %
% Source: S. Wong et al. 2009 J Neural Eng
function output = curv_len(vec)
    % vec: data epoch vector of length N
    output = 0;
    for i = 2 : length(vec)
        output = output + abs(vec(i) - vec(i - 1));
    end
end
% h = spikeIndepFeatures
% h.curv_len([1 2 3])



% (2) Threshold %
% Source: S. Wong et al. 2009 J Neural Eng
function output = thrshld(vec)
    % vec: data epoch vector of length N 
    len = length(vec);
    mu = mean(vec);
    sst = 0;
    for i = 1 : len
        sst = sst + (vec(i) - mu) .^ 2;
    end
    
    output = 3 * sqrt(sst) / (len - 1);
end
% h = spikeIndepFeatures
% h.thrshld([1 2 3])



% (3) Peaks %
% Source: S. Wong et al. 2009 J Neural Eng
function output = peaks(vec)
    % vec: data epoch vector of length N 
    len = length(vec);
    total = 0;
    for i = 1 : (len - 2)
        diff = sign(vec(i + 1) - vec(i)) - sign(vec(i + 2) - vec(i + 1));
        total = total + max(0, diff);
    end
    
    output = total / 2;
end

% Call these function
% h = spikeIndepFeatures
% h.peaks([1 2 1 2 1])          correct = 2
% h.peaks([1 2 1 2 2 2 1])      correct = 2
% h.peaks([1 2 2 3])            correct = 0



% (4) Root mean square amplitude %
% Source: S. Wong et al. 2009 J Neural Eng
function output = rmsa(vec)
    % vec: data epoch vector of length N 
    len = length(vec);
    sst = 0;
    for i = 1 : len
        sst = sst + vec(i) .^ 2;
    end
    
    output = sqrt(sst / len);
end
% h = spikeIndepFeatures
% h.rmsa([1 2 3])



% (5) Average nonlinear energy %
% Source: S. Wong et al. 2009 J Neural Eng
function output = avg_nonlnr_energy(vec)
    % vec: data epoch vector of length N 
    len = length(vec);
    total = 0;
    for i = 2 : (len - 1)
        total = total + (vec(i) .^ 2 - vec(i - 1) * vec(i + 1));
    end
    
    output = total / (len - 2);
end
% h = spikeIndepFeatures
% h.avg_nonlnr_energy([1 2 3 4])
% h.avg_nonlnr_energy([3 2 1 4])


% (6) Zero crossings %                              
% Source: S. Wong et al. 2009 J Neural Eng
function output = zero_crossing(vec)
    % vec: data epoch vector of length N 
    len = length(vec);
    total = 0;
    for i = 1 : (len - 1)
        diff = sign(vec(i + 1)) - sign(vec(i));
        total = total + abs(diff);
    end
    
    output = total / 2;
end



% (7) Power band ratio of signal X in frequency band W

% (7.1) Power band ratio of signal X in frequency band W (PowerXw_FFT)
% Tutorial on fft: https://www.youtube.com/watch?v=dM1y6ZfQkDU
function output = PowerXw_FFT(lpfSignal, startFreq, endFreq)
    fftResult = fft(lpfSignal);
    fftResultMag = abs(fftResult);      % magnitude spectrum is symmetric
                                        % halfway of the frequency axis
                                        % represents 3000Hz
    len = length(fftResultMag);
    for i = 1 : len
        fftResultMag(i, 2) = fftResultMag(len - i + 1, 1);
    end
    plot(fftResultMag(:, 1))            % check the symmetric distribution of fft

    for i = 1 : len
        fftResultMag(i, 3) = fftResultMag(i, 1) / (len / 2);  % normalization
    end

    startPoint = round(len * startFreq / 3000);
    endPoint = round(len * endFreq / 3000);

    sum = 0;
    for i = startPoint : endPoint
        sum = sum + fftResultMag(i, 3) ^ 2;
    end
    sum = sum / (endPoint - startPoint);
    avgBand = (startFreq + endFreq) / 2;
    output = sum / avgBand;         % output is the power band ratio
end

% (7.2) Power band ratio of signal X in frequency band W (PowerXw_PWELCH)
% Tutorial on pwelch: https://www.youtube.com/watch?v=qrU2jsSqWD8
% About the output unit:
% https://www.mathworks.com/matlabcentral/answers/271480-what-are-the-output-pwelch-units
function output = PowerXw_PWELCH(signal, startFreq, endFreq, samplingRate)
    [pxx, f] = pwelch(signal, [], [], [], samplingRate);    % pxx: power spectrum density
                                                            % f: corresponding frequency
    pow2freq = pxx ./ f;            % pow2freq: power over frequency
    
    sum = 0;
    counter = 0;
    for i = 1 : length(pxx)
        if f(i) >= startFreq && f(i) < endFreq
            sum = sum + pow2freq(i);
            counter = counter + 1;
        end
    end
    output = sum / counter;
end



% (8) Peak to average power ratio of signal X in frequency band W (PKXw)
function output = PKXw(signal, startFreq, endFreq, samplingRate)
    [pxx, f] = pwelch(signal, [], [], [], samplingRate);    % pxx: power spectrum density
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



% (9) Frequency corresponding to maximum peak to average power ratio of 
%     signal X in frequency band W (FmaxPKXw)
function output = FmaxPKXw(signal, startFreq, endFreq, samplingRate)
    [pxx, f] = pwelch(signal, [], [], [], samplingRate);    % pxx: power spectrum density
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



% (10) Coefficient of variation of signal X in frequency band W (CVXw)
% https://en.wikipedia.org/wiki/Coefficient_of_variation
% It is a standardized measure of dispersion of a probability distribution
% or frequency distribution.
function output = CVXw(signal)
    output = std(signal) / mean(signal);
end



% (11) LFP phase-amplitude cross frequency coupling index between the phase
%      in band W and amplitude in band Z (PAFCwz)



% (12) LFP phase-phase cross frequency coupling index between the phase in
%      band W and phase in band Z (PPFCwz)



% (13) Percentage of zero crossings in signal X (ZeroCrossX)
function output = ZeroCrossX(signal)
    sum = zero_crossing(signal);
    output = sum / length(signal);
end



% (14) Maximum coherence between signals X and Y (maxCohXY)
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



% (15) Maximum coherence between X and Y in frequency band W (maxCohXYw)



% (16) Maximum phase locking index in band W for the LFP signal (max_PLw)


