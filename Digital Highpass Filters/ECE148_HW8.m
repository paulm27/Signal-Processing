%% ECE 148 HW 8: Digital Highpass Filter
% Paul Monroy, PERM: 4010278

clear
clc
close all

% attenuation values
alpha_min = 20;
alpha_max = 0.5;

% passband and stopband frequencies
OMEGA_s = pi/2;
OMEGA_p = 3*pi/4;

% conversion of frequencies
omega_s = tan((pi- OMEGA_s)/2);
omega_p = tan((pi-OMEGA_p)/2);

% tringto find n
% n >= log(c/d)/b
c = (10^(alpha_min/10)) - 1;
d = (10^(alpha_max/10)) - 1;

a = log(c/d);
b = 2*log(omega_s/omega_p);

% rounding up for order
n = a/b;
n = ceil(n);

% defining value 1/2n for simplicity
expon = 1/(2*n);

% trying to find our cutoff frequency with max and min values
omega_min = omega_p/(d^expon);
omega_max = omega_s/(c^expon);

% taking average of min and max values
omega_0 = (omega_min + omega_max)/2;

% setting range of w
omega = -pi:0.001:pi;

% s = jw
s = 1i*omega;

% defining k for our poles
k = 0:2*n-1;

% n is even, so we use s_p to find the poles
s_p = omega_0*exp(1j*(2*k+1)*pi/(2*n));

% finds poles where the real part is less than 0 (implies stability)
s_p = s_p(s_p < 0);

% defining our transfer function with our poles 
HaL_s = omega_0^n ./ ( (s-s_p(1)) .* (s-s_p(2)) .* (s-s_p(3)) .* (s-s_p(4)) );

% plotting analog lowpass filter 
figure
plot(omega,abs(HaL_s))
xlabel('\omega (rad/s)', 'FontSize' , 14)
ylabel('Magnitude', 'FontSize' , 14)
title('Analog Lowpass Filter', 'FontSize' , 14)

% plotting analog lowpass filter in dB magnitude
figure
plot(omega,20*log10((abs(HaL_s))))
xlabel('\omega (rad/s)', 'FontSize' , 14)
ylabel('Magnitude (dB)', 'FontSize' , 14)
title('Analog Lowpass Filter', 'FontSize' , 14)

% defining z = exp(jw)
z = exp(1i*omega);

%frequency transformation from s to z
s = (z-1)./(z+1);

% keeping the poles from before
HdL_z = omega_0^n ./ ( (s-s_p(1)) .* (s-s_p(2)) .* (s-s_p(3)) .* (s-s_p(4)) );

% Plotting digital lowpass filter 
figure;
plot(omega,abs(HdL_z))
title('Digital Lowpass Filter', 'FontSize' , 14)
xlabel('\omega (rad/s)', 'FontSize' , 14)
ylabel('Magnitude', 'FontSize' , 14)

% plotting digital lowpass filter in dB
figure;
plot(omega,20*log10(abs(HdL_z)))
title('Digital Lowpass Filter', 'FontSize' , 14)
xlabel('\omega (rad/s)', 'FontSize' , 14)
ylabel('Magnitude (dB)', 'FontSize' , 14)

% Setting Z = -z and implementing H(Z) to get a digital highpass transfer
% function
s = (-z-1)./(-z+1);
HdH_z = omega_0^n ./ ( (s-s_p(1)) .* (s-s_p(2)) .* (s-s_p(3)) .* (s-s_p(4)) );

% Plotting digital highpass transfer function 
figure;
plot(omega,20*log10(abs(HdH_z)))
title('Digital Highpass Filter', 'FontSize' , 14)
xlabel('\omega (rad/s)', 'FontSize' , 14)
ylabel('Magnitude (dB)', 'FontSize' , 14)

% Plotting digital highpass transfer function in magnitude dB
figure;
plot(omega,abs(HdH_z))
title('Digital Highpass Filter', 'FontSize' , 14)
xlabel('\omega (rad/s)', 'FontSize' , 14)
ylabel('Magnitude', 'FontSize' , 14)