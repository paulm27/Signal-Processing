clear;
clc;
% fs: sampling frequency
% y: sound signal (int16)
%reading audio signal
[y, fs] = audioread('MyAudio.wav');

% Seeing visual signal of audio
total_time = length(y)/fs;
t = 0:total_time/(length(y)):total_time-total_time/length(y);
figure;
plot(t,y)
title('Audio Signal, f_s = 44.1kHz', 'FontSize', 14)
xlabel('Time (s)', 'FontSize', 14)
ylabel('Amplitude', 'FontSize', 14)

%getting FFt of audio signal
y_fft = fft(y,fs);

%plotting FFT spectrum using fftshift to look neater
figure;
plot(abs(fftshift(y_fft)))
title('ECE 148 HW 5, Problem 1: FFT of Speech Signal f_s = 44.1kHz', 'FontSize', 14)
xlabel('Frequency (Hz)', 'FontSize', 14)
ylabel('Amplitude', 'FontSize', 14)

%making a scrambled signal where scrambled[n] = (-1)^n * audio signal
scrambled = zeros(1,length(y));
scrambled(1:2:end) = y(1:2:end) * -1;
scrambled(2:2:end) = y(2:2:end);

%testing scrambled audio (not audible)
sound(scrambled,fs)

%getting FFT of scrambled audio
scrambled_fft = fft(scrambled,fs);

%%plotting FFT spectrum of scrambled audio using fftshift to look neater
figure;
plot(abs(fftshift(scrambled_fft)))
title('ECE 148 HW 5 Problem 2: FFT of Scrambled Signal, f_s = 44.1kHz', 'FontSize', 14)
xlabel('Frequency (Hz)', 'FontSize', 14)
ylabel('Amplitude', 'FontSize', 14)

%applying unscrambling to get back original audio
unscrambled = zeros(1,length(y));
unscrambled(1:2:end) = scrambled(1:2:end)* -1;
unscrambled(2:2:end) = scrambled(2:2:end);

%Testing unscrambled audio (audible)
sound(unscrambled,fs)

% Getting FFT of unscrambled signal
unscrambled_fft = fft(unscrambled,fs);

% Plotting FFT of unscrambled signal using FFTshift to look neater and
% comparing to original
subplot(2,1,1)
plot(abs(fftshift(unscrambled_fft)))
title('ECE 148 HW 5 Problem 5: FFT of Unscrambled Signal, f_s = 44.1kHz', 'FontSize', 14)
xlabel('Frequency (Hz)', 'FontSize', 14)
ylabel('Amplitude', 'FontSize', 14)

subplot(2,1,2)
plot(abs(fftshift(y_fft)))
title('ECE 148 HW 5 Problem 5: FFT of Original Audio Signal, f_s = 44.1kHz', 'FontSize', 14)
xlabel('Frequency (Hz)', 'FontSize', 14)
ylabel('Amplitude', 'FontSize', 14)

%finding mean square error
error = immse(y,unscrambled.');
