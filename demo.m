%% DEMONSTRATON OF USING THE FUNCTIONS
% Modified_MannKendall_test_optimized - This function uses gpuArrays to optimize sen-slope calculations
clear; clc; close all;


%% GENERATE TIME SERIES TO FIND THE KENDALL TAU VALUE OF

n = 1000;
X = rand(1, n);
t = 1: n;

% Set significance values for hypothesis testing
significance_value_tau = 0.05;
significance_value_ac = 0.05;

tic
% Find the Kendall-tau values and associated quantifiers
[tau, z_score, p_value, H] = Modified_MannKendall_test(t, X, significance_value_tau, significance_value_ac);
t1 = toc;

tic
% The Optimized function uses gpuArrays to improve computation speeds, but requires the Parallel Computing or similar toolboxes
% Read Details in the function and to find the GPU shift vector length for your system run the codes in Testing_Codes folder
gpu_shift_critical_size = 550;
[tau_opt, z_score_opt, p_value_opt, H_opt] = Modified_MannKendall_test_Optimized(t, X, significance_value_tau, significance_value_ac, gpu_shift_critical_size);
t2 = toc;


%% PRINT RESULTS

% Print results for the unoptimized Mann-Kendall test
fprintf('Unoptimized Mann-Kendall Function\n');
fprintf('tau \t\t= %.4f\n', tau);
fprintf('z_score \t= %.4f\n', z_score);
fprintf('p_value \t= %.8f\n', p_value);
fprintf('H \t\t\t= %d\n', H);
fprintf('t1 \t\t\t= %.5f\n', t1);
fprintf('\n');

% Print results for the optimized Mann-Kendall test
fprintf('Optimized Mann-Kendall Function\n');
fprintf('tau \t\t= %.4f\n', tau);
fprintf('z_score \t= %.4f\n', z_score);
fprintf('p_value \t= %.8f\n', p_value);
fprintf('H \t\t\t= %d\n', H);
fprintf('t2 \t\t\t= %.5f\n', t2);
fprintf('\n');

