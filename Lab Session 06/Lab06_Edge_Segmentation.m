clc;
clear;
close all;

%% Create One Figure
figure('Name', 'Image Processing Operations', ...
       'NumberTitle', 'off');


%% 1. Canny and Prewitt
I = imread('cameraman.tif');

if size(I, 3) == 3
    I = rgb2gray(I);
end

BW_Canny = edge(I, 'canny');
BW_Prewitt = edge(I, 'prewitt');

subplot(4,4,1);
imshow(I);
title('Original');

subplot(4,4,2);
imshow(BW_Canny);
title('Canny');

subplot(4,4,3);
imshow(BW_Prewitt);
title('Prewitt');


%% 2. Prewitt
I = imread('peppers.png');

if size(I, 3) == 3
    Igray = rgb2gray(I);
else
    Igray = I;
end

P = edge(Igray, 'prewitt');

subplot(4,4,4);
imshow(I);
title('Prewitt Original');

subplot(4,4,5);
imshow(Igray);
title('Gray Scale');

subplot(4,4,6);
imshow(P);
title('Prewitt Edge');


%% 3. K-Means Clustering
I = imread('peppers.png');

I_double = im2double(I);

X = reshape(I_double, [], 3);

K = 3;

[idx, center] = kmeans(X, K);

seg = reshape(idx, size(I,1), size(I,2));

subplot(4,4,7);
imshow(I);
title('K-Means Original');

subplot(4,4,8);
imagesc(seg);
axis image off;
title('K-Means Clustering');


%% 4. Color K-Means Segmentation
I = imread('peppers.png');

X = double(reshape(I, [], 3));

K = 4;

[idx, C] = kmeans(X, K);

new_image = C(idx, :);

new_image = uint8(reshape(new_image, size(I)));

subplot(4,4,9);
imshow(I);
title('Color K-Means Original');

subplot(4,4,10);
imshow(new_image);
title('Color K-Means');


%% 5. Manual Thresholding
I = imread('peppers.png');

if size(I, 3) == 3
    Igray = rgb2gray(I);
else
    Igray = I;
end

T = 0.5;

BW = Igray > T * 255;

subplot(4,4,11);
imshow(I);
title('Threshold Original');

subplot(4,4,12);
imshow(Igray);
title('Gray Scale');

subplot(4,4,13);
imshow(BW);
title('Manual Threshold');


%% 6. Connected Components
I = imread('coins.png');

level = graythresh(I);

BW = imbinarize(I, level);

[L, num] = bwlabel(BW);

subplot(4,4,14);
imshow(I);
title('Coins Original');

subplot(4,4,15);
imshow(BW);
title('Binary Image');

subplot(4,4,16);
imshow(L, []);
title('Connected Components');

% Display number of connected components
disp(['Number of Connected Components = ', num2str(num)]);