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


