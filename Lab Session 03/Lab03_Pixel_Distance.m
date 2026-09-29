clc;
clear;

% Create Image Matrix
A = [1  2  3  4  5;
     6  7  8  9  10;
     11 12 13 14 15;
     16 17 18 19 20;
     21 22 23 24 25];

% Display Image Matrix
disp('Image Matrix');
disp(A);

% Select center pixel
x1 = 3;
y1 = 3;

% Select second pixel
x2 = 4;
y2 = 5;

% Selected pixel
p = A(x1, y1);

fprintf('Selected Pixel = %d\n', p);

% 4-Neighbours
N4 = [A(x1-1, y1), ...
      A(x1+1, y1), ...
      A(x1, y1-1), ...
      A(x1, y1+1)];

disp('4-Neighbours');
disp(N4);

% Diagonal Neighbours
ND = [A(x1-1, y1-1), ...
      A(x1-1, y1+1), ...
      A(x1+1, y1-1), ...
      A(x1+1, y1+1)];

disp('Diagonal Neighbours');
disp(ND);

% 8-Neighbours
N8 = A(x1-1:x1+1, y1-1:y1+1);

disp('8-Neighbours');
disp(N8);

% Euclidean Distance
D_Euclidean = sqrt((x1-x2)^2 + (y1-y2)^2);

% City-block Distance
D_CityBlock = abs(x1-x2) + abs(y1-y2);

% Chessboard Distance
D_Chessboard = max(abs(x1-x2), abs(y1-y2));

% Display Distances
disp('Euclidean Distance');
disp(D_Euclidean);

disp('City-block Distance');
disp(D_CityBlock);

disp('Chessboard Distance');
disp(D_Chessboard);