%% Hypothesis Testing
TrueBounds = zeros(31, 2);
PredBounds = zeros(31, 2);
diff = zeros(31, 2);

% trajectory 3: STNBounds(3, :) = [0.65, -3.82];
TrueBounds(1, :) = [0.65, -3.82];
PredBounds(1, :) = [0.71, -3.81];

% trajectory 6: STNBounds(2, :) = [5.51, 0.80];
TrueBounds(2, :) = [5.51, 0.80];
PredBounds(2, :) = [6.00, 1.50];

% trajectory 7: STNBounds(3, :) = [4.20, -0.40];
TrueBounds(3, :) = [4.20, -0.40];
PredBounds(3, :) = [4.09, -0.09];

% trajectory 9: STNBounds(9, :) = [5.12, 0.30];
TrueBounds(4, :) = [5.12, 0.30];
PredBounds(4, :) = [5.08, 0.21];

% trajectory 10: STNBounds(10, :) = [0.90, -2.50];
TrueBounds(5, :) = [0.90, -2.50];
PredBounds(5, :) = [0.83, -2.47];

% trajectory 14: STNBounds(14, :) = [4.20, -1.20];
TrueBounds(6, :) = [4.20, -1.20];
PredBounds(6, :) = [4.20, -1.33];

% trajectory 15: STNBounds(15, :) = [2.60, 0.70];
TrueBounds(7, :) = [2.60, 0.70];
PredBounds(7, :) = [2.58, 0.76];

% trajectory 16: STNBounds(16, :) = [5.60, 1.30];
TrueBounds(8, :) = [5.60, 1.30];
PredBounds(8, :) = [5.85, 1.89];

% trajectory 17: STNBounds(17, :) = [6.56, 2.00];
TrueBounds(9, :) = [6.56, 2.00];
PredBounds(9, :) = [6.58, 2.37];


% trajectory 21 STNBounds(21, :) = [3.72, -1.72];
TrueBounds(10, :) = [3.72, -1.72];
PredBounds(10, :) = [3.72, -1.68];

% trajectory 23 STNBounds(23, :) = [5.44, 1.45];
TrueBounds(11, :) = [5.44, 1.45];
PredBounds(11, :) = [5.63, 1.75];

% trajectory 26 STNBounds(26, :) = [1.10, -3.00];
TrueBounds(12, :) = [1.10, -3.00];
PredBounds(12, :) = [1.24, -2.79];

% trajectory 27 STNBounds(27, :) = [1.96, -3.50];
TrueBounds(13, :) = [1.96, -3.50];
PredBounds(13, :) = [1.89, -3.34];

% trajectory 28 STNBounds(28, :) = [2.55, -1.59];
TrueBounds(14, :) = [2.55, -1.59];
PredBounds(14, :) = [2.62, -1.40];

% trajectory 30 STNBounds(30, :) = [2.15, -2.50];
TrueBounds(15, :) = [2.15, -2.50];
PredBounds(15, :) = [2.18, -2.36];

% trajectory 31 STNBounds(31, :) = [5.94, 1.73];
TrueBounds(16, :) = [5.94, 1.73];
PredBounds(16, :) = [6.07, 1.85];

% trajectory 32 STNBounds(32, :) = [4.30, 0.62];
TrueBounds(17, :) = [4.30, 0.62];
PredBounds(17, :) = [4.82, 0.71];

% trajectory 36 STNBounds(36, :) = [4.40, 0.34];
TrueBounds(18, :) = [4.40, 0.34];
PredBounds(18, :) = [4.52, 0.67];

% trajectory 38 STNBounds(38, :) = [3.11, -0.10];
TrueBounds(19, :) = [3.11, -0.10];
PredBounds(19, :) = [3.12, 0.14];

% trajectory 39 STNBounds(39, :) = [4.93, -0.26];
TrueBounds(20, :) = [4.93, -0.26];
PredBounds(20, :) = [4.91, -0.19];

% trajectory 40? STNBounds(40, :) = [0.00, -4.00];
TrueBounds(21, :) = [0.00, -4.00];
PredBounds(21, :) = [0.27, -4.60];

% trajectory 41 STNBounds(41, :) = [4.36, 0.26];
TrueBounds(22, :) = [4.36, 0.26];
PredBounds(22, :) = [4.35, 0.25];

% trajectory 45 STNBounds(45, :) = [4.12, 0.64];
TrueBounds(23, :) = [4.12, 0.64];
PredBounds(23, :) = [4.11, 0.63];

% trajectory 47 STNBounds(47, :) = [6.65, 1.65];
TrueBounds(24, :) = [6.65, 1.65];
PredBounds(24, :) = [7.042, 2.12];

% trajectory 48 STNBounds(48, :) = [5.98, 0.50];
TrueBounds(25, :) = [5.98, 0.50];
PredBounds(25, :) = [5.98, 0.65];

% trajectory 29? STNBounds(29, :) = [2.55, -1.04];
TrueBounds(26, :) = [2.55, -1.04];
PredBounds(26, :) = [1.80, -0.12];

% ? trajectory 22 STNBounds(22, :) = [4.50, -0.25];
TrueBounds(27, :) = [4.50, -0.25];
PredBounds(27, :) = [4.50, 1.08];

% ? trajectory 20 STNBounds(20, :) = [4.40, -1.40];
TrueBounds(28, :) = [4.40, -1.40];
PredBounds(28, :) = [4.39, -0.01];

% trajectory 50 STNBounds(50, :) = [5.90, -0.11];
TrueBounds(29, :) = [5.90, -0.11];
PredBounds(29, :) = [5.81, 0.06];

% trajectory 52 STNBounds(52, :) = [5.30, -0.05];
TrueBounds(30, :) = [5.30, -0.05];
PredBounds(30, :) = [5.22, -0.06];

% trajectory 53 STNBounds(53, :) = [3.10, -1.80];
TrueBounds(31, :) = [3.10, -1.80];
PredBounds(31, :) = [3.06, -1.42];


n = size(diff, 1);
diff = PredBounds - TrueBounds;
mean(diff)
std(diff)
ts = tinv([0.025  0.975], n-1)
disp("95% CI for STN entry:")
CI = mean(diff(:, 1)) + ts * std(diff(:, 1))/sqrt(n)
disp("95% CI for STN exit:")
CI = mean(diff(:, 2)) + ts * std(diff(:, 2))/sqrt(n)

%% Scatter plot
% (0) Set up index
for i = 1 : length(diff)
    diff(i, 3) = i;
end

% (1) STN Entry
scatter(diff(:, 3), diff(:, 1), 30, 'k', 'o', 'filled')
ylim([-2 2])

% (2) STN Exit
scatter(diff(:, 3), diff(:, 2), 30, 'k', 'x')
ylim([-2 2])

%% Boxplot
boxplot(diff(:, 1:2))


