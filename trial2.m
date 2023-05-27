clear; clc; close all;

n = 20000;
X = rand(1, n * (n-1) / 2);
G = gpuArray(X);

tic
m_X = median(X);
time_taken = toc;

tic
m_G = gpuArray(G);
time_taken_gpu = toc;

fprintf("time_taken = %f\n", time_taken);
fprintf("time_taken_gpu = %f\n", time_taken_gpu);