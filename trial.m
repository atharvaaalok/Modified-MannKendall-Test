clear; clc; close all;


% X = [1, 2, 3, 4, 5, 6];
X = magic(10);
X = X(:);
csvwrite("Timeseries_Data.csv", X);
n = length(X);
time = 1: n;

alpha = 0.05;
alpha_ac = 0.05;

% Calculate evaluation time also
start = tic;
[tau, z, p, H] = MMK(time, X, alpha, alpha_ac);
total_time = toc(start);

fprintf("total_time = %f\n", total_time);


figure(1);
plot(time, X);

fprintf('tau \t\t= %.4f\n', tau);
fprintf('z_score \t= %.4f\n', z);
fprintf('p_value \t= %.8f\n', p);
fprintf('H \t\t\t= %d\n', H);

