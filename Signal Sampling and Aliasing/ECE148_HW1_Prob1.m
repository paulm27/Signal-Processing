%% Paul Monroy: ECE 148B Assignement 1 Problem 1
% Correspondance after mapping input w_x to w_y

clear;
clc;

delta_t = 3e-3; %arbitray setting of sampling rate
w_o = 2*pi/delta_t; %sampling frequency

w_x = 0:0.1:2*w_o; %setting range of input frequency w_x

ref_marker = -1 * w_o/2; %reference is negative end of spectrum
adjusted_freq = w_x - ref_marker;
after_mod_freq = mod(adjusted_freq,w_o);%using modulo w0

w_y = after_mod_freq + ref_marker; %final output frequency

figure;
plot(w_x,w_y)
xlabel('\omega_x (rad/s)', 'FontSize', 16)
ylabel('\omega_y (rad/s)', 'FontSize', 16)
title('Problem 1: Correspondance after mapping \omega_x to \omega_y', 'FontSize', 14)