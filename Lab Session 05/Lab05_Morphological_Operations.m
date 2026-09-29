clc;
clear;
close all;

figure('Name', 'All Image Processing Operations', ...
       'NumberTitle', 'off');

%% Dilation
I = imread('cameraman.tif');

if size(I, 3) == 3
    I = rgb2gray(I);
end

BW = imbinarize(I);
SE = strel('square', 3);
D = imdilate(BW, SE);

subplot(3,6,1);
imshow(I);
title('Dilation - Original');

subplot(3,6,2);
imshow(BW);
title('Dilation - Binary');

subplot(3,6,3);
imshow(D);
title('Dilation');


%% Erosion
I = imread('peppers.png');

if size(I, 3) == 3
    I = rgb2gray(I);
end

BW = imbinarize(I);
SE = strel('square', 3);
E = imerode(BW, SE);

subplot(3,6,4);
imshow(I);
title('Erosion - Original');

subplot(3,6,5);
imshow(BW);
title('Erosion - Binary');

subplot(3,6,6);
imshow(E);
title('Erosion');


%% Opening
I = imread('pout.tif');

if size(I, 3) == 3
    I = rgb2gray(I);
end

BW = imbinarize(I);
SE = strel('square', 3);
O = imopen(BW, SE);

subplot(3,6,7);
imshow(I);
title('Opening - Original');

subplot(3,6,8);
imshow(BW);
title('Opening - Binary');

subplot(3,6,9);
imshow(O);
title('Opening');


%% Closing
I = imread('saturn.png');

if size(I, 3) == 3
    I = rgb2gray(I);
end

BW = imbinarize(I);
SE = strel('square', 3);
C = imclose(BW, SE);

subplot(3,6,10);
imshow(I);
title('Closing - Original');

subplot(3,6,11);
imshow(BW);
title('Closing - Binary');

subplot(3,6,12);
imshow(C);
title('Closing');


%% Replication
I = imread('cameraman.tif');

Z = imresize(I, 2, 'nearest');

subplot(3,6,13);
imshow(I);
title('Replication - Original');

subplot(3,6,14);
imshow(Z);
title('Replication');


%% Bilinear Interpolation
I = imread('moon.tif');

Z = imresize(I, 2, 'bilinear');

subplot(3,6,15);
imshow(I);
title('Bilinear - Original');

subplot(3,6,16);
imshow(Z);
title('Bilinear');


%% Segmentation
I = imread('cameraman.tif');

if size(I, 3) == 3
    I = rgb2gray(I);
end

level = graythresh(I);
BW = imbinarize(I, level);

subplot(3,6,17);
imshow(I);
title('Segmentation - Original');

subplot(3,6,18);
imshow(BW);
title('Segmentation');