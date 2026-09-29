clc;
clear;
close all;

% Read uploaded image
img1 = imread('myimage.jpg');

% Display original image
subplot(3,3,1);
imshow(img1);
title('Original Image');

% Display image processing section
subplot(3,3,2);
imshow(img1);
title('Image Processing');

% Convert RGB image to grayscale
img2 = rgb2gray(img1);
subplot(3,3,3);
imshow(img2);
title('Gray Scale Image');

% Convert grayscale image to binary
img3 = imbinarize(img2);
subplot(3,3,4);
imshow(img3);
title('BW Image');

% Resize image to 300x300
img4 = imresize(img1, [300 300]);
subplot(3,3,5);
imshow(img4);
title('Resized Image 300x300');

% Resize image to 50%
img5 = imresize(img1, 0.5);
subplot(3,3,6);
imshow(img5);
title('Resized Image 50%');

% Display histogram
subplot(3,3,7);
imhist(img2);
title('Histogram Image');

% Crop image
cropped = imcrop(img1, [50 50 200 160]);
subplot(3,3,8);
imshow(cropped);
title('Cropped Image');

% Rotate image by 45 degrees
rotated = imrotate(img1, 45);

% Increase brightness
imgbr = imadjust(img1, [], [], 0.5);

% Negative image
NGimage = imcomplement(img1);

subplot(3,3,9);
imshow(NGimage);
title('Negative Image');