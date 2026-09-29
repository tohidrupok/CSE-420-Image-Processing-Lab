clc;
clear;
close all;

% Read Image
I = imread('cameraman.tif');

% Convert to grayscale if needed
if size(I, 3) == 3
    I = rgb2gray(I);
end

% Convert image to double
I_double = double(I);

% Fourier Transform
F = fft2(I_double);
Fshift = fftshift(F);

% Magnitude Spectrum
S = log(1 + abs(Fshift));

% Image size
[M, N] = size(I);

% Cut-off frequency
D0 = 30;

% Create High Pass and Low Pass Masks
H_high = ones(M, N);
H_low = zeros(M, N);

for u = 1:M
    for v = 1:N

        % Distance from center
        D = sqrt((u - M/2)^2 + (v - N/2)^2);

        % High Pass Filter
        if D <= D0
            H_high(u, v) = 0;
        end

        % Low Pass Filter
        if D <= D0
            H_low(u, v) = 1;
        end

    end
end

% Apply High Pass Filter
G_high = Fshift .* H_high;
g_high = real(ifft2(ifftshift(G_high)));

% Apply Low Pass Filter
G_low = Fshift .* H_low;
g_low = real(ifft2(ifftshift(G_low)));

% Display Results
figure;

subplot(2,3,1);
imshow(I, []);
title('Original Image');

subplot(2,3,2);
imshow(abs(Fshift), []);
title('Fourier Transform');

subplot(2,3,3);
imshow(S, []);
title('Magnitude Spectrum');

subplot(2,3,4);
imshow(H_high, []);
title('High Pass Filter');

subplot(2,3,5);
imshow(uint8(g_high));
title('High Pass Output');

subplot(2,3,6);
imshow(H_low, []);
title('Low Pass Filter');

% Display Low Pass Output
figure;
imshow(uint8(g_low));
title('Low Pass Output');