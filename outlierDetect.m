function [newVector] = outlierDetect(vector, armlength)
% Use John Tukey's 1.5IQR rule to detect outliers
% window size = armlength * 2 + 1;

newVector = vector;

for i = 1 : length(vector)
    
    % low = starting index of the window
    % high = ending index of the window
    % if-else clauses defines the indices for 3 cases: left, middle, and
    % right
    if i < armlength + 1
        low = 1;
        high = i + armlength;
    elseif i > (length(vector) - armlength)
        low = i - armlength;
        high = length(vector);
    else
        low = i - armlength;
        high = i + armlength;
    end
    
    window = vector(low : high);    % the sliding window
    
    % use John Tukey's 1.5IQR rule to detect outliers
    Q(1) = quantile(window, 0.25);  % 1st quartile
    Q(2) = quantile(window, 0.50);  % median
    Q(3) = quantile(window, 0.75);  % 3rd quartile
    IQR = Q(3) - Q(1);              % interquartile range (iqr() function also works)
    lowerLimit = Q(1) - 1.5 * IQR;  % lower limit for outliers
    upperLimit = Q(3) + 1.5 * IQR;  % upper limit for outliers
    
    if vector(i) < lowerLimit
        newVector(i) = lowerLimit;
    elseif vector(i) > upperLimit
        newVector(i) = upperLimit;
    end
end

end



