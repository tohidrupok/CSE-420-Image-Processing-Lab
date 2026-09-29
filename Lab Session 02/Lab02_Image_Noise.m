clc;
clear;
close all;

% Read uploaded image
I = imread('myimage.jpg');

% Built-in noises
J = imnoise(I, 'gaussian', 0.02, 0.2);
K = imnoise(I, 'salt & pepper', 0.02);
L = imnoise(I, 'poisson');

% Display main image
subplot(3,3,1);
imshow(I);
title('Main Image');

% Gaussian Noise
subplot(3,3,2);
imshow(J);
title('Gaussian Noise Image');

% Salt & Pepper Noise
subplot(3,3,3);
imshow(K);
title('Salt & Pepper Noise Image');

% Poisson Noise
subplot(3,3,4);
imshow(L);
title('Poisson Noise Image');

% Convert image to double
I_double = im2double(I);

% Get image dimensions
[m, n, c] = size(I_double);

% Rayleigh Noise
a = 0.1;
rayleigh_noise = a * sqrt(-2 * log(1 - rand(m,n,c)));

M = I_double + rayleigh_noise;

% Keep pixel values in [0,1]
M = min(max(M, 0), 1);

subplot(3,3,5);
imshow(M);
title('Rayleigh Noise Image');

% Gamma Noise
shape = 2;
scale = 0.05;

gamma_noise = gamrnd(shape, scale, m, n, c);
N = I_double + gamma_noise;

% Keep pixel values in [0,1]
N = min(max(N, 0), 1);

subplot(3,3,6);
imshow(N);
title('Gamma Noise Image');

% Exponential Noise
lambda = 20;

exp_noise = exprnd(1/lambda, m, n, c);
O = I_double + exp_noise;

% Keep pixel values in [0,1]
O = min(max(O, 0), 1);

subplot(3,3,7);
imshow(O);
title('Exponential Noise Image');

% Uniform Noise
low = -0.1;
high = 0.1;

uniform_noise = low + (high - low) * rand(m,n,c);
P = I_double + uniform_noise;

% Keep pixel values in [0,1]
P = min(max(P, 0), 1);

subplot(3,3,8);
imshow(P);
title('Uniform Noise Image');