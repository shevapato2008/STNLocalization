function [minIdxOverPct, prinCompMat] = ...
    prinCompAnalysis(featureMatrixPath, percent, prinCompMatPath)

    X = importdata(featureMatrixPath);
    [coeff, score, latent, tsquared, explained, mu] = pca(X);

    cumulexplained = zeros(size(explained));
    sum = 0;
    idxOverPct = [];
    for i = 1 : size(explained, 1)
        sum = sum + explained(i);
        cumulexplained(i) = sum;
        % corner case: The sum is infinitely close to 100%.
        if abs(sum - 100) < 1E-8
            sum = 100;      % Let it be 100.
        end

        % Find out all the number of principal components that covers the
        % specified variance.
        if sum >= percent
            idxOverPct = [idxOverPct; i];
        end
    end

    minIdxOverPct = min(idxOverPct);
    disp(['The minimum number of principal components that counts ' ...
        num2str(percent) '% of the variance: ' num2str(minIdxOverPct)]);

    prinCompMat = score(:, 1 : minIdxOverPct);

    save(prinCompMatPath, 'prinCompMat', '-v7.3');

end