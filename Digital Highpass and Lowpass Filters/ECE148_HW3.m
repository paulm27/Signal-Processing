%% ECE 148 Assignment 3 by Paul Monroy
%% Problem 1 and 2
clc
clear

%setting up gradients in both x and y directions
x_direction = [-1/2 0 1/2; -1 0 1; -1/2 0 1/2];
y_direction = flipud(x_direction.');

%Total gradient 
h = x_direction + 1i * y_direction;

%plotting DTFT frequency response
figure;
DTFT = freqz2(real(h));
mesh(abs(DTFT))
title('ECE 148 HW3 Problem 1: DTFT frequency response of edge detection highpass filter')
xlabel('Frequency in x-direction (rad/s)')
ylabel('Frequency in y-direction (rad/s)')
zlabel('Magnitude')

% Opening and reading image
img = imread('FigTreeMove008_Gray.jpg');

%convolving total gradient filter and image
figure;
out = conv2(img,h);
imshow(out);
title('ECE 148 Homework 3, Problem 2c: Combined gradient in x and y direction')

%convolving x direction gradient filter and image
figure;
out2 = conv2(img,x_direction);
imshow(out2);
title('ECE 148 Homework 3, Problem 2a: Gradient in x direction')

%convolving y direction gradient filter and image
figure;
out3 = conv2(img,y_direction);
imshow(out3);
title('ECE 148 Homework 3, Problem 2b: Gradient y direction')

%Superimposing the total gradient filter on the original image
figure;
C = imfuse(img,abs(out),'blend');
imshow(C)
title('ECE 148 Homework 3, Problem 2d: superimposed image')

%saving our images
imwrite(out2,'HW 3 Problem 2a, x-direction gradient.jpg')
imwrite(out3,'HW 3 Problem 2b, y-direction gradient.jpg')
imwrite(out,'HW 3 Problem 2c, combined gradient.jpg')
imwrite(C,'HW 3 Problem 2d, superimposed image.jpg')
%% Problem 3 and 4
clear;
clc;

% Opening and reading image
img = imread('FigTreeMove008_Gray.jpg');
img = double(img);

%setting up Laplacian peak detector filter
h = (1/8)*[-1 -1 -1; -1 8 -1; -1 -1 -1];

%plotting DTFT frequency response of filter
figure;
DTFT = freqz2(real(h));
mesh(abs(DTFT))
title('ECE 148 Homework 3, Problem 3: DTFT frequency response of edge detection highpass filter')
xlabel('Frequency in x-direction (rad/s)')
ylabel('Frequency in y-direction (rad/s)')
zlabel('Magnitude')

% Convolving our filter with image
out = conv2(img,h);
figure;
imshow(out)
title('ECE 148 Homework 3 Problem 4a: Laplacian filter applied for peak detection')

% Superimposing our convolved image with original image
C = imfuse(img,abs(out),'blend');
figure;
imshow(C)
title('ECE 148 Homework 3 Problem 4b: Superimposed image, Laplacian filter applied')

%saving our images
imwrite(out, 'HW3 Problem 4a: Laplacian filter applied for peak detection.jpg')
imwrite(C, 'HW3 Problem 4b: Superimposed image, Laplacian filter applied.jpg')

%% Problem 5 and 6

clear;
clc;

% Opening and reading image
img = double(imread('FigTreeMove008_Gray.jpg'));
h = (1/9)*[1 1 1; 1 1 1; 1 1 1];

%plotting DTFT frequency response of filter
figure;
DTFT = freqz2(real(h));
mesh(abs(DTFT))
title('ECE 148 Homework 3, Problem 5: DTFT frequency response of moving average lowpass filter')
xlabel('Frequency in x-direction (rad/s)')
ylabel('Frequency in y-direction (rad/s)')
zlabel('Magnitude')

% Convolving our filter with image
figure;
out = conv2(img,h);
imshow(out)
title('ECE 148 Homework 3 Problem 6a: Lowpass filter applied for moving average')

% Superimposing our convolved image with original image
figure;
C = imfuse(img,abs(out),'blend');
imshow(C)
title('ECE 148 Homework 3 Problem 6b: Superimposed image, LPF applied')

% Saving our images
imwrite(out, 'HW3 Problem 6a: Laplacian filter applied for peak detection.jpg')
imwrite(C, 'HW3 Problem 6b: Superimposed image, Laplacian filter applied.jpg')

