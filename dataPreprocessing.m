%% Set current folder %%
cd('S:\Google Drive\Rutgers University\Research\DBS\Project\Matlab\Program')


%% 1. Load raw signal, LFP signal, and depth data %%

%% [Patient 1] [Trajectory 1] = [2010-01-07] [Left] [Pass 1] [Center]
%{
Uni-Bi:     Bilateral
STN Entry:	2.95
STN Exit:   0.30
SN Entry:	N/A
%}

% (0) check related data
dataDir = 'S:\Google Drive\Rutgers University\Research\DBS\Project\Data\DATA\NEW\';
allFiles = dir(dataDir);
allNames = {allFiles.name};

% (1) depth
% load depth data
depth_part0 = loadDepth([dataDir '2010-01-07_STN Left_Pass 1_C_Snapshot - 3600_.0 sec.mat']);
depth_part1 = loadDepth([dataDir '2010-01-07_STN Left_Pass 1_C_Snapshot - 3600_.0 sec 1.mat']);
depth_part2 = loadDepth([dataDir '2010-01-07_STN Left_Pass 1_C_Snapshot - 3600_.0 sec 2.mat']);
depth_part3 = loadDepth([dataDir '2010-01-07_STN Left_Pass 1_C_Snapshot - 3600_.0 sec 3.mat']);
depth_part4 = loadDepth([dataDir '2010-01-07_STN Left_Pass 1_C_Snapshot - 3600_.0 sec 4.mat']);
depth_part5 = loadDepth([dataDir '2010-01-07_STN Left_Pass 1_C_Snapshot - 3600_.0 sec 5.mat']);
depth_part6 = loadDepth([dataDir '2010-01-07_STN Left_Pass 1_C_Snapshot - 3600_.0 sec 6.mat']);
% Note: Based on the depth data, only part 2, 3, 4, 5 are usable and
%       should be concatenated. Part 0 and 1 are not consecutive. Part 1
%       and 2 are not consecutive either. Part 6 goes backwards.

% remove the difference in time before concatenating the depth data
diff23 = depth_part3(1, 1) - depth_part2(length(depth_part2), 1);
depth_part3(:, 1) = depth_part3(:, 1) - diff23 + 1;
diff34 = depth_part4(1, 1) - depth_part3(length(depth_part3), 1);
depth_part4(:, 1) = depth_part4(:, 1) - diff34 + 1;
diff45 = depth_part5(1, 1) - depth_part4(length(depth_part4), 1);
depth_part5(:, 1) = depth_part5(:, 1) - diff45 + 1;

% concatenate depth data
depth_temp = vertcat(depth_part2, ...
                     depth_part3, ...
                     depth_part4, ...
                     depth_part5);
                 
% convert original depth data to milimeters above target
depth = convertDepth(depth_temp);


% (2) signals
% load rawSignals
rawSignal_part2 = loadRawSignal([dataDir '2010-01-07_STN Left_Pass 1_C_Snapshot - 3600_.0 sec 2.mat']);
rawSignal_part3 = loadRawSignal([dataDir '2010-01-07_STN Left_Pass 1_C_Snapshot - 3600_.0 sec 3.mat']);
rawSignal_part4 = loadRawSignal([dataDir '2010-01-07_STN Left_Pass 1_C_Snapshot - 3600_.0 sec 4.mat']);
rawSignal_part5 = loadRawSignal([dataDir '2010-01-07_STN Left_Pass 1_C_Snapshot - 3600_.0 sec 5.mat']);
% concatenate rawSignals
rawSignal = vertcat(rawSignal_part2, ...
                    rawSignal_part3, ...
                    rawSignal_part4, ...
                    rawSignal_part5);

% load lfps
lfp_part2 = loadLFP([dataDir '2010-01-07_STN Left_Pass 1_C_Snapshot - 3600_.0 sec 2.mat']);
lfp_part3 = loadLFP([dataDir '2010-01-07_STN Left_Pass 1_C_Snapshot - 3600_.0 sec 3.mat']);
lfp_part4 = loadLFP([dataDir '2010-01-07_STN Left_Pass 1_C_Snapshot - 3600_.0 sec 4.mat']);
lfp_part5 = loadLFP([dataDir '2010-01-07_STN Left_Pass 1_C_Snapshot - 3600_.0 sec 5.mat']);
% concatenate lfps
lfp = vertcat(lfp_part2, ...
              lfp_part3, ...
              lfp_part4, ...
              lfp_part5);

% (3) save data
disp('Saving rawSignal1.mat ...');
save('Data\Raw\rawSignal1.mat', 'rawSignal', '-v7.3');
disp('Saving lfp1.mat ...');
save('Data\Raw\lfp1.mat', 'lfp', '-v7.3');
disp('Saving depth1.mat ...');
save('Data\Raw\depth1.mat', 'depth', '-v7.3');

clear;



%% [Patient 1] [Unused Trajectory 1] = [2010-01-07] [Left] [Pass 2] [Posterior]
%{
Uni-Bi:     Bilateral
STN Entry:	N/A
STN Exit:   N/A
SN Entry:	N/A
%}

%% [Patient 1] [Unused Trajectory 2] = [2010-01-07] [Left] [Pass 3] [Anterior]
%{
Uni-Bi:     Bilateral
STN Entry:	N/A
STN Exit:   N/A
SN Entry:	N/A
%}



%% [Patient 1] [Trajectory 2] = [2010-01-07] [Right] [Pass 1] [Center]
%{
Uni-Bi:     Bilateral
STN Entry:	 2.20
STN Exit:   -0.25
SN Entry:	-1.81
%}

% (0) check related data
dataDir = 'S:\Google Drive\Rutgers University\Research\DBS\Project\Data\DATA\NEW\';
allFiles = dir(dataDir);
allNames = {allFiles.name};

% (1) depth
% load depth data
depth_part0 = loadDepth([dataDir '2010-01-07_STN Right_Pass 1_C_Snapshot - 3600_.0 sec.mat']);
depth_part1 = loadDepth([dataDir '2010-01-07_STN Right_Pass 1_C_Snapshot - 3600_.0 sec 1.mat']);
depth_part2 = loadDepth([dataDir '2010-01-07_STN Right_Pass 1_C_Snapshot - 3600_.0 sec 2.mat']);
depth_part3 = loadDepth([dataDir '2010-01-07_STN Right_Pass 1_C_Snapshot - 3600_.0 sec 3.mat']);
depth_part4 = loadDepth([dataDir '2010-01-07_STN Right_Pass 1_C_Snapshot - 3600_.0 sec 4.mat']);
depth_part5 = loadDepth([dataDir '2010-01-07_STN Right_Pass 1_C_Snapshot - 3600_.0 sec 5.mat']);
depth_part6 = loadDepth([dataDir '2010-01-07_STN Right_Pass 1_C_Snapshot - 3600_.0 sec 6.mat']);
depth_part7 = loadDepth([dataDir '2010-01-07_STN Right_Pass 1_C_Snapshot - 3600_.0 sec 7.mat']);
% Note: Based on the depth data, part 1, 2, 3, 4, 5, 6 are usable and
%       should be concatenated. Part 0 and 1 are not consecutive. Part 7
%       goes backwards.

% remove the difference in time before concatenating the depth data
diff12 = depth_part2(1, 1) - depth_part1(length(depth_part1), 1);
depth_part2(:, 1) = depth_part2(:, 1) - diff12 + 1;
diff23 = depth_part3(1, 1) - depth_part2(length(depth_part2), 1);
depth_part3(:, 1) = depth_part3(:, 1) - diff23 + 1;
diff34 = depth_part4(1, 1) - depth_part3(length(depth_part3), 1);
depth_part4(:, 1) = depth_part4(:, 1) - diff34 + 1;
diff45 = depth_part5(1, 1) - depth_part4(length(depth_part4), 1);
depth_part5(:, 1) = depth_part5(:, 1) - diff45 + 1;
diff56 = depth_part6(1, 1) - depth_part5(length(depth_part5), 1);
depth_part6(:, 1) = depth_part6(:, 1) - diff56 + 1;

% concatenate depth data
depth_temp = vertcat(depth_part1, ...
                     depth_part2, ...
                     depth_part3, ...
                     depth_part4, ...
                     depth_part5, ...
                     depth_part6);

% convert original depth data to milimeters above target
depth = convertDepth(depth_temp);


% (2) signals
% load rawSignals
rawSignal_part1 = loadRawSignal([dataDir '2010-01-07_STN Right_Pass 1_C_Snapshot - 3600_.0 sec 1.mat']);
rawSignal_part2 = loadRawSignal([dataDir '2010-01-07_STN Right_Pass 1_C_Snapshot - 3600_.0 sec 2.mat']);
rawSignal_part3 = loadRawSignal([dataDir '2010-01-07_STN Right_Pass 1_C_Snapshot - 3600_.0 sec 3.mat']);
rawSignal_part4 = loadRawSignal([dataDir '2010-01-07_STN Right_Pass 1_C_Snapshot - 3600_.0 sec 4.mat']);
rawSignal_part5 = loadRawSignal([dataDir '2010-01-07_STN Right_Pass 1_C_Snapshot - 3600_.0 sec 5.mat']);
rawSignal_part6 = loadRawSignal([dataDir '2010-01-07_STN Right_Pass 1_C_Snapshot - 3600_.0 sec 6.mat']);
% concatenate rawSignals
rawSignal = vertcat(rawSignal_part1, ...
                    rawSignal_part2, ...
                    rawSignal_part3, ...
                    rawSignal_part4, ...
                    rawSignal_part5, ...
                    rawSignal_part6);

% load lfps
lfp_part1 = loadLFP([dataDir '2010-01-07_STN Right_Pass 1_C_Snapshot - 3600_.0 sec 1.mat']);
lfp_part2 = loadLFP([dataDir '2010-01-07_STN Right_Pass 1_C_Snapshot - 3600_.0 sec 2.mat']);
lfp_part3 = loadLFP([dataDir '2010-01-07_STN Right_Pass 1_C_Snapshot - 3600_.0 sec 3.mat']);
lfp_part4 = loadLFP([dataDir '2010-01-07_STN Right_Pass 1_C_Snapshot - 3600_.0 sec 4.mat']);
lfp_part5 = loadLFP([dataDir '2010-01-07_STN Right_Pass 1_C_Snapshot - 3600_.0 sec 5.mat']);
lfp_part6 = loadLFP([dataDir '2010-01-07_STN Right_Pass 1_C_Snapshot - 3600_.0 sec 6.mat']);
% concatenate lfps
lfp = vertcat(lfp_part1, ...
              lfp_part2, ...
              lfp_part3, ...
              lfp_part4, ...
              lfp_part5, ...
              lfp_part6);

% (3) save data
disp('Saving rawSignal2.mat ...');
save('Data\Raw\rawSignal2.mat', 'rawSignal', '-v7.3');
disp('Saving lfp2.mat ...');
save('Data\Raw\lfp2.mat', 'lfp', '-v7.3');
disp('Saving depth2.mat ...');
save('Data\Raw\depth2.mat', 'depth', '-v7.3');

clear;



%% [Patient 2] [Unused Trajectory 3] = [2010-01-28] [Left] [Pass 1] [Center]
%{
Uni-Bi:     Bilateral
STN Entry:	N/A
STN Exit:   N/A
SN Entry:	N/A
%}

%% [Patient 2] [Unused Trajectory 4] = [2010-01-28] [Left] [Pass 2] [Posterior]
%{
Uni-Bi:     Bilateral
STN Entry:	N/A
STN Exit:   N/A
SN Entry:	N/A
%}



%% [Patient 2] [Trajectory 3] = [2010-01-28] [Left] [Pass 3] [Lateral]
%{
Uni-Bi:     Bilateral
STN Entry:	 0.65
STN Exit:   -3.82
SN Entry:	-4.15
%}

% (0) check related data
dataDir = 'S:\Google Drive\Rutgers University\Research\DBS\Project\Data\DATA\NEW\';
allFiles = dir(dataDir);
allNames = {allFiles.name};

% (1) depth
% load depth data
depth_temp = loadDepth([dataDir '2010-01-28_STN Left_Pass 3_L_Snapshot - 3600_.0 sec.mat']);
% convert original depth data to milimeters above target
depth = convertDepth(depth_temp);

% (2) signals
% load rawSignals
rawSignal = loadRawSignal([dataDir '2010-01-28_STN Left_Pass 3_L_Snapshot - 3600_.0 sec.mat']);

% load lfps
lfp = loadLFP([dataDir '2010-01-28_STN Left_Pass 3_L_Snapshot - 3600_.0 sec.mat']);

% (3) save data
disp('Saving rawSignal3.mat ...');
save('Data\Raw\rawSignal3.mat', 'rawSignal', '-v7.3');
disp('Saving lfp3.mat ...');
save('Data\Raw\lfp3.mat', 'lfp', '-v7.3');
disp('Saving depth3.mat ...');
save('Data\Raw\depth3.mat', 'depth', '-v7.3');

clear;



%% [Patient 2] [Trajectory 4] = [2010-01-28] [Right] [Pass 1] [Center]
%{
Uni-Bi:     Bilateral
STN Entry:	 0.47
STN Exit:   -3.84
SN Entry:	-5.10
%}

% (0) check related data
dataDir = 'S:\Google Drive\Rutgers University\Research\DBS\Project\Data\DATA\NEW\';
allFiles = dir(dataDir);
allNames = {allFiles.name};

% (1) depth
% load depth data
depth_part0 = loadDepth([dataDir '2010-01-28_STN Right_Pass 1_C_Snapshot - 3600_.0 sec.mat']);
depth_part1 = loadDepth([dataDir '2010-01-28_STN Right_Pass 1_C_Snapshot - 3600_.0 sec 1.mat']);
% Note: Based on the depth data, althoughpart 0 and 1 are not quite
%       consecutive, we can still perform the same operation as to others.

% remove the difference in time before concatenating the depth data
diff01 = depth_part1(1, 1) - depth_part0(length(depth_part0), 1);
depth_part1(:, 1) = depth_part1(:, 1) - diff01 + 1;

% concatenate depth data
depth_temp = vertcat(depth_part0, depth_part1);

% convert original depth data to milimeters above target
depth = convertDepth(depth_temp);


% (2) signals
% load rawSignals
rawSignal_part0 = loadRawSignal([dataDir '2010-01-28_STN Right_Pass 1_C_Snapshot - 3600_.0 sec.mat']);
rawSignal_part1 = loadRawSignal([dataDir '2010-01-28_STN Right_Pass 1_C_Snapshot - 3600_.0 sec 1.mat']);
rawSignal = vertcat(rawSignal_part0, rawSignal_part1);

% load lfps
lfp_part0 = loadLFP([dataDir '2010-01-28_STN Right_Pass 1_C_Snapshot - 3600_.0 sec.mat']);
lfp_part1 = loadLFP([dataDir '2010-01-28_STN Right_Pass 1_C_Snapshot - 3600_.0 sec 1.mat']);
lfp = vertcat(lfp_part0, lfp_part1);

% (3) save data
disp('Saving rawSignal4.mat ...');
save('Data\Raw\rawSignal4.mat', 'rawSignal', '-v7.3');
disp('Saving lfp4.mat ...');
save('Data\Raw\lfp4.mat', 'lfp', '-v7.3');
disp('Saving depth4.mat ...');
save('Data\Raw\depth4.mat', 'depth', '-v7.3');

clear;



%% [Patient 3] [Trajectory 5] = [2010-02-18] [Right] [Pass 1] [Center]
%{
Uni-Bi:     Bilateral
STN Entry:	-2.19
STN Exit:   -6.30
SN Entry:	-6.70
%}

% (0) check related data
dataDir = 'S:\Google Drive\Rutgers University\Research\DBS\Project\Data\DATA\NEW\';
allFiles = dir(dataDir);
allNames = {allFiles.name};

% (1) depth
% load depth data
depth_part0 = loadDepth([dataDir '2010-02-18_STN Right_Pass 1_C_Snapshot - 3600_.0 sec.mat']);
depth_part1 = loadDepth([dataDir '2010-02-18_STN Right_Pass 1_C_Snapshot - 3600_.0 sec 1.mat']);
depth_part2 = loadDepth([dataDir '2010-02-18_STN Right_Pass 1_C_Snapshot - 3600_.0 sec 2.mat']);
% Note: Based on the depth data, only part 2 is usable. 0-1 and 1-2 are not
%       consecutive.

% convert original depth data to milimeters above target
depth = convertDepth(depth_part2);

% (2) signals
% load rawSignals
rawSignal = loadRawSignal([dataDir '2010-02-18_STN Right_Pass 1_C_Snapshot - 3600_.0 sec 2.mat']);

% load lfps
lfp = loadLFP([dataDir '2010-02-18_STN Right_Pass 1_C_Snapshot - 3600_.0 sec 2.mat']);

% (3) save data
disp('Saving rawSignal5.mat ...');
save('Data\Raw\rawSignal5.mat', 'rawSignal', '-v7.3');
disp('Saving lfp5.mat ...');
save('Data\Raw\lfp5.mat', 'lfp', '-v7.3');
disp('Saving depth5.mat ...');
save('Data\Raw\depth5.mat', 'depth', '-v7.3');

clear;



%% [Patient 4] [Unused Trajectory 5] = [2010-03-11] [Left] [Pass 1] [Center]
%{
Uni-Bi:     Unilateral
STN Entry:	N/A
STN Exit:   N/A
SN Entry:	N/A
%}



%% [Patient 4] [Trajectory 6] = [2010-03-11] [Left] [Pass 2] [Posterior]
%{
Uni-Bi:     Unilateral
STN Entry:	 5.51
STN Exit:    0.80
SN Entry:	-1.46
%}

% (0) check related data
dataDir = 'S:\Google Drive\Rutgers University\Research\DBS\Project\Data\DATA\NEW\';
allFiles = dir(dataDir);
allNames = {allFiles.name};

% (1) depth
% load depth data
depth_temp = loadDepth([dataDir '2010-03-11_STN Left_Pass 2_P_Snapshot - 3600_.0 sec.mat']);
% Note: Based on the depth data, only part 2 is usable. 0-1 and 1-2 are not
%       consecutive.

% convert original depth data to milimeters above target
depth = convertDepth(depth_temp);

% (2) signals
% load rawSignals
rawSignal = loadRawSignal([dataDir '2010-03-11_STN Left_Pass 2_P_Snapshot - 3600_.0 sec.mat']);

% load lfps
lfp = loadLFP([dataDir '2010-03-11_STN Left_Pass 2_P_Snapshot - 3600_.0 sec.mat']);

% (3) save data
disp('Saving rawSignal6.mat ...');
save('Data\Raw\rawSignal6.mat', 'rawSignal', '-v7.3');
disp('Saving lfp6.mat ...');
save('Data\Raw\lfp6.mat', 'lfp', '-v7.3');
disp('Saving depth6.mat ...');
save('Data\Raw\depth6.mat', 'depth', '-v7.3');

clear;



%% [Patient 5] [Unused Trajectory 6] = [2010-03-25] [Left] [Pass 1] [Anterior]
%{
Uni-Bi:     Bilateral
STN Entry:	N/A
STN Exit:   N/A
SN Entry:	N/A
%}



%% [Patient 5] [Trajectory 7] = [2010-03-25] [Left] [Pass 2] [Center]
%{
Uni-Bi:     Bilateral
STN Entry:	 4.20
STN Exit:   -0.40
SN Entry:	N/A
%}

% (0) check related data
dataDir = 'S:\Google Drive\Rutgers University\Research\DBS\Project\Data\DATA\NEW\';
allFiles = dir(dataDir);
allNames = {allFiles.name};

% (1) depth
% load depth data
depth_temp = loadDepth([dataDir '2010-03-25_STN Left_Pass 2_C_Snapshot - 3600_.0 sec.mat']);
% convert original depth data to milimeters above target
depth = convertDepth(depth_temp);

% (2) signals
% load rawSignals
rawSignal = loadRawSignal([dataDir '2010-03-25_STN Left_Pass 2_C_Snapshot - 3600_.0 sec.mat']);

% load lfps
lfp = loadLFP([dataDir '2010-03-25_STN Left_Pass 2_C_Snapshot - 3600_.0 sec.mat']);

% (3) save data
disp('Saving rawSignal7.mat ...');
save('Data\Raw\rawSignal7.mat', 'rawSignal', '-v7.3');
disp('Saving lfp7.mat ...');
save('Data\Raw\lfp7.mat', 'lfp', '-v7.3');
disp('Saving depth7.mat ...');
save('Data\Raw\depth7.mat', 'depth', '-v7.3');

clear;



%% [Patient 5] [Unused Trajectory 7] = [2010-03-25] [Right] [Pass 1] [Center]
%{
Uni-Bi:     Bilateral
STN Entry:	N/A
STN Exit:   N/A
SN Entry:	N/A
%}

%% [Patient 5] [Unused Trajectory 8] = [2010-03-25] [Right] [Pass 2] [Posterior]
%{
Uni-Bi:     Bilateral
STN Entry:	N/A
STN Exit:   N/A
SN Entry:	N/A
%}



%% [Patient 5] [Trajectory 8] = [2010-03-25] [Right] [Pass 2] [Anterior]
%{
Uni-Bi:     Bilateral
STN Entry:	 3.80
STN Exit:   -1.30
SN Entry:	-2.47
%}

% (0) check related data
dataDir = 'S:\Google Drive\Rutgers University\Research\DBS\Project\Data\DATA\NEW\';
allFiles = dir(dataDir);
allNames = {allFiles.name};

% (1) depth
% load depth data
depth_part1 = loadDepth([dataDir '2010-03-25_STN Right_Pass 3_A_Snapshot - 3600_.0 sec 1.mat']);
depth_part2 = loadDepth([dataDir '2010-03-25_STN Right_Pass 3_A_Snapshot - 3600_.0 sec 2.mat']);
% Note: Based on the depth data, only part 1 can be used. Part 2 stays at a
%       depth for some time. What's more, there's no part 0 as previous
%       ones.

% convert original depth data to milimeters above target
depth = convertDepth(depth_part1);


% (2) signals
% load rawSignals
rawSignal = loadRawSignal([dataDir '2010-03-25_STN Right_Pass 3_A_Snapshot - 3600_.0 sec 2.mat']);

% load lfps
lfp = loadLFP([dataDir '2010-03-25_STN Right_Pass 3_A_Snapshot - 3600_.0 sec 2.mat']);


% (3) save data
disp('Saving rawSignal8.mat ...');
save('Data\Raw\rawSignal8.mat', 'rawSignal', '-v7.3');
disp('Saving lfp8.mat ...');
save('Data\Raw\lfp8.mat', 'lfp', '-v7.3');
disp('Saving depth8.mat ...');
save('Data\Raw\depth8.mat', 'depth', '-v7.3');

clear;



%% [Patient 6] [Unused Trajectory 9] = [2010-04-01] [Right] [Pass 1] [Center]
%{
Uni-Bi:     Bilateral
STN Entry:	N/A
STN Exit:   N/A
SN Entry:	N/A
%}



%% [Patient 6] [Trajectory 9] = [2010-04-01] [Right] [Pass 2] [Anterior]
%{
Uni-Bi:     Bilateral
STN Entry:	 5.12
STN Exit:    0.30
SN Entry:	-0.34
%}

% (0) check related data
dataDir = 'S:\Google Drive\Rutgers University\Research\DBS\Project\Data\DATA\NEW\';
allFiles = dir(dataDir);
allNames = {allFiles.name};

% (1) depth
% load depth data
depth_temp = loadDepth([dataDir '2010-04-01_STN Right_Pass 2_A_Snapshot - 3600_.0 sec.mat']);
% Note: Based on the depth data, only part 1 can be used. Part 2 stays at a
%       depth for some time. What's more, there's no part 0 as previous
%       ones.

% convert original depth data to milimeters above target
depth = convertDepth(depth_temp);


% (2) signals
% load rawSignals
rawSignal = loadRawSignal([dataDir '2010-04-01_STN Right_Pass 2_A_Snapshot - 3600_.0 sec.mat']);

% load lfps
lfp = loadLFP([dataDir '2010-04-01_STN Right_Pass 2_A_Snapshot - 3600_.0 sec.mat']);


% (3) save data
disp('Saving rawSignal9.mat ...');
save('Data\Raw\rawSignal9.mat', 'rawSignal', '-v7.3');
disp('Saving lfp9.mat ...');
save('Data\Raw\lfp9.mat', 'lfp', '-v7.3');
disp('Saving depth9.mat ...');
save('Data\Raw\depth9.mat', 'depth', '-v7.3');

clear;



%% [Patient 7] [Trajectory 10] = [2010-05-18] [Left] [Pass 1] [Center]
%{
Uni-Bi:     Bilateral
STN Entry:	 0.90
STN Exit:   -2.50
SN Entry:	-3.43
%}

% (0) check related data
dataDir = 'S:\Google Drive\Rutgers University\Research\DBS\Project\Data\DATA\NEW\';
allFiles = dir(dataDir);
allNames = {allFiles.name};

% (1) depth
% load depth data
depth_part0 = loadDepth([dataDir '2010-05-18_STN Left_Pass 1_C_Snapshot - 3600_.0 sec.mat']);
depth_part1 = loadDepth([dataDir '2010-05-18_STN Left_Pass 1_C_Snapshot - 3600_.0 sec 1.mat']);
depth_part2 = loadDepth([dataDir '2010-05-18_STN Left_Pass 1_C_Snapshot - 3600_.0 sec 2.mat']);
depth_part3 = loadDepth([dataDir '2010-05-18_STN Left_Pass 1_C_Snapshot - 3600_.0 sec 3.mat']);
% Note: Based on the depth data, all 4 parts are consecutive and should be
%       concatenated.

% remove the difference in time before concatenating the depth data
diff01 = depth_part1(1, 1) - depth_part0(length(depth_part0), 1);
depth_part1(:, 1) = depth_part1(:, 1) - diff01 + 1;
diff12 = depth_part2(1, 1) - depth_part1(length(depth_part1), 1);
depth_part2(:, 1) = depth_part2(:, 1) - diff12 + 1;
diff23 = depth_part3(1, 1) - depth_part2(length(depth_part2), 1);
depth_part3(:, 1) = depth_part3(:, 1) - diff23 + 1;

% concatenate depth data
depth_temp = vertcat(depth_part0, ...
                     depth_part1, ...
                     depth_part2, ...
                     depth_part3);

% convert original depth data to milimeters above target
depth = convertDepth(depth_temp);


% (2) signals
% load rawSignals
rawSignal_part0 = loadRawSignal([dataDir '2010-05-18_STN Left_Pass 1_C_Snapshot - 3600_.0 sec.mat']);
rawSignal_part1 = loadRawSignal([dataDir '2010-05-18_STN Left_Pass 1_C_Snapshot - 3600_.0 sec 1.mat']);
rawSignal_part2 = loadRawSignal([dataDir '2010-05-18_STN Left_Pass 1_C_Snapshot - 3600_.0 sec 2.mat']);
rawSignal_part3 = loadRawSignal([dataDir '2010-05-18_STN Left_Pass 1_C_Snapshot - 3600_.0 sec 3.mat']);
% concatenate rawSignals
rawSignal = vertcat(rawSignal_part0, ...
                    rawSignal_part1, ...
                    rawSignal_part2, ...
                    rawSignal_part3);

% load lfps
lfp_part0 = loadLFP([dataDir '2010-05-18_STN Left_Pass 1_C_Snapshot - 3600_.0 sec.mat']);
lfp_part1 = loadLFP([dataDir '2010-05-18_STN Left_Pass 1_C_Snapshot - 3600_.0 sec 1.mat']);
lfp_part2 = loadLFP([dataDir '2010-05-18_STN Left_Pass 1_C_Snapshot - 3600_.0 sec 2.mat']);
lfp_part3 = loadLFP([dataDir '2010-05-18_STN Left_Pass 1_C_Snapshot - 3600_.0 sec 3.mat']);
% concatenate lfps
lfp = vertcat(lfp_part0, ...
              lfp_part1, ...
              lfp_part2, ...
              lfp_part3);

% (3) save data
disp('Saving rawSignal10.mat ...');
save('Data\Raw\rawSignal10.mat', 'rawSignal', '-v7.3');
disp('Saving lfp10.mat ...');
save('Data\Raw\lfp10.mat', 'lfp', '-v7.3');
disp('Saving depth10.mat ...');
save('Data\Raw\depth10.mat', 'depth', '-v7.3');

clear;



%% [Patient 7] [Trajectory 11] = [2010-05-18] [Left] [Pass 2] [Posterior]
%{
Uni-Bi:     Bilateral
STN Entry:	-0.30
STN Exit:   -2.50
SN Entry:	-3.25
%}

% (0) check related data
dataDir = 'S:\Google Drive\Rutgers University\Research\DBS\Project\Data\DATA\NEW\';
allFiles = dir(dataDir);
allNames = {allFiles.name};

% (1) depth
% load depth data
depth_part0 = loadDepth([dataDir '2010-05-18_STN Left_Pass 2_P_Snapshot - 3600_.0 sec.mat']);
depth_part1 = loadDepth([dataDir '2010-05-18_STN Left_Pass 2_P_Snapshot - 3600_.0 sec 1.mat']);
depth_part2 = loadDepth([dataDir '2010-05-18_STN Left_Pass 2_P_Snapshot - 3600_.0 sec 2.mat']);
depth_part3 = loadDepth([dataDir '2010-05-18_STN Left_Pass 2_P_Snapshot - 3600_.0 sec 3.mat']);
% Note: Based on the depth data, all 4 parts are consecutive and should be
%       concatenated.

% remove the difference in time before concatenating the depth data
diff01 = depth_part1(1, 1) - depth_part0(length(depth_part0), 1);
depth_part1(:, 1) = depth_part1(:, 1) - diff01 + 1;
diff12 = depth_part2(1, 1) - depth_part1(length(depth_part1), 1);
depth_part2(:, 1) = depth_part2(:, 1) - diff12 + 1;
diff23 = depth_part3(1, 1) - depth_part2(length(depth_part2), 1);
depth_part3(:, 1) = depth_part3(:, 1) - diff23 + 1;

% concatenate depth data
depth_temp = vertcat(depth_part0, ...
                     depth_part1, ...
                     depth_part2, ...
                     depth_part3);

% convert original depth data to milimeters above target
depth = convertDepth(depth_temp);


% (2) signals
% load rawSignals
rawSignal_part0 = loadRawSignal([dataDir '2010-05-18_STN Left_Pass 2_P_Snapshot - 3600_.0 sec.mat']);
rawSignal_part1 = loadRawSignal([dataDir '2010-05-18_STN Left_Pass 2_P_Snapshot - 3600_.0 sec 1.mat']);
rawSignal_part2 = loadRawSignal([dataDir '2010-05-18_STN Left_Pass 2_P_Snapshot - 3600_.0 sec 2.mat']);
rawSignal_part3 = loadRawSignal([dataDir '2010-05-18_STN Left_Pass 2_P_Snapshot - 3600_.0 sec 3.mat']);
% concatenate rawSignals
rawSignal = vertcat(rawSignal_part0, ...
                    rawSignal_part1, ...
                    rawSignal_part2, ...
                    rawSignal_part3);

% load lfps
lfp_part0 = loadLFP([dataDir '2010-05-18_STN Left_Pass 2_P_Snapshot - 3600_.0 sec.mat']);
lfp_part1 = loadLFP([dataDir '2010-05-18_STN Left_Pass 2_P_Snapshot - 3600_.0 sec 1.mat']);
lfp_part2 = loadLFP([dataDir '2010-05-18_STN Left_Pass 2_P_Snapshot - 3600_.0 sec 2.mat']);
lfp_part3 = loadLFP([dataDir '2010-05-18_STN Left_Pass 2_P_Snapshot - 3600_.0 sec 3.mat']);
% concatenate lfps
lfp = vertcat(lfp_part0, ...
              lfp_part1, ...
              lfp_part2, ...
              lfp_part3);

% (3) save data
disp('Saving rawSignal11.mat ...');
save('Data\Raw\rawSignal11.mat', 'rawSignal', '-v7.3');
disp('Saving lfp11.mat ...');
save('Data\Raw\lfp11.mat', 'lfp', '-v7.3');
disp('Saving depth11.mat ...');
save('Data\Raw\depth11.mat', 'depth', '-v7.3');

clear;



%% [Patient 7] [Trajectory 12] = [2010-05-18] [Right] [Pass 1] [Center]
%{
Uni-Bi:     Bilateral
STN Entry:	 4.20
STN Exit:    0.74
SN Entry:	 N/A
%}

% (0) check related data
dataDir = 'S:\Google Drive\Rutgers University\Research\DBS\Project\Data\DATA\NEW\';
allFiles = dir(dataDir);
allNames = {allFiles.name};

% (1) depth
% load depth data
depth_part0 = loadDepth([dataDir '2010-05-18_STN Right_Pass 1_C_Snapshot - 3600_.0 sec.mat']);
depth_part1 = loadDepth([dataDir '2010-05-18_STN Right_Pass 1_C_Snapshot - 3600_.0 sec 1.mat']);
depth_part2 = loadDepth([dataDir '2010-05-18_STN Right_Pass 1_C_Snapshot - 3600_.0 sec 2.mat']);
% Note: Based on the depth data, all 3 parts are consecutive and should be
%       concatenated.

% remove the difference in time before concatenating the depth data
diff01 = depth_part1(1, 1) - depth_part0(length(depth_part0), 1);
depth_part1(:, 1) = depth_part1(:, 1) - diff01 + 1;
diff12 = depth_part2(1, 1) - depth_part1(length(depth_part1), 1);
depth_part2(:, 1) = depth_part2(:, 1) - diff12 + 1;

% concatenate depth data
depth_temp = vertcat(depth_part0, ...
                     depth_part1, ...
                     depth_part2);

% convert original depth data to milimeters above target
depth = convertDepth(depth_temp);


% (2) signals
% load rawSignals
rawSignal_part0 = loadRawSignal([dataDir '2010-05-18_STN Right_Pass 1_C_Snapshot - 3600_.0 sec.mat']);
rawSignal_part1 = loadRawSignal([dataDir '2010-05-18_STN Right_Pass 1_C_Snapshot - 3600_.0 sec 1.mat']);
rawSignal_part2 = loadRawSignal([dataDir '2010-05-18_STN Right_Pass 1_C_Snapshot - 3600_.0 sec 2.mat']);
% concatenate rawSignals
rawSignal = vertcat(rawSignal_part0, ...
                    rawSignal_part1, ...
                    rawSignal_part2);

% load lfps
lfp_part0 = loadLFP([dataDir '2010-05-18_STN Right_Pass 1_C_Snapshot - 3600_.0 sec.mat']);
lfp_part1 = loadLFP([dataDir '2010-05-18_STN Right_Pass 1_C_Snapshot - 3600_.0 sec 1.mat']);
lfp_part2 = loadLFP([dataDir '2010-05-18_STN Right_Pass 1_C_Snapshot - 3600_.0 sec 2.mat']);
% concatenate lfps
lfp = vertcat(lfp_part0, ...
              lfp_part1, ...
              lfp_part2);

% (3) save data
disp('Saving rawSignal12.mat ...');
save('Data\Raw\rawSignal12.mat', 'rawSignal', '-v7.3');
disp('Saving lfp12.mat ...');
save('Data\Raw\lfp12.mat', 'lfp', '-v7.3');
disp('Saving depth12.mat ...');
save('Data\Raw\depth12.mat', 'depth', '-v7.3');

clear;



%% [Patient 7] [Unused Trajectory 10] = [2010-05-18] [Right] [Pass 2] [Posterior]
%{
Uni-Bi:     Bilateral
STN Entry:	N/A
STN Exit:   N/A
SN Entry:	N/A
%}



%% [Patient 7] [Trajectory 13] = [2010-05-18] [Right] [Pass 3] [Posterior Lateral +1]
%{
Uni-Bi:     Bilateral
STN Entry:	 2.40
STN Exit:   -1.60
SN Entry:	 N/A
%}

% (0) check related data
dataDir = 'S:\Google Drive\Rutgers University\Research\DBS\Project\Data\DATA\NEW\';
allFiles = dir(dataDir);
allNames = {allFiles.name};

% (1) depth
% load depth data
depth_part0 = loadDepth([dataDir '2010-05-18_STN Right_Pass 2_P_Snapshot - 3600_.0 sec.mat']);
depth_part1 = loadDepth([dataDir '2010-05-18_STN Right_Pass 2_P_Snapshot - 3600_.0 sec 1.mat']);
depth_part2 = loadDepth([dataDir '2010-05-18_STN Right_Pass 2_P_Snapshot - 3600_.0 sec 2.mat']);
depth_part3 = loadDepth([dataDir '2010-05-18_STN Right_Pass 2_P_Snapshot - 3600_.0 sec 3.mat']);
% Note: Based on the depth data, all 4 parts are consecutive and should be
%       concatenated.

% remove the difference in time before concatenating the depth data
diff01 = depth_part1(1, 1) - depth_part0(length(depth_part0), 1);
depth_part1(:, 1) = depth_part1(:, 1) - diff01 + 1;
diff12 = depth_part2(1, 1) - depth_part1(length(depth_part1), 1);
depth_part2(:, 1) = depth_part2(:, 1) - diff12 + 1;
diff23 = depth_part3(1, 1) - depth_part2(length(depth_part2), 1);
depth_part3(:, 1) = depth_part3(:, 1) - diff23 + 1;

% concatenate depth data
depth_temp = vertcat(depth_part0, ...
                     depth_part1, ...
                     depth_part2, ...
                     depth_part3);

% convert original depth data to milimeters above target
depth = convertDepth(depth_temp);


% (2) signals
% load rawSignals
rawSignal_part0 = loadRawSignal([dataDir '2010-05-18_STN Right_Pass 2_P_Snapshot - 3600_.0 sec.mat']);
rawSignal_part1 = loadRawSignal([dataDir '2010-05-18_STN Right_Pass 2_P_Snapshot - 3600_.0 sec 1.mat']);
rawSignal_part2 = loadRawSignal([dataDir '2010-05-18_STN Right_Pass 2_P_Snapshot - 3600_.0 sec 2.mat']);
rawSignal_part3 = loadRawSignal([dataDir '2010-05-18_STN Right_Pass 2_P_Snapshot - 3600_.0 sec 3.mat']);
% concatenate rawSignals
rawSignal = vertcat(rawSignal_part0, ...
                    rawSignal_part1, ...
                    rawSignal_part2, ...
                    rawSignal_part3);

% load lfps
lfp_part0 = loadLFP([dataDir '2010-05-18_STN Right_Pass 2_P_Snapshot - 3600_.0 sec.mat']);
lfp_part1 = loadLFP([dataDir '2010-05-18_STN Right_Pass 2_P_Snapshot - 3600_.0 sec 1.mat']);
lfp_part2 = loadLFP([dataDir '2010-05-18_STN Right_Pass 2_P_Snapshot - 3600_.0 sec 2.mat']);
lfp_part3 = loadLFP([dataDir '2010-05-18_STN Right_Pass 2_P_Snapshot - 3600_.0 sec 3.mat']);
% concatenate lfps
lfp = vertcat(lfp_part0, ...
              lfp_part1, ...
              lfp_part2, ...
              lfp_part3);

% (3) save data
disp('Saving rawSignal13.mat ...');
save('Data\Raw\rawSignal13.mat', 'rawSignal', '-v7.3');
disp('Saving lfp13.mat ...');
save('Data\Raw\lfp13.mat', 'lfp', '-v7.3');
disp('Saving depth13.mat ...');
save('Data\Raw\depth13.mat', 'depth', '-v7.3');

clear;



%% [Patient 8] [Trajectory 14] = [2010-06-22] [Right] [Pass 1] [Center]
%{
Uni-Bi:     Unilateral
STN Entry:	 4.20
STN Exit:   -1.20
SN Entry:	-2.30
%}

% (0) check related data
dataDir = 'S:\Google Drive\Rutgers University\Research\DBS\Project\Data\DATA\NEW\';
allFiles = dir(dataDir);
allNames = {allFiles.name};

% (1) depth
% load depth data
depth_part0 = loadDepth([dataDir '2010-06-22_STN Right_Pass 1_C_Snapshot - 3600_.0 sec.mat']);
depth_part1 = loadDepth([dataDir '2010-06-22_STN Right_Pass 1_C_Snapshot - 3600_.0 sec 1.mat']);
depth_part2 = loadDepth([dataDir '2010-06-22_STN Right_Pass 1_C_Snapshot - 3600_.0 sec 2.mat']);
depth_part3 = loadDepth([dataDir '2010-06-22_STN Right_Pass 1_C_Snapshot - 3600_.0 sec 3.mat']);
depth_part4 = loadDepth([dataDir '2010-06-22_STN Right_Pass 1_C_Snapshot - 3600_.0 sec 4.mat']);
depth_part5 = loadDepth([dataDir '2010-06-22_STN Right_Pass 1_C_Snapshot - 3600_.0 sec 5.mat']);
depth_part6 = loadDepth([dataDir '2010-06-22_STN Right_Pass 1_C_Snapshot - 3600_.0 sec 6.mat']);
% Note: Based on the depth data, part 1 to 5 are consecutive and should be
%       concatenated.

% remove the difference in time before concatenating the depth data
diff12 = depth_part2(1, 1) - depth_part1(length(depth_part1), 1);
depth_part2(:, 1) = depth_part2(:, 1) - diff12 + 1;
diff23 = depth_part3(1, 1) - depth_part2(length(depth_part2), 1);
depth_part3(:, 1) = depth_part3(:, 1) - diff23 + 1;
diff34 = depth_part4(1, 1) - depth_part3(length(depth_part3), 1);
depth_part4(:, 1) = depth_part4(:, 1) - diff34 + 1;
diff45 = depth_part5(1, 1) - depth_part4(length(depth_part4), 1);
depth_part5(:, 1) = depth_part5(:, 1) - diff45 + 1;

% concatenate depth data
depth_temp = vertcat(depth_part1, ...
                     depth_part2, ...
                     depth_part3, ...
                     depth_part4, ...
                     depth_part5);

% convert original depth data to milimeters above target
depth = convertDepth(depth_temp);


% (2) signals
% load rawSignals
rawSignal_part1 = loadRawSignal([dataDir '2010-06-22_STN Right_Pass 1_C_Snapshot - 3600_.0 sec 1.mat']);
rawSignal_part2 = loadRawSignal([dataDir '2010-06-22_STN Right_Pass 1_C_Snapshot - 3600_.0 sec 2.mat']);
rawSignal_part3 = loadRawSignal([dataDir '2010-06-22_STN Right_Pass 1_C_Snapshot - 3600_.0 sec 3.mat']);
rawSignal_part4 = loadRawSignal([dataDir '2010-06-22_STN Right_Pass 1_C_Snapshot - 3600_.0 sec 4.mat']);
rawSignal_part5 = loadRawSignal([dataDir '2010-06-22_STN Right_Pass 1_C_Snapshot - 3600_.0 sec 5.mat']);
% concatenate rawSignals
rawSignal = vertcat(rawSignal_part1, ...
                    rawSignal_part2, ...
                    rawSignal_part3, ...
                    rawSignal_part4, ...
                    rawSignal_part5);

% load lfps
lfp_part1 = loadLFP([dataDir '2010-06-22_STN Right_Pass 1_C_Snapshot - 3600_.0 sec 1.mat']);
lfp_part2 = loadLFP([dataDir '2010-06-22_STN Right_Pass 1_C_Snapshot - 3600_.0 sec 2.mat']);
lfp_part3 = loadLFP([dataDir '2010-06-22_STN Right_Pass 1_C_Snapshot - 3600_.0 sec 3.mat']);
lfp_part4 = loadLFP([dataDir '2010-06-22_STN Right_Pass 1_C_Snapshot - 3600_.0 sec 4.mat']);
lfp_part5 = loadLFP([dataDir '2010-06-22_STN Right_Pass 1_C_Snapshot - 3600_.0 sec 5.mat']);
% concatenate lfps
lfp = vertcat(lfp_part1, ...
              lfp_part2, ...
              lfp_part3, ...
              lfp_part4, ...
              lfp_part5);

% (3) save data
disp('Saving rawSignal14.mat ...');
save('Data\Raw\rawSignal14.mat', 'rawSignal', '-v7.3');
disp('Saving lfp14.mat ...');
save('Data\Raw\lfp14.mat', 'lfp', '-v7.3');
disp('Saving depth14.mat ...');
save('Data\Raw\depth14.mat', 'depth', '-v7.3');

clear;



%% [Patient 9] [Trajectory 15] = [2010-07-13] [Left] [Pass 1] [Center]
%{
Uni-Bi:     Bilateral
STN Entry:	 2.60
STN Exit:    0.70
SN Entry:	 N/A
%}

% (0) check related data
dataDir = 'S:\Google Drive\Rutgers University\Research\DBS\Project\Data\DATA\NEW\';
allFiles = dir(dataDir);
allNames = {allFiles.name};

% (1) depth
% load depth data
depth_part0 = loadDepth([dataDir '2010-07-13_STN Left_Pass 1_C_Snapshot - 3600_.0 sec.mat']);
depth_part1 = loadDepth([dataDir '2010-07-13_STN Left_Pass 1_C_Snapshot - 3600_.0 sec 1.mat']);
depth_part2 = loadDepth([dataDir '2010-07-13_STN Left_Pass 1_C_Snapshot - 3600_.0 sec 2.mat']);
depth_part3 = loadDepth([dataDir '2010-07-13_STN Left_Pass 1_C_Snapshot - 3600_.0 sec 3.mat']);
% Note: Based on the depth data, part 0 to 2 are consecutive and should be
%       concatenated. Part 3 goes backwards.

% remove the difference in time before concatenating the depth data
diff01 = depth_part1(1, 1) - depth_part0(length(depth_part0), 1);
depth_part1(:, 1) = depth_part1(:, 1) - diff01 + 1;
diff12 = depth_part2(1, 1) - depth_part1(length(depth_part1), 1);
depth_part2(:, 1) = depth_part2(:, 1) - diff12 + 1;

% concatenate depth data
depth_temp = vertcat(depth_part0, ...
                     depth_part1, ...
                     depth_part2);

% convert original depth data to milimeters above target
depth = convertDepth(depth_temp);


% (2) signals
% load rawSignals
rawSignal_part0 = loadRawSignal([dataDir '2010-07-13_STN Left_Pass 1_C_Snapshot - 3600_.0 sec.mat']);
rawSignal_part1 = loadRawSignal([dataDir '2010-07-13_STN Left_Pass 1_C_Snapshot - 3600_.0 sec 1.mat']);
rawSignal_part2 = loadRawSignal([dataDir '2010-07-13_STN Left_Pass 1_C_Snapshot - 3600_.0 sec 2.mat']);
% concatenate rawSignals
rawSignal = vertcat(rawSignal_part0, ...
                    rawSignal_part1, ...
                    rawSignal_part2);

% load lfps
lfp_part0 = loadLFP([dataDir '2010-07-13_STN Left_Pass 1_C_Snapshot - 3600_.0 sec.mat']);
lfp_part1 = loadLFP([dataDir '2010-07-13_STN Left_Pass 1_C_Snapshot - 3600_.0 sec 1.mat']);
lfp_part2 = loadLFP([dataDir '2010-07-13_STN Left_Pass 1_C_Snapshot - 3600_.0 sec 2.mat']);
% concatenate lfps
lfp = vertcat(lfp_part0, ...
              lfp_part1, ...
              lfp_part2);

% (3) save data
disp('Saving rawSignal15.mat ...');
save('Data\Raw\rawSignal15.mat', 'rawSignal', '-v7.3');
disp('Saving lfp15.mat ...');
save('Data\Raw\lfp15.mat', 'lfp', '-v7.3');
disp('Saving depth15.mat ...');
save('Data\Raw\depth15.mat', 'depth', '-v7.3');

clear;



%% [Patient 9] [Unused Trajectory 12] = [2010-07-13] [Left] [Pass 2] [Posterior]
%{
Uni-Bi:     Bilateral
STN Entry:	 N/A
STN Exit:    N/A
SN Entry:	 N/A
%}



%% [Patient 9] [Trajectory 16] = [2010-07-13] [Left] [Pass 3] [Anterior]
%{
Uni-Bi:     Bilateral
STN Entry:	 5.60
STN Exit:    1.30
SN Entry:	 0.07
%}

% (0) check related data
dataDir = 'S:\Google Drive\Rutgers University\Research\DBS\Project\Data\DATA\NEW\';
allFiles = dir(dataDir);
allNames = {allFiles.name};

% (1) depth
% load depth data
depth_part0 = loadDepth([dataDir '2010-07-13_STN Left_Pass 3_A_Snapshot - 3600_.0 sec.mat']);
depth_part1 = loadDepth([dataDir '2010-07-13_STN Left_Pass 3_A_Snapshot - 3600_.0 sec 1.mat']);
% Note: Based on the depth data, part 0 and 1 are consecutive and should be
%       concatenated.

% remove the difference in time before concatenating the depth data
diff01 = depth_part1(1, 1) - depth_part0(length(depth_part0), 1);
depth_part1(:, 1) = depth_part1(:, 1) - diff01 + 1;

% concatenate depth data
depth_temp = vertcat(depth_part0, depth_part1);

% convert original depth data to milimeters above target
depth = convertDepth(depth_temp);


% (2) signals
% load rawSignals
rawSignal_part0 = loadRawSignal([dataDir '2010-07-13_STN Left_Pass 3_A_Snapshot - 3600_.0 sec.mat']);
rawSignal_part1 = loadRawSignal([dataDir '2010-07-13_STN Left_Pass 3_A_Snapshot - 3600_.0 sec 1.mat']);
% concatenate rawSignals
rawSignal = vertcat(rawSignal_part0, rawSignal_part1);

% load lfps
lfp_part0 = loadLFP([dataDir '2010-07-13_STN Left_Pass 3_A_Snapshot - 3600_.0 sec.mat']);
lfp_part1 = loadLFP([dataDir '2010-07-13_STN Left_Pass 3_A_Snapshot - 3600_.0 sec 1.mat']);
% concatenate lfps
lfp = vertcat(lfp_part0, lfp_part1);

% (3) save data
disp('Saving rawSignal16.mat ...');
save('Data\Raw\rawSignal16.mat', 'rawSignal', '-v7.3');
disp('Saving lfp16.mat ...');
save('Data\Raw\lfp16.mat', 'lfp', '-v7.3');
disp('Saving depth16.mat ...');
save('Data\Raw\depth16.mat', 'depth', '-v7.3');

clear;



%% [Patient 9] [Unused Trajectory 13] = [2010-07-13] [Right] [Pass 1] [Anterior]
%{
Uni-Bi:     Bilateral
STN Entry:	 N/A
STN Exit:    N/A
SN Entry:	 N/A
%}



%% [Patient 9] [Trajectory 17] = [2010-07-13] [Right] [Pass 2] [Center]
%{
Uni-Bi:     Bilateral
STN Entry:	 6.56
STN Exit:    2.00
SN Entry:	-0.25
%}

% (0) check related data
dataDir = 'S:\Google Drive\Rutgers University\Research\DBS\Project\Data\DATA\NEW\';
allFiles = dir(dataDir);
allNames = {allFiles.name};

% (1) depth
% load depth data
depth_part0 = loadDepth([dataDir '2010-07-13_STN Right_Pass 2_C_Snapshot - 3600_.0 sec.mat']);
depth_part1 = loadDepth([dataDir '2010-07-13_STN Right_Pass 2_C_Snapshot - 3600_.0 sec 1.mat']);
% Note: Based on the depth data, part 0 and 1 are consecutive and should be
%       concatenated.

% remove the difference in time before concatenating the depth data
diff01 = depth_part1(1, 1) - depth_part0(length(depth_part0), 1);
depth_part1(:, 1) = depth_part1(:, 1) - diff01 + 1;

% concatenate depth data
depth_temp = vertcat(depth_part0, depth_part1);

% convert original depth data to milimeters above target
depth = convertDepth(depth_temp);


% (2) signals
% load rawSignals
rawSignal_part0 = loadRawSignal([dataDir '2010-07-13_STN Right_Pass 2_C_Snapshot - 3600_.0 sec.mat']);
rawSignal_part1 = loadRawSignal([dataDir '2010-07-13_STN Right_Pass 2_C_Snapshot - 3600_.0 sec 1.mat']);
% concatenate rawSignals
rawSignal = vertcat(rawSignal_part0, rawSignal_part1);

% load lfps
lfp_part0 = loadLFP([dataDir '2010-07-13_STN Right_Pass 2_C_Snapshot - 3600_.0 sec.mat']);
lfp_part1 = loadLFP([dataDir '2010-07-13_STN Right_Pass 2_C_Snapshot - 3600_.0 sec 1.mat']);
% concatenate lfps
lfp = vertcat(lfp_part0, lfp_part1);

% (3) save data
disp('Saving rawSignal17.mat ...');
save('Data\Raw\rawSignal17.mat', 'rawSignal', '-v7.3');
disp('Saving lfp17.mat ...');
save('Data\Raw\lfp17.mat', 'lfp', '-v7.3');
disp('Saving depth17.mat ...');
save('Data\Raw\depth17.mat', 'depth', '-v7.3');

clear;



%% [Patient 10] [Trajectory 18] = [2010-08-31] [Left] [Pass 1] [Center]
%{
Uni-Bi:     Bilateral
STN Entry:	 3.70
STN Exit:    0.00
SN Entry:	-0.50
%}

% (0) check related data
dataDir = 'S:\Google Drive\Rutgers University\Research\DBS\Project\Data\DATA\NEW\';
allFiles = dir(dataDir);
allNames = {allFiles.name};

% (1) depth
% load depth data
depth_temp = loadDepth([dataDir '2010-08-31_STN Left_Pass 1_C_Snapshot - 3600_.0 sec.mat']);
% convert original depth data to milimeters above target
depth = convertDepth(depth_temp);

% (2) signals
% load rawSignals
rawSignal = loadRawSignal([dataDir '2010-08-31_STN Left_Pass 1_C_Snapshot - 3600_.0 sec.mat']);

% load lfps
lfp = loadLFP([dataDir '2010-08-31_STN Left_Pass 1_C_Snapshot - 3600_.0 sec.mat']);

% (3) save data
disp('Saving rawSignal18.mat ...');
save('Data\Raw\rawSignal18.mat', 'rawSignal', '-v7.3');
disp('Saving lfp18.mat ...');
save('Data\Raw\lfp18.mat', 'lfp', '-v7.3');
disp('Saving depth18.mat ...');
save('Data\Raw\depth18.mat', 'depth', '-v7.3');

clear;



%% [Patient 10] [Trajectory 19] = [2010-08-31] [Right] [Pass 1] [Center]
%{
Uni-Bi:     Bilateral
STN Entry:	 4.80
STN Exit:   -0.20
SN Entry:	-0.40
%}

% (0) check related data
dataDir = 'S:\Google Drive\Rutgers University\Research\DBS\Project\Data\DATA\NEW\';
allFiles = dir(dataDir);
allNames = {allFiles.name};

% (1) depth
% load depth data
depth_temp = loadDepth([dataDir '2010-08-31_STN Right_Pass 1_C_Snapshot - 3600_.0 sec.mat']);
% convert original depth data to milimeters above target
depth = convertDepth(depth_temp);

% (2) signals
% load rawSignals
rawSignal = loadRawSignal([dataDir '2010-08-31_STN Right_Pass 1_C_Snapshot - 3600_.0 sec.mat']);

% load lfps
lfp = loadLFP([dataDir '2010-08-31_STN Right_Pass 1_C_Snapshot - 3600_.0 sec.mat']);

% (3) save data
disp('Saving rawSignal19.mat ...');
save('Data\Raw\rawSignal19.mat', 'rawSignal', '-v7.3');
disp('Saving lfp19.mat ...');
save('Data\Raw\lfp19.mat', 'lfp', '-v7.3');
disp('Saving depth19.mat ...');
save('Data\Raw\depth19.mat', 'depth', '-v7.3');

clear;



%% [Patient 11] [Trajectory 20] = [2010-10-05] [Left] [Pass 1] [Center]
%{
Uni-Bi:     Bilateral
STN Entry:	 4.40
STN Exit:   -1.40
SN Entry:	-1.73
%}

% (0) check related data
dataDir = 'S:\Google Drive\Rutgers University\Research\DBS\Project\Data\DATA\NEW\';
allFiles = dir(dataDir);
allNames = {allFiles.name};

% (1) depth
% load depth data
depth_part0 = loadDepth([dataDir '2010-10-05_STN Left_Pass 1_C_Snapshot - 3600_.0 sec.mat']);
depth_part1 = loadDepth([dataDir '2010-10-05_STN Left_Pass 1_C_Snapshot - 3600_.0 sec 1.mat']);
depth_part2 = loadDepth([dataDir '2010-10-05_STN Left_Pass 1_C_Snapshot - 3600_.0 sec 2.mat']);
depth_part3 = loadDepth([dataDir '2010-10-05_STN Left_Pass 1_C_Snapshot - 3600_.0 sec 3.mat']);
% Note: Based on the depth data, part 0 to 2 are consecutive and should be
%       concatenated. Part 3 goes backwards.

% remove the difference in time before concatenating the depth data
diff01 = depth_part1(1, 1) - depth_part0(length(depth_part0), 1);
depth_part1(:, 1) = depth_part1(:, 1) - diff01 + 1;
diff12 = depth_part2(1, 1) - depth_part1(length(depth_part1), 1);
depth_part2(:, 1) = depth_part2(:, 1) - diff12 + 1;

% concatenate depth data
depth_temp = vertcat(depth_part0, ...
                     depth_part1, ...
                     depth_part2);

% convert original depth data to milimeters above target
depth = convertDepth(depth_temp);


% (2) signals
% load rawSignals
rawSignal_part0 = loadRawSignal([dataDir '2010-10-05_STN Left_Pass 1_C_Snapshot - 3600_.0 sec.mat']);
rawSignal_part1 = loadRawSignal([dataDir '2010-10-05_STN Left_Pass 1_C_Snapshot - 3600_.0 sec 1.mat']);
rawSignal_part2 = loadRawSignal([dataDir '2010-10-05_STN Left_Pass 1_C_Snapshot - 3600_.0 sec 2.mat']);
% concatenate rawSignals
rawSignal = vertcat(rawSignal_part0, ...
                    rawSignal_part1, ...
                    rawSignal_part2);

% load lfps
lfp_part0 = loadLFP([dataDir '2010-10-05_STN Left_Pass 1_C_Snapshot - 3600_.0 sec.mat']);
lfp_part1 = loadLFP([dataDir '2010-10-05_STN Left_Pass 1_C_Snapshot - 3600_.0 sec 1.mat']);
lfp_part2 = loadLFP([dataDir '2010-10-05_STN Left_Pass 1_C_Snapshot - 3600_.0 sec 2.mat']);
% concatenate lfps
lfp = vertcat(lfp_part0, ...
              lfp_part1, ...
              lfp_part2);

% (3) save data
disp('Saving rawSignal20.mat ...');
save('Data\Raw\rawSignal20.mat', 'rawSignal', '-v7.3');
disp('Saving lfp20.mat ...');
save('Data\Raw\lfp20.mat', 'lfp', '-v7.3');
disp('Saving depth20.mat ...');
save('Data\Raw\depth20.mat', 'depth', '-v7.3');

clear;



%% [Patient 11] [Trajectory 21] = [2010-10-05] [Right] [Pass 1] [Center]
%{
Uni-Bi:     Bilateral
STN Entry:	 3.72
STN Exit:   -1.72
SN Entry:	-2.10
%}

% (0) check related data
dataDir = 'S:\Google Drive\Rutgers University\Research\DBS\Project\Data\DATA\NEW\';
allFiles = dir(dataDir);
allNames = {allFiles.name};

% (1) depth
% load depth data
depth_part0 = loadDepth([dataDir '2010-10-05_STN Right_Pass 1_C_Snapshot - 3600_.0 sec.mat']);
depth_part1 = loadDepth([dataDir '2010-10-05_STN Right_Pass 1_C_Snapshot - 3600_.0 sec 1.mat']);
% Note: Based on the depth data, only part 0 is usable. Part 1 goes
%       backwards.
% convert original depth data to milimeters above target
depth = convertDepth(depth_part0);

% (2) signals
% load rawSignals
rawSignal = loadRawSignal([dataDir '2010-10-05_STN Right_Pass 1_C_Snapshot - 3600_.0 sec 1.mat']);

% load lfps
lfp = loadLFP([dataDir '2010-10-05_STN Right_Pass 1_C_Snapshot - 3600_.0 sec 1.mat']);

% (3) save data
disp('Saving rawSignal21.mat ...');
save('Data\Raw\rawSignal21.mat', 'rawSignal', '-v7.3');
disp('Saving lfp21.mat ...');
save('Data\Raw\lfp21.mat', 'lfp', '-v7.3');
disp('Saving depth21.mat ...');
save('Data\Raw\depth21.mat', 'depth', '-v7.3');

clear;



%% [Patient 12] [Trajectory 22] = [2010-10-18] [Left] [Pass 1] [Center]
%{
Uni-Bi:     Bilateral
STN Entry:	 4.50
STN Exit:   -0.25
SN Entry:	-0.76
%}

% (0) check related data
dataDir = 'S:\Google Drive\Rutgers University\Research\DBS\Project\Data\DATA\NEW\';
allFiles = dir(dataDir);
allNames = {allFiles.name};

% (1) depth
% load depth data
depth_temp = loadDepth([dataDir '2010-10-18_STN Left_Pass 1_C_Snapshot - 3600_.0 sec.mat']);
% convert original depth data to milimeters above target
depth = convertDepth(depth_temp);

% (2) signals
% load rawSignals
rawSignal = loadRawSignal([dataDir '2010-10-18_STN Left_Pass 1_C_Snapshot - 3600_.0 sec.mat']);

% load lfps
lfp = loadLFP([dataDir '2010-10-18_STN Left_Pass 1_C_Snapshot - 3600_.0 sec.mat']);

% (3) save data
disp('Saving rawSignal22.mat ...');
save('Data\Raw\rawSignal22.mat', 'rawSignal', '-v7.3');
disp('Saving lfp22.mat ...');
save('Data\Raw\lfp22.mat', 'lfp', '-v7.3');
disp('Saving depth22.mat ...');
save('Data\Raw\depth22.mat', 'depth', '-v7.3');

clear;




%% [Patient 12] [Trajectory 23] = [2010-10-18] [Right] [Pass 1] [Center]
%{
Uni-Bi:     Bilateral
STN Entry:	 5.44
STN Exit:    1.45
SN Entry:	 0.40
%}

% (0) check related data
dataDir = 'S:\Google Drive\Rutgers University\Research\DBS\Project\Data\DATA\NEW\';
allFiles = dir(dataDir);
allNames = {allFiles.name};

% (1) depth
% load depth data
depth_temp = loadDepth([dataDir '2010-10-18_STN Right_Pass 1_C_Snapshot - 3600_.0 sec.mat']);
% convert original depth data to milimeters above target
depth = convertDepth(depth_temp);

% (2) signals
% load rawSignals
rawSignal = loadRawSignal([dataDir '2010-10-18_STN Right_Pass 1_C_Snapshot - 3600_.0 sec.mat']);

% load lfps
lfp = loadLFP([dataDir '2010-10-18_STN Right_Pass 1_C_Snapshot - 3600_.0 sec.mat']);

% (3) save data
disp('Saving rawSignal23.mat ...');
save('Data\Raw\rawSignal23.mat', 'rawSignal', '-v7.3');
disp('Saving lfp23.mat ...');
save('Data\Raw\lfp23.mat', 'lfp', '-v7.3');
disp('Saving depth23.mat ...');
save('Data\Raw\depth23.mat', 'depth', '-v7.3');

clear;




%% [Patient 13] [Trajectory 24] = [2010-11-02] [Left] [Pass 1] [Center]
%{
Uni-Bi:     Bilateral
STN Entry:	 3.84
STN Exit:   -0.20
SN Entry:    N/A
%}

% (0) check related data
dataDir = 'S:\Google Drive\Rutgers University\Research\DBS\Project\Data\DATA\NEW\';
allFiles = dir(dataDir);
allNames = {allFiles.name};

% (1) depth
% load depth data
depth_temp = loadDepth([dataDir '2010-11-02_STN Left_Pass 1_C_Snapshot - 3600_.0 sec.mat']);
% convert original depth data to milimeters above target
depth = convertDepth(depth_temp);

% (2) signals
% load rawSignals
rawSignal = loadRawSignal([dataDir '2010-11-02_STN Left_Pass 1_C_Snapshot - 3600_.0 sec.mat']);

% load lfps
lfp = loadLFP([dataDir '2010-11-02_STN Left_Pass 1_C_Snapshot - 3600_.0 sec.mat']);

% (3) save data
disp('Saving rawSignal24.mat ...');
save('Data\Raw\rawSignal24.mat', 'rawSignal', '-v7.3');
disp('Saving lfp24.mat ...');
save('Data\Raw\lfp24.mat', 'lfp', '-v7.3');
disp('Saving depth24.mat ...');
save('Data\Raw\depth24.mat', 'depth', '-v7.3');

clear;



%% [Patient 13] [Trajectory 25] = [2010-11-02] [Left] [Pass 2] [Posterior]
%{
Uni-Bi:     Bilateral
STN Entry:	 4.30
STN Exit:   -0.32
SN Entry:    N/A
%}

% (0) check related data
dataDir = 'S:\Google Drive\Rutgers University\Research\DBS\Project\Data\DATA\NEW\';
allFiles = dir(dataDir);
allNames = {allFiles.name};

% (1) depth
% load depth data
depth_temp = loadDepth([dataDir '2010-11-02_STN Left_Pass 2_P_Snapshot - 3600_.0 sec.mat']);
% convert original depth data to milimeters above target
depth = convertDepth(depth_temp);

% (2) signals
% load rawSignals
rawSignal = loadRawSignal([dataDir '2010-11-02_STN Left_Pass 2_P_Snapshot - 3600_.0 sec.mat']);

% load lfps
lfp = loadLFP([dataDir '2010-11-02_STN Left_Pass 2_P_Snapshot - 3600_.0 sec.mat']);

% (3) save data
disp('Saving rawSignal25.mat ...');
save('Data\Raw\rawSignal25.mat', 'rawSignal', '-v7.3');
disp('Saving lfp25.mat ...');
save('Data\Raw\lfp25.mat', 'lfp', '-v7.3');
disp('Saving depth25.mat ...');
save('Data\Raw\depth25.mat', 'depth', '-v7.3');

clear;




%% [Patient 13] [Trajectory 26] = [2010-11-02] [Left] [Pass 3] [Anterior]
%{
Uni-Bi:     Bilateral
STN Entry:	 1.10
STN Exit:   -3.00
SN Entry:   -3.40
%}

% (0) check related data
dataDir = 'S:\Google Drive\Rutgers University\Research\DBS\Project\Data\DATA\NEW\';
allFiles = dir(dataDir);
allNames = {allFiles.name};

% (1) depth
% load depth data
depth_temp = loadDepth([dataDir '2010-11-02_STN Left_Pass 3_A_Snapshot - 3600_.0 sec.mat']);
% convert original depth data to milimeters above target
depth = convertDepth(depth_temp);

% (2) signals
% load rawSignals
rawSignal = loadRawSignal([dataDir '2010-11-02_STN Left_Pass 3_A_Snapshot - 3600_.0 sec.mat']);

% load lfps
lfp = loadLFP([dataDir '2010-11-02_STN Left_Pass 3_A_Snapshot - 3600_.0 sec.mat']);

% (3) save data
disp('Saving rawSignal26.mat ...');
save('Data\Raw\rawSignal26.mat', 'rawSignal', '-v7.3');
disp('Saving lfp26.mat ...');
save('Data\Raw\lfp26.mat', 'lfp', '-v7.3');
disp('Saving depth26.mat ...');
save('Data\Raw\depth26.mat', 'depth', '-v7.3');

clear;



%% [Patient 13] [Trajectory 27] = [2010-11-02] [Left] [Pass 4] [Lateral]
%{
Uni-Bi:     Bilateral
STN Entry:	 1.96
STN Exit:   -3.50
SN Entry:   -3.95
%}

% (0) check related data
dataDir = 'S:\Google Drive\Rutgers University\Research\DBS\Project\Data\DATA\NEW\';
allFiles = dir(dataDir);
allNames = {allFiles.name};

% (1) depth
% load depth data
depth_temp = loadDepth([dataDir '2010-11-02_STN Left_Pass 4_L_Snapshot - 3600_.0 sec.mat']);
% convert original depth data to milimeters above target
depth = convertDepth(depth_temp);

% (2) signals
% load rawSignals
rawSignal = loadRawSignal([dataDir '2010-11-02_STN Left_Pass 4_L_Snapshot - 3600_.0 sec.mat']);

% load lfps
lfp = loadLFP([dataDir '2010-11-02_STN Left_Pass 4_L_Snapshot - 3600_.0 sec.mat']);

% (3) save data
disp('Saving rawSignal27.mat ...');
save('Data\Raw\rawSignal27.mat', 'rawSignal', '-v7.3');
disp('Saving lfp27.mat ...');
save('Data\Raw\lfp27.mat', 'lfp', '-v7.3');
disp('Saving depth27.mat ...');
save('Data\Raw\depth27.mat', 'depth', '-v7.3');

clear;



%% [Patient 13] [Trajectory 28] = [2010-11-02] [Right] [Pass 1] [Center]
%{
Uni-Bi:     Bilateral
STN Entry:	 2.55
STN Exit:   -1.59
SN Entry:   -3.37
%}

% (0) check related data
dataDir = 'S:\Google Drive\Rutgers University\Research\DBS\Project\Data\DATA\NEW\';
allFiles = dir(dataDir);
allNames = {allFiles.name};

% (1) depth
% load depth data
depth_temp = loadDepth([dataDir '2010-11-02_STN Right_Pass 1_C_Snapshot - 3600_.0 sec.mat']);
% convert original depth data to milimeters above target
depth = convertDepth(depth_temp);

% (2) signals
% load rawSignals
rawSignal = loadRawSignal([dataDir '2010-11-02_STN Right_Pass 1_C_Snapshot - 3600_.0 sec.mat']);

% load lfps
lfp = loadLFP([dataDir '2010-11-02_STN Right_Pass 1_C_Snapshot - 3600_.0 sec.mat']);

% (3) save data
disp('Saving rawSignal28.mat ...');
save('Data\Raw\rawSignal28.mat', 'rawSignal', '-v7.3');
disp('Saving lfp28.mat ...');
save('Data\Raw\lfp28.mat', 'lfp', '-v7.3');
disp('Saving depth28.mat ...');
save('Data\Raw\depth28.mat', 'depth', '-v7.3');

clear;




%% [Patient 13] [Trajectory 29] = [2010-11-02] [Right] [Pass 2] [Posterior?]
%{
Uni-Bi:     Bilateral
STN Entry:	 2.55
STN Exit:   -1.04
SN Entry:    N/A
%}

% (0) check related data
dataDir = 'S:\Google Drive\Rutgers University\Research\DBS\Project\Data\DATA\NEW\';
allFiles = dir(dataDir);
allNames = {allFiles.name};

% (1) depth
% load depth data
depth_part0 = loadDepth([dataDir '2010-11-02_STN Right_Pass 2_A_Snapshot - 3600_.0 sec.mat']);
depth_part1 = loadDepth([dataDir '2010-11-02_STN Right_Pass 2_A_Snapshot - 3600_.0 sec 1.mat']);
% Note: Based on the depth data, part 0 and 1 are consecutive and should be
%       concatenated.

% remove the difference in time before concatenating the depth data
diff01 = depth_part1(1, 1) - depth_part0(length(depth_part0), 1);
depth_part1(:, 1) = depth_part1(:, 1) - diff01 + 1;

% concatenate depth data
depth_temp = vertcat(depth_part0, depth_part1);

% convert original depth data to milimeters above target
depth = convertDepth(depth_temp);


% (2) signals
% load rawSignals
rawSignal_part0 = loadRawSignal([dataDir '2010-11-02_STN Right_Pass 2_A_Snapshot - 3600_.0 sec.mat']);
rawSignal_part1 = loadRawSignal([dataDir '2010-11-02_STN Right_Pass 2_A_Snapshot - 3600_.0 sec 1.mat']);
% concatenate rawSignals
rawSignal = vertcat(rawSignal_part0, rawSignal_part1);

% load lfps
lfp_part0 = loadLFP([dataDir '2010-11-02_STN Right_Pass 2_A_Snapshot - 3600_.0 sec.mat']);
lfp_part1 = loadLFP([dataDir '2010-11-02_STN Right_Pass 2_A_Snapshot - 3600_.0 sec 1.mat']);
% concatenate lfps
lfp = vertcat(lfp_part0, lfp_part1);

% (3) save data
disp('Saving rawSignal29.mat ...');
save('Data\Raw\rawSignal29.mat', 'rawSignal', '-v7.3');
disp('Saving lfp29.mat ...');
save('Data\Raw\lfp29.mat', 'lfp', '-v7.3');
disp('Saving depth29.mat ...');
save('Data\Raw\depth29.mat', 'depth', '-v7.3');

clear;



%% [Patient 14] [Trajectory 30] = [2010-11-30] [Left] [Pass 1] [Center]
%{
Uni-Bi:     Bilateral
STN Entry:	 2.15
STN Exit:   -2.50
SN Entry:   -2.98
%}

% (0) check related data
dataDir = 'S:\Google Drive\Rutgers University\Research\DBS\Project\Data\DATA\NEW\';
allFiles = dir(dataDir);
allNames = {allFiles.name};

% (1) depth
% load depth data
depth_part0 = loadDepth([dataDir '2010-11-30_STN Left_Pass 1_C_Snapshot - 3600_.0 sec.mat']);
depth_part1 = loadDepth([dataDir '2010-11-30_STN Left_Pass 1_C_Snapshot - 3600_.0 sec 1.mat']);
% Note: Based on the depth data, part 0 and 1 are consecutive and should be
%       concatenated.

% remove the difference in time before concatenating the depth data
diff01 = depth_part1(1, 1) - depth_part0(length(depth_part0), 1);
depth_part1(:, 1) = depth_part1(:, 1) - diff01 + 1;

% concatenate depth data
depth_temp = vertcat(depth_part0, depth_part1);

% convert original depth data to milimeters above target
depth = convertDepth(depth_temp);


% (2) signals
% load rawSignals
rawSignal_part0 = loadRawSignal([dataDir '2010-11-30_STN Left_Pass 1_C_Snapshot - 3600_.0 sec.mat']);
rawSignal_part1 = loadRawSignal([dataDir '2010-11-30_STN Left_Pass 1_C_Snapshot - 3600_.0 sec 1.mat']);
% concatenate rawSignals
rawSignal = vertcat(rawSignal_part0, rawSignal_part1);

% load lfps
lfp_part0 = loadLFP([dataDir '2010-11-30_STN Left_Pass 1_C_Snapshot - 3600_.0 sec.mat']);
lfp_part1 = loadLFP([dataDir '2010-11-30_STN Left_Pass 1_C_Snapshot - 3600_.0 sec 1.mat']);
% concatenate lfps
lfp = vertcat(lfp_part0, lfp_part1);

% (3) save data
disp('Saving rawSignal30.mat ...');
save('Data\Raw\rawSignal30.mat', 'rawSignal', '-v7.3');
disp('Saving lfp30.mat ...');
save('Data\Raw\lfp30.mat', 'lfp', '-v7.3');
disp('Saving depth30.mat ...');
save('Data\Raw\depth30.mat', 'depth', '-v7.3');

clear;




%% [Patient 14] [Trajectory 31] = [2010-11-30] [Right] [Pass 1] [Center]
%{
Uni-Bi:     Bilateral
STN Entry:	 5.94
STN Exit:    1.73
SN Entry:    0.96
%}

% (0) check related data
dataDir = 'S:\Google Drive\Rutgers University\Research\DBS\Project\Data\DATA\NEW\';
allFiles = dir(dataDir);
allNames = {allFiles.name};

% (1) depth
% load depth data
depth_temp = loadDepth([dataDir '2010-11-30_STN Right_Pass 1_C_Snapshot - 3600_.0 sec.mat']);
% convert original depth data to milimeters above target
depth = convertDepth(depth_temp);


% (2) signals
% load rawSignals
rawSignal = loadRawSignal([dataDir '2010-11-30_STN Right_Pass 1_C_Snapshot - 3600_.0 sec.mat']);

% load lfps
lfp = loadLFP([dataDir '2010-11-30_STN Right_Pass 1_C_Snapshot - 3600_.0 sec.mat']);

% (3) save data
disp('Saving rawSignal31.mat ...');
save('Data\Raw\rawSignal31.mat', 'rawSignal', '-v7.3');
disp('Saving lfp31.mat ...');
save('Data\Raw\lfp31.mat', 'lfp', '-v7.3');
disp('Saving depth31.mat ...');
save('Data\Raw\depth31.mat', 'depth', '-v7.3');

clear;




%% [Patient 14] [Trajectory 32] = [2010-11-30] [Right] [Pass 2] [Posterior]
%{
Uni-Bi:     Bilateral
STN Entry:	 4.30
STN Exit:    0.62
SN Entry:    N/A
%}

% (0) check related data
dataDir = 'S:\Google Drive\Rutgers University\Research\DBS\Project\Data\DATA\NEW\';
allFiles = dir(dataDir);
allNames = {allFiles.name};

% (1) depth
% load depth data
depth_temp = loadDepth([dataDir '2010-11-30_STN Right_Pass 2_P_Snapshot - 3600_.0 sec.mat']);
% convert original depth data to milimeters above target
depth = convertDepth(depth_temp);


% (2) signals
% load rawSignals
rawSignal = loadRawSignal([dataDir '2010-11-30_STN Right_Pass 2_P_Snapshot - 3600_.0 sec.mat']);

% load lfps
lfp = loadLFP([dataDir '2010-11-30_STN Right_Pass 2_P_Snapshot - 3600_.0 sec.mat']);

% (3) save data
disp('Saving rawSignal32.mat ...');
save('Data\Raw\rawSignal32.mat', 'rawSignal', '-v7.3');
disp('Saving lfp32.mat ...');
save('Data\Raw\lfp32.mat', 'lfp', '-v7.3');
disp('Saving depth32.mat ...');
save('Data\Raw\depth32.mat', 'depth', '-v7.3');

clear;



%% [Patient 15] [Unused Trajectory 14] = [2010-12-07] [Left] [Pass 1] [Center]
%{
Uni-Bi:     Bilateral
STN Entry:	 1.67
STN Exit:    N/A
SN Entry:    N/A
%}



%% [Patient 15] [Trajectory 33] = [2010-12-07] [Left] [Pass 2] [Posterior]
%{
Uni-Bi:     Bilateral
STN Entry:	 1.40
STN Exit:    0.30
SN Entry:    N/A
%}

% (0) check related data
dataDir = 'S:\Google Drive\Rutgers University\Research\DBS\Project\Data\DATA\NEW\';
allFiles = dir(dataDir);
allNames = {allFiles.name};

% (1) depth
% load depth data
depth_part0 = loadDepth([dataDir '2010-12-07_STN Left_Pass 2_P_Snapshot - 3600_.0 sec.mat']);
depth_part1 = loadDepth([dataDir '2010-12-07_STN Left_Pass 2_P_Snapshot - 3600_.0 sec 1.mat']);
% Note: Based on the depth data, part 0 and 1 are consecutive and should be
%       concatenated.

% remove the difference in time before concatenating the depth data
diff01 = depth_part1(1, 1) - depth_part0(length(depth_part0), 1);
depth_part1(:, 1) = depth_part1(:, 1) - diff01 + 1;

% concatenate depth data
depth_temp = vertcat(depth_part0, depth_part1);

% convert original depth data to milimeters above target
depth = convertDepth(depth_temp);


% (2) signals
% load rawSignals
rawSignal_part0 = loadRawSignal([dataDir '2010-12-07_STN Left_Pass 2_P_Snapshot - 3600_.0 sec.mat']);
rawSignal_part1 = loadRawSignal([dataDir '2010-12-07_STN Left_Pass 2_P_Snapshot - 3600_.0 sec 1.mat']);
% concatenate rawSignals
rawSignal = vertcat(rawSignal_part0, rawSignal_part1);

% load lfps
lfp_part0 = loadLFP([dataDir '2010-12-07_STN Left_Pass 2_P_Snapshot - 3600_.0 sec.mat']);
lfp_part1 = loadLFP([dataDir '2010-12-07_STN Left_Pass 2_P_Snapshot - 3600_.0 sec 1.mat']);
% concatenate lfps
lfp = vertcat(lfp_part0, lfp_part1);

% (3) save data
disp('Saving rawSignal33.mat ...');
save('Data\Raw\rawSignal33.mat', 'rawSignal', '-v7.3');
disp('Saving lfp33.mat ...');
save('Data\Raw\lfp33.mat', 'lfp', '-v7.3');
disp('Saving depth33.mat ...');
save('Data\Raw\depth33.mat', 'depth', '-v7.3');

clear;



%% [Patient 15] [Trajectory 34] = [2010-12-07] [Left] [Pass 3] [Anterior]
%{
Uni-Bi:     Bilateral
STN Entry:	 2.50
STN Exit:   -2.70
SN Entry:   -2.70
%}

% (0) check related data
dataDir = 'S:\Google Drive\Rutgers University\Research\DBS\Project\Data\DATA\NEW\';
allFiles = dir(dataDir);
allNames = {allFiles.name};

% (1) depth
% load depth data
depth_part0 = loadDepth([dataDir '2010-12-07_STN Left_Pass 3_A_Snapshot - 3600_.0 sec.mat']);
depth_part1 = loadDepth([dataDir '2010-12-07_STN Left_Pass 3_A_Snapshot - 3600_.0 sec 1.mat']);
% Note: Based on the depth data, part 0 and 1 are consecutive and should be
%       concatenated.

% remove the difference in time before concatenating the depth data
diff01 = depth_part1(1, 1) - depth_part0(length(depth_part0), 1);
depth_part1(:, 1) = depth_part1(:, 1) - diff01 + 1;

% concatenate depth data
depth_temp = vertcat(depth_part0, depth_part1);

% convert original depth data to milimeters above target
depth = convertDepth(depth_temp);


% (2) signals
% load rawSignals
rawSignal_part0 = loadRawSignal([dataDir '2010-12-07_STN Left_Pass 3_A_Snapshot - 3600_.0 sec.mat']);
rawSignal_part1 = loadRawSignal([dataDir '2010-12-07_STN Left_Pass 3_A_Snapshot - 3600_.0 sec 1.mat']);
% concatenate rawSignals
rawSignal = vertcat(rawSignal_part0, rawSignal_part1);

% load lfps
lfp_part0 = loadLFP([dataDir '2010-12-07_STN Left_Pass 3_A_Snapshot - 3600_.0 sec.mat']);
lfp_part1 = loadLFP([dataDir '2010-12-07_STN Left_Pass 3_A_Snapshot - 3600_.0 sec 1.mat']);
% concatenate lfps
lfp = vertcat(lfp_part0, lfp_part1);

% (3) save data
disp('Saving rawSignal34.mat ...');
save('Data\Raw\rawSignal34.mat', 'rawSignal', '-v7.3');
disp('Saving lfp34.mat ...');
save('Data\Raw\lfp34.mat', 'lfp', '-v7.3');
disp('Saving depth34.mat ...');
save('Data\Raw\depth34.mat', 'depth', '-v7.3');

clear;



%% [Patient 15] [Trajectory 35] = [2010-12-07] [Right] [Pass 1] [Center]
%{
Uni-Bi:     Bilateral
STN Entry:	 2.40
STN Exit:    0.00
SN Entry:   -0.40
%}

% (0) check related data
dataDir = 'S:\Google Drive\Rutgers University\Research\DBS\Project\Data\DATA\NEW\';
allFiles = dir(dataDir);
allNames = {allFiles.name};

% (1) depth
% load depth data
depth_temp = loadDepth([dataDir '2010-12-07_STN Right_Pass 1_C_Snapshot - 3600_.0 sec.mat']);
% convert original depth data to milimeters above target
depth = convertDepth(depth_temp);


% (2) signals
% load rawSignals
rawSignal = loadRawSignal([dataDir '2010-12-07_STN Right_Pass 1_C_Snapshot - 3600_.0 sec.mat']);

% load lfps
lfp = loadLFP([dataDir '2010-12-07_STN Right_Pass 1_C_Snapshot - 3600_.0 sec.mat']);

% (3) save data
disp('Saving rawSignal35.mat ...');
save('Data\Raw\rawSignal35.mat', 'rawSignal', '-v7.3');
disp('Saving lfp35.mat ...');
save('Data\Raw\lfp35.mat', 'lfp', '-v7.3');
disp('Saving depth35.mat ...');
save('Data\Raw\depth35.mat', 'depth', '-v7.3');

clear;



%% [Patient 15] [Trajectory 36] = [2010-12-07] [Right] [Pass 2] [Anterior]
%{
Uni-Bi:     Bilateral
STN Entry:	 4.40
STN Exit:   -0.35 ?
SN Entry:   -0.42
%}

% (0) check related data
dataDir = 'S:\Google Drive\Rutgers University\Research\DBS\Project\Data\DATA\NEW\';
allFiles = dir(dataDir);
allNames = {allFiles.name};

% (1) depth
% load depth data
depth_temp = loadDepth([dataDir '2010-12-07_STN Right_Pass 2_A_Snapshot - 3600_.0 sec 1.mat']);
% convert original depth data to milimeters above target
depth = convertDepth(depth_temp);


% (2) signals
% load rawSignals
rawSignal = loadRawSignal([dataDir '2010-12-07_STN Right_Pass 2_A_Snapshot - 3600_.0 sec 1.mat']);

% load lfps
lfp = loadLFP([dataDir '2010-12-07_STN Right_Pass 2_A_Snapshot - 3600_.0 sec 1.mat']);

% (3) save data
disp('Saving rawSignal36.mat ...');
save('Data\Raw\rawSignal36.mat', 'rawSignal', '-v7.3');
disp('Saving lfp36.mat ...');
save('Data\Raw\lfp36.mat', 'lfp', '-v7.3');
disp('Saving depth36.mat ...');
save('Data\Raw\depth36.mat', 'depth', '-v7.3');

clear;



%% [Patient 16] [Trajectory 37] = [2011-01-18] [Left] [Pass 1] [Center]
%{
Uni-Bi:     Bilateral
STN Entry:	 4.90
STN Exit:   -0.15
SN Entry:   -0.75
%}

% (0) check related data
dataDir = 'S:\Google Drive\Rutgers University\Research\DBS\Project\Data\DATA\NEW\';
allFiles = dir(dataDir);
allNames = {allFiles.name};

% (1) depth
% load depth data
depth_temp = loadDepth([dataDir '2011-01-18_STN Left_Pass 1_C_Snapshot - 3600_.0 sec.mat']);
% convert original depth data to milimeters above target
depth = convertDepth(depth_temp);


% (2) signals
% load rawSignals
rawSignal = loadRawSignal([dataDir '2011-01-18_STN Left_Pass 1_C_Snapshot - 3600_.0 sec.mat']);

% load lfps
lfp = loadLFP([dataDir '2011-01-18_STN Left_Pass 1_C_Snapshot - 3600_.0 sec.mat']);

% (3) save data
disp('Saving rawSignal37.mat ...');
save('Data\Raw\rawSignal37.mat', 'rawSignal', '-v7.3');
disp('Saving lfp37.mat ...');
save('Data\Raw\lfp37.mat', 'lfp', '-v7.3');
disp('Saving depth37.mat ...');
save('Data\Raw\depth37.mat', 'depth', '-v7.3');

clear;



%% [Patient 16] [Trajectory 38] = [2011-01-18] [Right] [Pass 1] [Center]
%{
Uni-Bi:     Bilateral
STN Entry:	 3.11
STN Exit:   -0.10
SN Entry:   -0.60
%}

% (0) check related data
dataDir = 'S:\Google Drive\Rutgers University\Research\DBS\Project\Data\DATA\NEW\';
allFiles = dir(dataDir);
allNames = {allFiles.name};

% (1) depth
% load depth data
depth_temp = loadDepth([dataDir '2011-01-18_STN Right_Pass 1_C_Snapshot - 3600_.0 sec.mat']);
% convert original depth data to milimeters above target
depth = convertDepth(depth_temp);


% (2) signals
% load rawSignals
rawSignal = loadRawSignal([dataDir '2011-01-18_STN Right_Pass 1_C_Snapshot - 3600_.0 sec.mat']);

% load lfps
lfp = loadLFP([dataDir '2011-01-18_STN Right_Pass 1_C_Snapshot - 3600_.0 sec.mat']);

% (3) save data
disp('Saving rawSignal38.mat ...');
save('Data\Raw\rawSignal38.mat', 'rawSignal', '-v7.3');
disp('Saving lfp38.mat ...');
save('Data\Raw\lfp38.mat', 'lfp', '-v7.3');
disp('Saving depth38.mat ...');
save('Data\Raw\depth38.mat', 'depth', '-v7.3');

clear;



%% [Patient 16] [Unused Trajectory 15] = [2011-01-18] [Right] [Pass 2] [Posterior]
%{
Uni-Bi:     Bilateral
STN Entry:	 N/A
STN Exit:    N/A
SN Entry:    N/A
%}



%% [Patient 17] [Unused Trajectory 16] = [2011-02-15] [Left] [Pass 1] [Center]
%{
Uni-Bi:     Bilateral
STN Entry:	 N/A
STN Exit:    N/A
SN Entry:   -0.57
%}

%% [Patient 17] [Unused Trajectory 17] = [2011-02-15] [Left] [Pass 2] [Anterior]
%{
Uni-Bi:     Bilateral
STN Entry:	 N/A
STN Exit:    N/A
SN Entry:   -0.40
%}



%% [Patient 17] [Trajectory 39] = [2010-02-15] [Left] [Pass 3] [Posterior]
%{
Uni-Bi:     Bilateral
STN Entry:	 4.93
STN Exit:   -0.26
SN Entry:   -1.05
%}

% (0) check related data
dataDir = 'S:\Google Drive\Rutgers University\Research\DBS\Project\Data\DATA\NEW\';
allFiles = dir(dataDir);
allNames = {allFiles.name};

% (1) depth
% load depth data
depth_part0 = loadDepth([dataDir '2011-02-15_STN Left_Pass 3_P_Snapshot - 3600_.0 sec.mat']);
depth_part1 = loadDepth([dataDir '2011-02-15_STN Left_Pass 3_P_Snapshot - 3600_.0 sec 1.mat']);
% Note: Based on the depth data, part 0 and 1 are consecutive and should be
%       concatenated.

% remove the difference in time before concatenating the depth data
diff01 = depth_part1(1, 1) - depth_part0(length(depth_part0), 1);
depth_part1(:, 1) = depth_part1(:, 1) - diff01 + 1;

% concatenate depth data
depth_temp = vertcat(depth_part0, depth_part1);

% convert original depth data to milimeters above target
depth = convertDepth(depth_temp);


% (2) signals
% load rawSignals
rawSignal_part0 = loadRawSignal([dataDir '2011-02-15_STN Left_Pass 3_P_Snapshot - 3600_.0 sec.mat']);
rawSignal_part1 = loadRawSignal([dataDir '2011-02-15_STN Left_Pass 3_P_Snapshot - 3600_.0 sec 1.mat']);
% concatenate rawSignals
rawSignal = vertcat(rawSignal_part0, rawSignal_part1);

% load lfps
lfp_part0 = loadLFP([dataDir '2011-02-15_STN Left_Pass 3_P_Snapshot - 3600_.0 sec.mat']);
lfp_part1 = loadLFP([dataDir '2011-02-15_STN Left_Pass 3_P_Snapshot - 3600_.0 sec 1.mat']);
% concatenate lfps
lfp = vertcat(lfp_part0, lfp_part1);

% (3) save data
disp('Saving rawSignal39.mat ...');
save('Data\Raw\rawSignal39.mat', 'rawSignal', '-v7.3');
disp('Saving lfp39.mat ...');
save('Data\Raw\lfp39.mat', 'lfp', '-v7.3');
disp('Saving depth39.mat ...');
save('Data\Raw\depth39.mat', 'depth', '-v7.3');

clear;



%% [Patient 17] [Unused Trajectory 18] = [2010-02-15] [Right] [Pass 1] [Posterior]
%{
Uni-Bi:     Bilateral
STN Entry:	 N/A
STN Exit:    N/A
SN Entry:    N/A
%}



%% [Patient 17] [Trajectory 40] = [2010-02-15] [Right] [Pass 2] [Center]
%{
Uni-Bi:     Bilateral
STN Entry:	 0.00
STN Exit:   -4.00
SN Entry:   -4.60
%}

% (0) check related data
dataDir = 'S:\Google Drive\Rutgers University\Research\DBS\Project\Data\DATA\NEW\';
allFiles = dir(dataDir);
allNames = {allFiles.name};

% (1) depth
% load depth data
depth_part0 = loadDepth([dataDir '2011-02-15_STN Right_Pass 2_C_Snapshot - 3600_.0 sec.mat']);
depth_part1 = loadDepth([dataDir '2011-02-15_STN Right_Pass 2_C_Snapshot - 3600_.0 sec 1.mat']);
depth_part2 = loadDepth([dataDir '2011-02-15_STN Right_Pass 2_C_Snapshot - 3600_.0 sec 2.mat']);
depth_part3 = loadDepth([dataDir '2011-02-15_STN Right_Pass 2_C_Snapshot - 3600_.0 sec 3.mat']);
% Note: Based on the depth data, part 0 and 1 are usable and should be
%       concatenated. Part 2 is a single point. Part 3 goes backwards.

% remove the difference in time before concatenating the depth data
diff01 = depth_part1(1, 1) - depth_part0(length(depth_part0), 1);
depth_part1(:, 1) = depth_part1(:, 1) - diff01 + 1;

% concatenate depth data
depth_temp = vertcat(depth_part0, depth_part1);

% convert original depth data to milimeters above target
depth = convertDepth(depth_temp);


% (2) signals
% load rawSignals
rawSignal_part0 = loadRawSignal([dataDir '2011-02-15_STN Right_Pass 2_C_Snapshot - 3600_.0 sec.mat']);
rawSignal_part1 = loadRawSignal([dataDir '2011-02-15_STN Right_Pass 2_C_Snapshot - 3600_.0 sec 1.mat']);
% concatenate rawSignals
rawSignal = vertcat(rawSignal_part0, rawSignal_part1);

% load lfps
lfp_part0 = loadLFP([dataDir '2011-02-15_STN Right_Pass 2_C_Snapshot - 3600_.0 sec.mat']);
lfp_part1 = loadLFP([dataDir '2011-02-15_STN Right_Pass 2_C_Snapshot - 3600_.0 sec 1.mat']);
% concatenate lfps
lfp = vertcat(lfp_part0, lfp_part1);

% (3) save data
disp('Saving rawSignal40.mat ...');
save('Data\Raw\rawSignal40.mat', 'rawSignal', '-v7.3');
disp('Saving lfp40.mat ...');
save('Data\Raw\lfp40.mat', 'lfp', '-v7.3');
disp('Saving depth40.mat ...');
save('Data\Raw\depth40.mat', 'depth', '-v7.3');

clear;



%% [Patient 18] [Trajectory 41] = [2010-02-22] [Left] [Pass 1] [Center]
%{
Uni-Bi:     Bilateral
STN Entry:	 4.36
STN Exit:    0.26
SN Entry:    0.00
%}

% (0) check related data
dataDir = 'S:\Google Drive\Rutgers University\Research\DBS\Project\Data\DATA\NEW\';
allFiles = dir(dataDir);
allNames = {allFiles.name};

% (1) depth
% load depth data
depth_part0 = loadDepth([dataDir '2011-02-22_STN Left_Pass 1_C_Snapshot - 3600_.0 sec.mat']);
depth_part1 = loadDepth([dataDir '2011-02-22_STN Left_Pass 1_C_Snapshot - 3600_.0 sec 1.mat']);
% Note: Based on the depth data, part 0 and 1 are consecutive and should be
%       concatenated.

% remove the difference in time before concatenating the depth data
diff01 = depth_part1(1, 1) - depth_part0(length(depth_part0), 1);
depth_part1(:, 1) = depth_part1(:, 1) - diff01 + 1;

% concatenate depth data
depth_temp = vertcat(depth_part0, depth_part1);

% convert original depth data to milimeters above target
depth = convertDepth(depth_temp);


% (2) signals
% load rawSignals
rawSignal_part0 = loadRawSignal([dataDir '2011-02-22_STN Left_Pass 1_C_Snapshot - 3600_.0 sec.mat']);
rawSignal_part1 = loadRawSignal([dataDir '2011-02-22_STN Left_Pass 1_C_Snapshot - 3600_.0 sec 1.mat']);
% concatenate rawSignals
rawSignal = vertcat(rawSignal_part0, rawSignal_part1);

% load lfps
lfp_part0 = loadLFP([dataDir '2011-02-22_STN Left_Pass 1_C_Snapshot - 3600_.0 sec.mat']);
lfp_part1 = loadLFP([dataDir '2011-02-22_STN Left_Pass 1_C_Snapshot - 3600_.0 sec 1.mat']);
% concatenate lfps
lfp = vertcat(lfp_part0, lfp_part1);

% (3) save data
disp('Saving rawSignal41.mat ...');
save('Data\Raw\rawSignal41.mat', 'rawSignal', '-v7.3');
disp('Saving lfp41.mat ...');
save('Data\Raw\lfp41.mat', 'lfp', '-v7.3');
disp('Saving depth41.mat ...');
save('Data\Raw\depth41.mat', 'depth', '-v7.3');

clear;



%% [Patient 18] [Trajectory 42] = [2011-02-22] [Right] [Pass 1] [Center]
%{
Uni-Bi:     Bilateral
STN Entry:	 1.41
STN Exit:    0.00
SN Entry:   -1.25
%}

% (0) check related data
dataDir = 'S:\Google Drive\Rutgers University\Research\DBS\Project\Data\DATA\NEW\';
allFiles = dir(dataDir);
allNames = {allFiles.name};

% (1) depth
% load depth data
depth_temp = loadDepth([dataDir '2011-02-22_STN Right_Pass 1_C_Snapshot - 3600_.0 sec.mat']);
% convert original depth data to milimeters above target
depth = convertDepth(depth_temp);


% (2) signals
% load rawSignals
rawSignal = loadRawSignal([dataDir '2011-02-22_STN Right_Pass 1_C_Snapshot - 3600_.0 sec.mat']);

% load lfps
lfp = loadLFP([dataDir '2011-02-22_STN Right_Pass 1_C_Snapshot - 3600_.0 sec.mat']);

% (3) save data
disp('Saving rawSignal42.mat ...');
save('Data\Raw\rawSignal42.mat', 'rawSignal', '-v7.3');
disp('Saving lfp42.mat ...');
save('Data\Raw\lfp42.mat', 'lfp', '-v7.3');
disp('Saving depth42.mat ...');
save('Data\Raw\depth42.mat', 'depth', '-v7.3');

clear;



%% [Patient 18] [Trajectory 43] = [2011-02-22] [Right] [Pass 2] [Posterior]
%{
Uni-Bi:     Bilateral
STN Entry:	 2.85
STN Exit:   -1.71
SN Entry:   -3.40
%}

% (0) check related data
dataDir = 'S:\Google Drive\Rutgers University\Research\DBS\Project\Data\DATA\NEW\';
allFiles = dir(dataDir);
allNames = {allFiles.name};

% (1) depth
% load depth data
depth_temp = loadDepth([dataDir '2011-02-22_STN Right_Pass 2_P_Snapshot - 3600_.0 sec.mat']);
% convert original depth data to milimeters above target
depth = convertDepth(depth_temp);


% (2) signals
% load rawSignals
rawSignal = loadRawSignal([dataDir '2011-02-22_STN Right_Pass 2_P_Snapshot - 3600_.0 sec.mat']);

% load lfps
lfp = loadLFP([dataDir '2011-02-22_STN Right_Pass 2_P_Snapshot - 3600_.0 sec.mat']);

% (3) save data
disp('Saving rawSignal43.mat ...');
save('Data\Raw\rawSignal43.mat', 'rawSignal', '-v7.3');
disp('Saving lfp43.mat ...');
save('Data\Raw\lfp43.mat', 'lfp', '-v7.3');
disp('Saving depth43.mat ...');
save('Data\Raw\depth43.mat', 'depth', '-v7.3');

clear;



%% [Patient 18] [Trajectory 44] = [2011-02-22] [Right] [Pass 3] [Posterior -2]
%{
Uni-Bi:     Bilateral
STN Entry:	 6.46
STN Exit:    3.40
SN Entry:   -0.14
%}

% (0) check related data
dataDir = 'S:\Google Drive\Rutgers University\Research\DBS\Project\Data\DATA\NEW\';
allFiles = dir(dataDir);
allNames = {allFiles.name};

% (1) depth
% load depth data
depth_temp = loadDepth([dataDir '2011-02-22_STN Right_Pass 3_P_Snapshot - 3600_.0 sec.mat']);
% convert original depth data to milimeters above target
depth = convertDepth(depth_temp);


% (2) signals
% load rawSignals
rawSignal = loadRawSignal([dataDir '2011-02-22_STN Right_Pass 3_P_Snapshot - 3600_.0 sec.mat']);

% load lfps
lfp = loadLFP([dataDir '2011-02-22_STN Right_Pass 3_P_Snapshot - 3600_.0 sec.mat']);

% (3) save data
disp('Saving rawSignal44.mat ...');
save('Data\Raw\rawSignal44.mat', 'rawSignal', '-v7.3');
disp('Saving lfp44.mat ...');
save('Data\Raw\lfp44.mat', 'lfp', '-v7.3');
disp('Saving depth44.mat ...');
save('Data\Raw\depth44.mat', 'depth', '-v7.3');

clear;



%% [Patient 19] [Unused Trajectory 19] = [2010-03-08] [Left] [Pass 1] [Center]
%{
Uni-Bi:     Unilateral
VIM not STN
%}



%% [Patient 20] [Trajectory 45] = [2011-05-03] [Left] [Pass 1] [Center]
%{
Uni-Bi:     Bilateral
STN Entry:	 4.12
STN Exit:    0.64
SN Entry:   -0.96
%}

% (0) check related data
dataDir = 'S:\Google Drive\Rutgers University\Research\DBS\Project\Data\DATA\NEW\';
allFiles = dir(dataDir);
allNames = {allFiles.name};

% (1) depth
% load depth data
depth_part0 = loadDepth([dataDir '2011-05-03_STN Left_Pass 1_C_Snapshot - 3600_.0 sec.mat']);
depth_part1 = loadDepth([dataDir '2011-05-03_STN Left_Pass 1_C_Snapshot - 3600_.0 sec 1.mat']);
depth_part2 = loadDepth([dataDir '2011-05-03_STN Left_Pass 1_C_Snapshot - 3600_.0 sec 2.mat']);
% Note: Based on the depth data, part 0 and 1 are consecutive and should be
%       concatenated.

% remove the difference in time before concatenating the depth data
diff01 = depth_part1(1, 1) - depth_part0(length(depth_part0), 1);
depth_part1(:, 1) = depth_part1(:, 1) - diff01 + 1;

% concatenate depth data
depth_temp = vertcat(depth_part0, depth_part1);

% convert original depth data to milimeters above target
depth = convertDepth(depth_temp);


% (2) signals
% load rawSignals
rawSignal_part0 = loadRawSignal([dataDir '2011-05-03_STN Left_Pass 1_C_Snapshot - 3600_.0 sec.mat']);
rawSignal_part1 = loadRawSignal([dataDir '2011-05-03_STN Left_Pass 1_C_Snapshot - 3600_.0 sec 1.mat']);
% concatenate rawSignals
rawSignal = vertcat(rawSignal_part0, rawSignal_part1);

% load lfps
lfp_part0 = loadLFP([dataDir '2011-05-03_STN Left_Pass 1_C_Snapshot - 3600_.0 sec.mat']);
lfp_part1 = loadLFP([dataDir '2011-05-03_STN Left_Pass 1_C_Snapshot - 3600_.0 sec 1.mat']);
% concatenate lfps
lfp = vertcat(lfp_part0, lfp_part1);

% (3) save data
disp('Saving rawSignal45.mat ...');
save('Data\Raw\rawSignal45.mat', 'rawSignal', '-v7.3');
disp('Saving lfp45.mat ...');
save('Data\Raw\lfp45.mat', 'lfp', '-v7.3');
disp('Saving depth45.mat ...');
save('Data\Raw\depth45.mat', 'depth', '-v7.3');

clear;



%% [Patient 21] [Trajectory 46] = [2011-05-24] [Left] [Pass 1] [Center]
%{
Uni-Bi:     Bilateral
STN Entry:	 3.59
STN Exit:   -1.48
SN Entry:   -1.66
%}

% (0) check related data
dataDir = 'S:\Google Drive\Rutgers University\Research\DBS\Project\Data\DATA\NEW\';
allFiles = dir(dataDir);
allNames = {allFiles.name};

% (1) depth
% load depth data
depth_temp = loadDepth([dataDir '2011-05-24_STN Left_Pass 1_C_Snapshot - 3600_.0 sec.mat']);
% convert original depth data to milimeters above target
depth = convertDepth(depth_temp);


% (2) signals
% load rawSignals
rawSignal = loadRawSignal([dataDir '2011-05-24_STN Left_Pass 1_C_Snapshot - 3600_.0 sec.mat']);

% load lfps
lfp = loadLFP([dataDir '2011-05-24_STN Left_Pass 1_C_Snapshot - 3600_.0 sec.mat']);

% (3) save data
disp('Saving rawSignal46.mat ...');
save('Data\Raw\rawSignal46.mat', 'rawSignal', '-v7.3');
disp('Saving lfp46.mat ...');
save('Data\Raw\lfp46.mat', 'lfp', '-v7.3');
disp('Saving depth46.mat ...');
save('Data\Raw\depth46.mat', 'depth', '-v7.3');

clear;



%% [Patient 21] [Trajectory 47] = [2011-05-24] [Right] [Pass 1] [Center]
%{
Uni-Bi:     Bilateral
STN Entry:	 6.65
STN Exit:    1.65
SN Entry:    1.21
%}

% (0) check related data
dataDir = 'S:\Google Drive\Rutgers University\Research\DBS\Project\Data\DATA\NEW\';
allFiles = dir(dataDir);
allNames = {allFiles.name};

% (1) depth
% load depth data
depth_temp = loadDepth([dataDir '2011-05-24_STN Right_Pass 1_C_Snapshot - 3600_.0 sec 1.mat']);
% convert original depth data to milimeters above target
depth = convertDepth(depth_temp);


% (2) signals
% load rawSignals
rawSignal = loadRawSignal([dataDir '2011-05-24_STN Right_Pass 1_C_Snapshot - 3600_.0 sec 1.mat']);

% load lfps
lfp = loadLFP([dataDir '2011-05-24_STN Right_Pass 1_C_Snapshot - 3600_.0 sec 1.mat']);

% (3) save data
disp('Saving rawSignal47.mat ...');
save('Data\Raw\rawSignal47.mat', 'rawSignal', '-v7.3');
disp('Saving lfp47.mat ...');
save('Data\Raw\lfp47.mat', 'lfp', '-v7.3');
disp('Saving depth47.mat ...');
save('Data\Raw\depth47.mat', 'depth', '-v7.3');

clear;



%% [Patient 22] [Trajectory 48] = [2011-06-14] [Left] [Pass 1] [Center]
%{
Uni-Bi:     Bilateral
STN Entry:	 5.98
STN Exit:    0.50
SN Entry:   -0.80
%}

% (0) check related data
dataDir = 'S:\Google Drive\Rutgers University\Research\DBS\Project\Data\DATA\NEW\';
allFiles = dir(dataDir);
allNames = {allFiles.name};

% (1) depth
% load depth data
depth_temp = loadDepth([dataDir '2011-06-14 - possible LR confusion_STN Left_Pass 1_C_Snapshot - 3600_.0 sec.mat']);
% convert original depth data to milimeters above target
depth = convertDepth(depth_temp);


% (2) signals
% load rawSignals
rawSignal = loadRawSignal([dataDir '2011-06-14 - possible LR confusion_STN Left_Pass 1_C_Snapshot - 3600_.0 sec.mat']);

% load lfps
lfp = loadLFP([dataDir '2011-06-14 - possible LR confusion_STN Left_Pass 1_C_Snapshot - 3600_.0 sec.mat']);

% (3) save data
disp('Saving rawSignal48.mat ...');
save('Data\Raw\rawSignal48.mat', 'rawSignal', '-v7.3');
disp('Saving lfp48.mat ...');
save('Data\Raw\lfp48.mat', 'lfp', '-v7.3');
disp('Saving depth48.mat ...');
save('Data\Raw\depth48.mat', 'depth', '-v7.3');

clear;



%% [Patient 22] [Trajectory 49] = [2011-06-14] [Right] [Pass 1] [Center]
%{
Uni-Bi:     Bilateral
STN Entry:	 6.78
STN Exit:    1.30
SN Entry:    0.05
%}

% (0) check related data
dataDir = 'S:\Google Drive\Rutgers University\Research\DBS\Project\Data\DATA\NEW\';
allFiles = dir(dataDir);
allNames = {allFiles.name};

% (1) depth
% load depth data
depth_temp = loadDepth([dataDir '2011-06-14 - possible LR confusion_STN Right_Pass 1_C_Snapshot - 3600_.0 sec.mat']);
% convert original depth data to milimeters above target
depth = convertDepth(depth_temp);


% (2) signals
% load rawSignals
rawSignal = loadRawSignal([dataDir '2011-06-14 - possible LR confusion_STN Right_Pass 1_C_Snapshot - 3600_.0 sec.mat']);

% load lfps
lfp = loadLFP([dataDir '2011-06-14 - possible LR confusion_STN Right_Pass 1_C_Snapshot - 3600_.0 sec.mat']);

% (3) save data
disp('Saving rawSignal49.mat ...');
save('Data\Raw\rawSignal49.mat', 'rawSignal', '-v7.3');
disp('Saving lfp49.mat ...');
save('Data\Raw\lfp49.mat', 'lfp', '-v7.3');
disp('Saving depth49.mat ...');
save('Data\Raw\depth49.mat', 'depth', '-v7.3');

clear;



%% [Patient 23] [Trajectory 50] = [2011-07-05] [Left] [Pass 1] [Center]
%{
Uni-Bi:     Bilateral
STN Entry:	 5.90
STN Exit:   -0.11
SN Entry:   -0.58
%}

% (0) check related data
dataDir = 'S:\Google Drive\Rutgers University\Research\DBS\Project\Data\DATA\NEW\';
allFiles = dir(dataDir);
allNames = {allFiles.name};

% (1) depth
% load depth data
depth_temp = loadDepth([dataDir '2011-07-05_STN Left_Pass 1_C_Snapshot - 3600_.0 sec.mat']);
% convert original depth data to milimeters above target
depth = convertDepth(depth_temp);


% (2) signals
% load rawSignals
rawSignal = loadRawSignal([dataDir '2011-07-05_STN Left_Pass 1_C_Snapshot - 3600_.0 sec.mat']);

% load lfps
lfp = loadLFP([dataDir '2011-07-05_STN Left_Pass 1_C_Snapshot - 3600_.0 sec.mat']);

% (3) save data
disp('Saving rawSignal50.mat ...');
save('Data\Raw\rawSignal50.mat', 'rawSignal', '-v7.3');
disp('Saving lfp50.mat ...');
save('Data\Raw\lfp50.mat', 'lfp', '-v7.3');
disp('Saving depth50.mat ...');
save('Data\Raw\depth50.mat', 'depth', '-v7.3');

clear;



%% [Patient 23] [Trajectory 51] = [2011-07-05] [Right] [Pass 1] [Center]
%{
Uni-Bi:     Bilateral
STN Entry:	 6.20
STN Exit:   -0.25
SN Entry:   -0.18
%}

% (0) check related data
dataDir = 'S:\Google Drive\Rutgers University\Research\DBS\Project\Data\DATA\NEW\';
allFiles = dir(dataDir);
allNames = {allFiles.name};

% (1) depth
% load depth data
depth_temp = loadDepth([dataDir '2011-07-05_STN Right_Pass 1_C_Snapshot - 3600_.0 sec.mat']);
% convert original depth data to milimeters above target
depth = convertDepth(depth_temp);


% (2) signals
% load rawSignals
rawSignal = loadRawSignal([dataDir '2011-07-05_STN Right_Pass 1_C_Snapshot - 3600_.0 sec.mat']);

% load lfps
lfp = loadLFP([dataDir '2011-07-05_STN Right_Pass 1_C_Snapshot - 3600_.0 sec.mat']);

% (3) save data
disp('Saving rawSignal51.mat ...');
save('Data\Raw\rawSignal51.mat', 'rawSignal', '-v7.3');
disp('Saving lfp51.mat ...');
save('Data\Raw\lfp51.mat', 'lfp', '-v7.3');
disp('Saving depth51.mat ...');
save('Data\Raw\depth51.mat', 'depth', '-v7.3');

clear;



%% [Patient 24] [Trajectory 52] = [2011-08-16] [Left] [Pass 1] [Center]
%{
Uni-Bi:     Bilateral
STN Entry:	 5.30
STN Exit:   -0.05
SN Entry:   -0.74
%}

% (0) check related data
dataDir = 'S:\Google Drive\Rutgers University\Research\DBS\Project\Data\DATA\NEW\';
allFiles = dir(dataDir);
allNames = {allFiles.name};

% (1) depth
% load depth data
depth_temp = loadDepth([dataDir '2011-08-16_STN Left_Pass 1_C_Snapshot - 3600_.0 sec.mat']);
% convert original depth data to milimeters above target
depth = convertDepth(depth_temp);


% (2) signals
% load rawSignals
rawSignal = loadRawSignal([dataDir '2011-08-16_STN Left_Pass 1_C_Snapshot - 3600_.0 sec.mat']);

% load lfps
lfp = loadLFP([dataDir '2011-08-16_STN Left_Pass 1_C_Snapshot - 3600_.0 sec.mat']);

% (3) save data
disp('Saving rawSignal52.mat ...');
save('Data\Raw\rawSignal52.mat', 'rawSignal', '-v7.3');
disp('Saving lfp52.mat ...');
save('Data\Raw\lfp52.mat', 'lfp', '-v7.3');
disp('Saving depth52.mat ...');
save('Data\Raw\depth52.mat', 'depth', '-v7.3');

clear;



%% [Patient 24] [Trajectory 53] = [2011-08-16] [Right] [Pass 1] [Center]
%{
Uni-Bi:     Bilateral
STN Entry:	 3.10
STN Exit:   -1.80
SN Entry:   -2.10
%}

% (0) check related data
dataDir = 'S:\Google Drive\Rutgers University\Research\DBS\Project\Data\DATA\NEW\';
allFiles = dir(dataDir);
allNames = {allFiles.name};

% (1) depth
% load depth data
depth_temp = loadDepth([dataDir '2011-08-16_STN Right_Pass 1_C_Snapshot - 3600_.0 sec.mat']);
% convert original depth data to milimeters above target
depth = convertDepth(depth_temp);


% (2) signals
% load rawSignals
rawSignal = loadRawSignal([dataDir '2011-08-16_STN Right_Pass 1_C_Snapshot - 3600_.0 sec.mat']);

% load lfps
lfp = loadLFP([dataDir '2011-08-16_STN Right_Pass 1_C_Snapshot - 3600_.0 sec.mat']);

% (3) save data
disp('Saving rawSignal53.mat ...');
save('Data\Raw\rawSignal53.mat', 'rawSignal', '-v7.3');
disp('Saving lfp53.mat ...');
save('Data\Raw\lfp53.mat', 'lfp', '-v7.3');
disp('Saving depth53.mat ...');
save('Data\Raw\depth53.mat', 'depth', '-v7.3');

clear;


























% [Signal 2]
%{
Right STN Trial 1
Impedance checks:
15mm:	0.34 MOhm
ZI Entry:     N/A
STN Entry:	  5.94
STN Exit:     1.73
SN Entry:	
Implant to 1.5 above target
%}

rawSignal{2} = loadRawSignal('Data\Raw\2010-11-30\STN Right\Pass 1\C\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');
lfp{2} = loadLFP('Data\Raw\2010-11-30\STN Right\Pass 1\C\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');
depth_temp = loadDepth('Data\Raw\2010-11-30\STN Right\Pass 1\C\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');
depth{2} = convertDepth(depth_temp);


% [Signal 3]
%{
Right STN Trial 2 (2 mm posterior to track 1)
Impedance checks:
15mm:	0.31 MOhm
ZI Entry:      N/A
STN Entry:	   4.3
STN Exit:     0.62
SN Entry:      N/A
%}

rawSignal{3} = loadRawSignal('Data\Raw\2010-11-30\STN Right\Pass 2\P\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');
lfp{3} = loadLFP('Data\Raw\2010-11-30\STN Right\Pass 2\P\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');
depth_temp = loadDepth('Data\Raw\2010-11-30\STN Right\Pass 2\P\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');
depth{3} = convertDepth(depth_temp);


% 2010-12-07

%{
% Left STN Trial 1
% Impedance checks:
% 15mm:	0.26 MOhm
% ZI Entry:	N/A
% STN Entry:	N/A
% STN Exit	N/A
% SN Entry:	N/A
% Cable switched during recording

rawSignal5 = loadRawSignal('Data\Raw\2010-12-07\STN Left\Pass 1\C\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');
rawSignal6 = loadRawSignal('Data\Raw\2010-12-07\STN Left\Pass 1\C\Snapshot - 3600.0 sec 1\WaveformData-Ch1.mat');
rawSignal7 = loadRawSignal('Data\Raw\2010-12-07\STN Left\Pass 1\C\Snapshot - 3600.0 sec 2\WaveformData-Ch1.mat');
lfp5 = loadLFP('Data\Raw\2010-12-07\STN Left\Pass 1\C\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');
lfp6 = loadLFP('Data\Raw\2010-12-07\STN Left\Pass 1\C\Snapshot - 3600.0 sec 1\WaveformData-Ch1.mat');
lfp7 = loadLFP('Data\Raw\2010-12-07\STN Left\Pass 1\C\Snapshot - 3600.0 sec 2\WaveformData-Ch1.mat');
depth5 = loadDepth('Data\Raw\2010-12-07\STN Left\Pass 1\C\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');
depth6 = loadDepth('Data\Raw\2010-12-07\STN Left\Pass 1\C\Snapshot - 3600.0 sec 1\WaveformData-Ch1.mat');
depth7 = loadDepth('Data\Raw\2010-12-07\STN Left\Pass 1\C\Snapshot - 3600.0 sec 2\WaveformData-Ch1.mat');
%}


% [Signal 4]
%{
Left STN Trial 2 (2mm posterior to track 1)
11mm:	0.25 MOhm
ZI Entry:     N/A
STN Entry:	  1.3
STN Exit:     0.2
SN Entry:     N/A
Quiet track from 4.5mm to -1mm
%}

rawSignal4_part1 = loadRawSignal('Data\Raw\2010-12-07\STN Left\Pass 2\P\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');
rawSignal4_part2 = loadRawSignal('Data\Raw\2010-12-07\STN Left\Pass 2\P\Snapshot - 3600.0 sec 1\WaveformData-Ch1.mat');
rawSignal{4} = vertcat(rawSignal4_part1, rawSignal4_part2);
lfp4_part1 = loadLFP('Data\Raw\2010-12-07\STN Left\Pass 2\P\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');
lfp4_part2 = loadLFP('Data\Raw\2010-12-07\STN Left\Pass 2\P\Snapshot - 3600.0 sec 1\WaveformData-Ch1.mat');
lfp{4} = vertcat(lfp4_part1, lfp4_part2);
depth4_part1 = loadDepth('Data\Raw\2010-12-07\STN Left\Pass 2\P\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');
depth4_part2 = loadDepth('Data\Raw\2010-12-07\STN Left\Pass 2\P\Snapshot - 3600.0 sec 1\WaveformData-Ch1.mat');
% remove the difference in time before concatenating the depth data
diff = depth4_part2(1, 1) - depth4_part1(size(depth4_part1, 1), 1);
depth4_part2(:, 1) = depth4_part2(:, 1) - diff + 1;
depth_temp = vertcat(depth4_part1, depth4_part2);
depth{4} = convertDepth(depth_temp);



% [Signal 5]
%{
Left STN Trial 3 (2mm anterior to track 1)
No impedance checks
ZI Entry:      N/A
STN Entry:	   2.5
STN Exit:     -2.3
SN Entry:     -2.7
Implant to 2.3 mm below target
%}

rawSignal5_part1 = loadRawSignal('Data\Raw\2010-12-07\STN Left\Pass 3\A\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');
rawSignal5_part2 = loadRawSignal('Data\Raw\2010-12-07\STN Left\Pass 3\A\Snapshot - 3600.0 sec 1\WaveformData-Ch1.mat');
rawSignal{5} = vertcat(rawSignal5_part1, rawSignal5_part2);
lfp5_part1 = loadLFP('Data\Raw\2010-12-07\STN Left\Pass 3\A\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');
lfp5_part2 = loadLFP('Data\Raw\2010-12-07\STN Left\Pass 3\A\Snapshot - 3600.0 sec 1\WaveformData-Ch1.mat');
lfp{5} = vertcat(lfp5_part1, lfp5_part2);

% depth
depth5_part1 = loadDepth('Data\Raw\2010-12-07\STN Left\Pass 3\A\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');
depth5_part2 = loadDepth('Data\Raw\2010-12-07\STN Left\Pass 3\A\Snapshot - 3600.0 sec 1\WaveformData-Ch1.mat');
% remove the difference in time before concatenating the depth data
diff = depth5_part2(1, 1) - depth5_part1(size(depth5_part1, 1), 1);
depth5_part2(:, 1) = depth5_part2(:, 1) - diff + 1;
depth_temp = vertcat(depth5_part1, depth5_part2);
depth{5} = convertDepth(depth_temp);



%{
Right STN Trial 1
Impedance checks:
15mm:	0.25 MOhm
ZI Entry:     N/A
STN Entry:	N/A
STN Exit:     N/A
SN Entry:     N/A
Electrode not clamped until 3.0mm, produces false map

loadRawSignal('Data\Raw\2010-12-07\STN Right\Pass 1\C\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');
loadLFP('Data\Raw\2010-12-07\STN Right\Pass 1\C\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');
loadDepth('Data\Raw\2010-12-07\STN Right\Pass 1\C\Snapshot - 3600.0 sec\WaveformData-Ch1.mat');
%}


% [Signal 6]
%{
Right STN Trial 2 (2 mm anterior to track 1)
15mm:	0.24 MOhm
ZI Entry:      N/A
STN Entry:	   4.4
STN Exit:     0.34
SN Entry:    -0.42
Implant to 0.2 above target
%}

rawSignal{6} = loadRawSignal('Data\Raw\2010-12-07\STN Right\Pass 2\A\Snapshot - 3600.0 sec 1\WaveformData-Ch1.mat');
lfp{6} = loadLFP('Data\Raw\2010-12-07\STN Right\Pass 2\A\Snapshot - 3600.0 sec 1\WaveformData-Ch1.mat');
depth_temp = loadDepth('Data\Raw\2010-12-07\STN Right\Pass 2\A\Snapshot - 3600.0 sec 1\WaveformData-Ch1.mat');
depth{6} = convertDepth(depth_temp);


% save rawSignal.mat, lfp.mat, and depth.mat
disp('Saving rawSignal.mat ...');
save('Data\Raw\rawSignal.mat', 'rawSignal', '-v7.3');
disp('Saving lfp.mat ...');
save('Data\Raw\lfp.mat', 'lfp', '-v7.3');
disp('Saving depth.mat ...');
save('Data\Raw\depth.mat', 'depth', '-v7.3');

% load rawSignal.mat, lfp.mat, and depth.mat
disp('Loading rawSignal.mat ...');
load('Data\Raw\rawSignal.mat');
disp('Loading lfp.mat ...');
load('Data\Raw\lfp.mat');
disp('Loading depth.mat ...');
load('Data\Raw\depth.mat');

pwelch(rawSignal{1}, [], [], [], 48000)
pwelch(lfp{1}, [], [], [], 1000)



%% 1.2 Merge signal with depth data
for i = 1 : 6
    disp(['Generating rawRecording{' num2str(i) '} ...']);
    rawRecording{i} = mergeSgnlDpth('rawSignal', rawSignal{i}, depth{i});
    disp(['Generating lfpRecording{' num2str(i) '} ...']);
    lfpRecording{i} = mergeSgnlDpth('lfp', lfp{i}, depth{i});
end

% save rawRecording.mat and lfpRecording.mat
disp('Saving rawRecording.mat ...');
save('Data\Raw\rawRecording.mat', 'rawRecording', '-v7.3');
disp('Saving lfpRecording.mat ...');
save('Data\Raw\lfpRecording.mat', 'lfpRecording', '-v7.3');



%% 1.3 Generate filtered data
% save local field potential (lfp) data to filtered folder
temp = load('Data\Raw\lfp.mat');
for i = 1 : 6
    lfp = temp.lfp{i};
    save(['Data\Filtered\lfp' num2str(i) '.mat'], varname(lfp));
end

% Apply the filters
% load rawRecording.mat and lfpRecording.mat
disp('Loading rawRecording.mat ...');
load('Data\Raw\rawRecording.mat');
disp('Loading lfpRecording.mat ...');
load('Data\Raw\lfpRecording.mat');

for i = 1 : 6
    disp(['Generating filtered signals for recordings ' num2str(i) ' ...']);
    applyFilters(rawRecording{i}(:, 2), lfpRecording{i}(:, 2), ...
        ['Data\Filtered\300-3000\hpfSignal' num2str(i) '.mat'], ...
        ['Data\Filtered\O300\hpfSignal' num2str(i) '.mat'], ...
        ['Data\Filtered\highGammaSignal' num2str(i) '.mat'], ...
        ['Data\Filtered\lowGammaSignal' num2str(i) '.mat'], ...
        ['Data\Filtered\alphaSignal' num2str(i) '.mat'], ...
        ['Data\Filtered\betaSignal' num2str(i) '.mat'], ...
        ['Data\Filtered\thetaSignal' num2str(i) '.mat'], ...
        ['Data\Filtered\deltaSignal' num2str(i) '.mat'], ...
        ['Data\Filtered\infraSlowSignal' num2str(i) '.mat']);
end

% check 300-3000 filtered signal
load('Filtered\300-3000\hpfSignal1.mat');
figure
pwelch(rawRecording{1}(:, 2), [], [], [], 48000)
pwelch(hpfSignal, [], [], [], 48000)

% check O300 filtered signal
load('Filtered\O300\hpfSignal1.mat');
figure
pwelch(rawRecording{1}(:, 2), [], [], [], 48000)
pwelch(hpfSignal, [], [], [], 48000)

% check lfp signal
pwelch(lfpRecording{1}(:, 2), [], [], [], 1000)

% check high gamma signal
load('Filtered\highGammaSignal1.mat');
pwelch(highGammaSignal, [], [], [], 1000)



%% 1.4 Convert 1D input signal to a matrix of epochs with 50% overlapping as rows
% divide into epochs of 4 seconds
% (1) get signal epoch matrices
for i = 1 : 6
    
    disp(['Start group ' num2str(i) ' epoch matrices...']);
    
    temp = load(['Data\Filtered\300-3000\hpfSignal' num2str(i) '.mat']);
    disp(['    Generating hpfSignalEpoch' num2str(i) '...']);
    hpfSignalEpoch = getEpochMatrix(temp.hpfSignal, 4, 48000);
    disp(['    Saving hpfSignalEpoch' num2str(i) '.mat...']);
    save(['Data\Epoch\300-3000\hpfSignal' num2str(i) 'Epoch.mat'], ...
        'hpfSignalEpoch', '-v7.3');

    temp = load(['Data\Filtered\O300\hpfSignal' num2str(i) '.mat']);
    disp(['    Generating hpfSignalEpoch' num2str(i) '...']);
    hpfSignalEpoch = getEpochMatrix(temp.hpfSignal, 4, 48000);
    disp(['    Saving hpfSignalEpoch' num2str(i) '.mat...']);
    save(['Data\Epoch\O300\hpfSignal' num2str(i) 'Epoch.mat'], ...
        'hpfSignalEpoch', '-v7.3');


    disp(['    Generating rawSignalEpoch' num2str(i) '...']);
    rawSignalEpoch = getEpochMatrix(rawRecording{1}(:, 2), 4, 48000);
    disp(['    Saving rawSignal' num2str(i) 'Epoch.mat...']);
    save(['Data\Epoch\rawSignal' num2str(i) 'Epoch.mat'], 'rawSignalEpoch', '-v7.3');
    
    temp = load(['Data\Filtered\alphaSignal' num2str(i) '.mat']);
    disp(['    Generating alphaSignalEpoch' num2str(i) '...']);
    alphaSignalEpoch = getEpochMatrix(temp.alphaSignal, 4, 1000);
    disp(['    Saving alphaSignalEpoch' num2str(i) '.mat...']);
    save(['Data\Epoch\alphaSignal' num2str(i) 'Epoch.mat'], 'alphaSignalEpoch', '-v7.3');

    temp = load(['Data\Filtered\betaSignal' num2str(i) '.mat']);
    disp(['    Generating betaSignalEpoch' num2str(i) '...']);
    betaSignalEpoch = getEpochMatrix(temp.betaSignal, 4, 1000);
    disp(['    Saving betaSignalEpoch' num2str(i) '.mat...']);
    save(['Data\Epoch\betaSignal' num2str(i) 'Epoch.mat'], 'betaSignalEpoch', '-v7.3');

    temp = load(['Data\Filtered\deltaSignal' num2str(i) '.mat']);
    disp(['    Generating deltaSignalEpoch' num2str(i) '...']);
    deltaSignalEpoch = getEpochMatrix(temp.deltaSignal, 4, 1000);
    disp(['    Saving deltaSignalEpoch' num2str(i) '.mat...']);
    save(['Data\Epoch\deltaSignal' num2str(i) 'Epoch.mat'], 'deltaSignalEpoch', '-v7.3');

    temp = load(['Data\Filtered\thetaSignal' num2str(i) '.mat']);
    disp(['    Generating thetaSignalEpoch' num2str(i) '...']);
    thetaSignalEpoch = getEpochMatrix(temp.thetaSignal, 4, 1000);
    disp(['    Saving thetaSignalEpoch' num2str(i) '.mat...']);
    save(['Data\Epoch\thetaSignal' num2str(i) 'Epoch.mat'], 'thetaSignalEpoch', '-v7.3');

    temp = load(['Data\Filtered\lowGammaSignal' num2str(i) '.mat']);
    disp(['    Generating thetaSignalEpoch' num2str(i) '...']);
    lowGammaSignalEpoch = getEpochMatrix(temp.lowGammaSignal, 4, 1000);
    disp(['    Saving thetaSignalEpoch' num2str(i) '.mat...']);
    save(['Data\Epoch\lowGammaSignal' num2str(i) 'Epoch.mat'], 'lowGammaSignalEpoch', '-v7.3');

    temp = load(['Data\Filtered\highGammaSignal' num2str(i) '.mat']);
    disp(['    Generating highGammaSignalEpoch' num2str(i) '...']);
    highGammaSignalEpoch = getEpochMatrix(temp.highGammaSignal, 4, 1000);
    disp(['    Saving highGammaSignalEpoch' num2str(i) '.mat...']);
    save(['Data\Epoch\highGammaSignal' num2str(i) 'Epoch.mat'], 'highGammaSignalEpoch', '-v7.3');

    temp = load(['Data\Filtered\infraSlowSignal' num2str(i) '.mat']);
    disp(['    Generating infraSlowSignalEpoch' num2str(i) '...']);
    infraSlowSignalEpoch = getEpochMatrix(temp.infraSlowSignal, 4, 1000);
    disp(['    Saving infraSlowSignalEpoch' num2str(i) '.mat...']);
    save(['Data\Epoch\infraSlowSignal' num2str(i) 'Epoch.mat'], 'infraSlowSignalEpoch', '-v7.3');
    
end


% (2) get depth epoch matrices

% load rawRecording which has depth data integrated in it
temp = load('Data\Raw\rawRecording.mat');

% generate depth epoch matrices
for i = 1 : 6
    
    disp(['Generating depth epoch matrix ' num2str(i) '...']);
    depthData = temp.rawRecording{i}(:, 3);
    depthEpoch = getEpochMatrix(depthData, 4, 48000);
    disp(['    Saving depth' num2str(i) 'Epoch.mat...']);
    save(['Data\Epoch\depth' num2str(i) 'Epoch.mat'], 'depthEpoch', '-v7.3');
    
end

