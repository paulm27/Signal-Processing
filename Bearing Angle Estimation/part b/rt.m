%%% Rolling Thunder %%%
%%
clc
clear
close all

%% Read the (mono) ".wav" sound file.
% fs: sampling frequency
%  x: mono sound signal (double from [-1.0, 1.0])
[x, fs] = audioread('Thunderstorm_6s.wav');

%% Delay a copy of the original sound signal.
speed_sound = 343.6;  % Speed of sound: 343.6 m/s
ear_spacing = 0.18;  % Spacing between ears: 18 cm
deg = 60;  % Source will rotate from -deg to +deg.
rad = deg2rad(deg);  % Convert from degrees to radians.

%% Find the coefficients for our linearly changing source angle.
[len_x, ~] = size(x);
a = 2 * rad / (len_x - 1);
b = -rad;

%% Find the delays as a function of sample index.
n = (1:len_x).';  % 'Sample indices.
theta = a * n + b;  % Linearly changing source angle.
max_delay = fs * ear_spacing / speed_sound;  % Maximum delay possible.
delay = max_delay * sin(theta);  % Delay vector.

%% Find the left mapping: n --> n - delay
% Rounding performs nearest-neighbor interpolation.
n_left = round(n - delay);

%% Prune out-of-range indices.
good_left = find((1 <= n_left) & (n_left <= len_x));
n_left = n_left(good_left);
n1 = n(good_left);

%% Insert zeros for the delays.
x1 = zeros(len_x, 1);

%% TODO(students): Map the indices.
x1(n1) =  x(n_left);  % TODO(students): Delay (or advance) only the left signal.
x2 = x;  % TODO(students): Set the right signal to the original.

%% Write the (stereo) ".wav" sound file.
% x1: left ear
% x2: right ear
audiowrite('RollingThunder.wav', [x1,x2], fs);

[y, fs] = audioread('RollingThunder.wav');
sound(y,fs)
