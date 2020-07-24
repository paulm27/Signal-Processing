%%% Bearing Angle Estimation %%%
%%
close all
clear
clc

%% load data
filename = 'time_delay_est_data';
load(filename)

x1 = data.x1;   % data from 1st receiver
x2 = data.x2;   % data from 2nd receiver
t = data.t;     % time data
Fs = data.Fs;   % sampling rate

%% Plot data tracks
figure
h1 = subplot(211);
plot(t,x1);
title('Track 1 Data from 1st Receiver')
xlabel('time (seconds)')
ylabel('amplitude')
grid on
h2 = subplot(212);
plot(t,x2,'r');
title('Track 2 Data from 2nd Receiver')
xlabel('time (seconds)')
ylabel('amplitude')
grid on


%% Compute cross correlation between two signals
[r, lags] = xcorr(x1,x2); %%% compute cross correlation %%%
t_shift = lags/Fs; %%% compute time vector for positive and negative delay values %%%

%% Plot correlation vector
figure
plot(t_shift,r,'k','LineWidth',1.5);
title('Cross Correlation Data')
xlabel('time delay (seconds)')
ylabel('amplitude')
grid on
xlim([-0.1 0.1])

%% Search for correlation max, its time index, and compute bearing angle
[max_value, max_index] = max(abs(r));   % find maximum of cross-correlation
t_max = t_shift(max_index); % time delay
theta = asin(343.6*t_max/2.5); %%% compute bearing angle in degrees here %%%
theta_deg = theta*180/pi;

theta_spectrum = asin(343.6*t_shift/2.5);
figure
plot(theta_spectrum, r)
xlabel('Bearing Angle (radians)')
ylabel('Cross Correlation Amplitude')
title('Cross Correlation as a function of angle')
