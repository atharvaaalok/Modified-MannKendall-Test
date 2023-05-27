clear; clc; close all;


X = magic(10);

% Convert into row vector
X = X(:);
n = length(X);
time = 1: n;

% Set significance values
alpha = 0.05;
alpha_ac = 0.1;

tic
% Calculate evaluation time also
[tau, z, p, H] = Modified_MannKendall_test(time, X, alpha, alpha_ac);
total_time = toc;

fprintf("total_time = %f\n", total_time);


figure(1);
plot(time, X);

fprintf('tau \t\t= %.4f\n', tau);
fprintf('z_score \t= %.4f\n', z);
fprintf('p_value \t= %.8f\n', p);
fprintf('H \t\t\t= %d\n', H);