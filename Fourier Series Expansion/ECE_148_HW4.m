clear;
clc;

%setting arbitrary period (this case is 2pi for simplicity and ease of 
%comparison later on
T = 2*pi;
w0 = 2*pi/T;

%times for which we will analyze
t = 0:0.01:T;

% PERM: 4010278

%first PERM digit
f0 = 4;

%since f1 = 0, it is not included

%third perm digit that will scale the first instance of FS expansion
f2 = exp(1i*2*w0*t);
%plotting this function
figure;
plot(t,f2)
title('ECE 148 HW 4, Problem 2a: Plot of f_2(t) = e^{j2\omega_0t}', 'FontSize', 14)
xlabel('time (s)', 'FontSize', 14)
ylabel('f_2(t)', 'FontSize', 14)

%since f3 = 0, there is no need to include it

%fifth perm digit that will scale the first instance of FS expansion
f4 = 2* exp(1i*4*w0*t);
%plotting this function
figure;
plot(t,f4)
title('ECE 148 HW 4, Problem 2a: Plot of f_4(t) = 2e^{j4\omega_0t}', 'FontSize', 14)
xlabel('time (s)', 'FontSize', 14)
ylabel('f_4(t)', 'FontSize', 14)

%6th perm digit that will scale the first instance of FS expansion
f5 = 7* exp(1i*5*w0*t);
figure;
plot(t,f5)
title('ECE 148 HW 4, Problem 2a: Plot of f_5(t) = 7e^{j5\omega_0t}', 'FontSize', 14)
xlabel('time (s)', 'FontSize', 14)
ylabel('f_5(t)', 'FontSize', 14)

%7th perm digit that will scale the first instance of FS expansion
f6 = 8* exp(1i*6*w0*t);
figure;
plot(t,f6);
title('ECE 148 HW 4, Problem 2a: Plot of f_6(t) = 8e^{j6\omega_0t}', 'FontSize', 14)
xlabel('time (s)', 'FontSize', 14)
ylabel('f_6(t)', 'FontSize', 14)

%here, we start by plotting f2 and and adding f1, f4, and so on to see the
%transformation of the time-domain spectrum

%plotting only f2
figure;
subplot(5,1,1)
plot(t,f2)
title('ECE 148 HW 4, Problem 2a: Plot of f_2(t), T = 2\pi', 'FontSize', 14)
xlabel('time (s)', 'FontSize', 14)
ylabel('f(t)', 'FontSize', 14)

%plotting f0 + f2
subplot(5,1,2)
plot(t,f0+f2)
title('ECE 148 HW 4, Problem 2a: Plot of f_1(t)+f_2(t), T = 2\pi', 'FontSize', 14)
xlabel('time (s)', 'FontSize', 14)
ylabel('f(t)', 'FontSize', 14)

%plotting f0 + f2 + f4
subplot(5,1,3)
plot(t,f0+f2+f4)
title('ECE 148 HW 4, Problem 2a: Plot of f_1(t)+f_2(t) + f_4(t),  T = 2\pi', 'FontSize', 14)
xlabel('time (s)', 'FontSize', 14)
ylabel('f(t)', 'FontSize', 14)

%plotting f0 + f2 + f4 + f5
subplot(5,1,4)
plot(t,f0+f2+f4+f5)
title('ECE 148 HW 4, Problem 2a: Plot of f_1(t)+f_2(t) + f_4(t) +  f_5(t),  T = 2\pi', 'FontSize', 14)
xlabel('time (s)', 'FontSize', 14)
ylabel('f(t)', 'FontSize', 14)

%plotting f0 + f2 + f4 + f5 + f6
subplot(5,1,5)
plot(t,f0+f2+f4+f5+f6)
title('ECE 148 HW 4, Problem 2a: Plot of f(t) = f_1(t)+f_2(t) + f_4(t) +  f_5(t) + f_6(t),  T = 2\pi', 'FontSize', 14)
xlabel('time (s)', 'FontSize', 14)
ylabel('f(t)', 'FontSize', 14)

%plotting final f(t)
f = 4 + exp(1i*2*w0*t) + 2*exp(1i*4*w0*t) + 7*exp(1i*5*w0*t) + 8*exp(1i*6*w0*t);
figure;
plot(t,f)
title('ECE 148 HW 4, Problem 2a: Plot of f(t), T = 2\pi', 'FontSize', 14)
xlabel('time (s)', 'FontSize', 14)
ylabel('f(t)', 'FontSize', 14)

%%

clear;
clc;

%setting spectrum of theta
theta = 0:0.01:2*pi;

%x[0] = 4
X0 = 4;

%x[1] = 0 so no need to include X1

%x[2] = 1, multiply by exp(-1i*2*theta)
X2 = exp(-1i*2*theta);

%plotting X2
figure;
plot(theta,X2)
title('ECE 148 HW 4, Problem 2b: Plot of X_2(e^{j\theta}) = e^{-j2\theta}', 'FontSize', 14)
xlabel('\theta (rad)', 'FontSize', 14)
ylabel('X_2(e^{j\theta})', 'FontSize', 14)

%x[3] = 0, no need to include X3

%x[4] = 2, multiply by exp(-1i*4*theta)
X4 = 2* exp(-1i*4*theta);
%plotting X4
figure;
plot(theta,X4)
title('ECE 148 HW 4, Problem 2b: Plot of X_4(e^{j\theta}) = 2e^{-j4\theta}', 'FontSize', 14)
xlabel('\theta (rad)', 'FontSize', 14)
ylabel('X_4(e^{j\theta})', 'FontSize', 14)

%x[5] = 7, multiply by exp(-1i*5*theta)
X5 = 7* exp(-1i*5*theta);

%plotting X5
figure;
plot(theta,X5)
title('ECE 148 HW 4, Problem 2b: Plot of X_5(e^{j\theta}) = 7e^{-j5\theta}', 'FontSize', 14)
xlabel('\theta (rad)', 'FontSize', 14)
ylabel('X_5(e^{j\theta})', 'FontSize', 14)

%x[6] = 8, multiply by exp(-1i*6*theta)
X6 = 8* exp(-1i*6*theta);

%plotting X6
figure;
plot(theta,X6);
title('ECE 148 HW 4, Problem 2b: Plot of X_6(e^{j\theta}) = 8e^{-j6\theta}', 'FontSize', 14)
xlabel('\theta (rad)', 'FontSize', 14)
ylabel('X_6(e^{j\theta})', 'FontSize', 14)

%here, we start by plotting X2 and and adding X0, X4, and so on to see the
%transformation of the frequency-domain spectrum

%plotting X2
figure;
subplot(5,1,1)
plot(theta,X2)
title('ECE 148 HW 4, Problem 2b: Plot of X_2(e^{j\theta}), \theta = [0 2 \pi]', 'FontSize', 14)
xlabel('\theta (rad)', 'FontSize', 14)
ylabel('X(e^{j\theta})', 'FontSize', 14)

%Plotting X0 + X2
subplot(5,1,2)
plot(theta,X0+X2)
title('ECE 148 HW 4, Problem 2b: Plot of X_1(e^{j\theta})+X_2(e^{j\theta}), \theta = [0 2\pi]', 'FontSize', 14)
xlabel('\theta (rad)', 'FontSize', 14)
ylabel('X(e^{j\theta})', 'FontSize', 14)

%plotting X0 + X2 + X4
subplot(5,1,3)
plot(theta,X0+X2+X4)
title('ECE 148 HW 4, Problem 2b: Plot of X_1(e^{j\theta})+X_2(e^{j\theta}) + X_4(e^{j\theta}), \theta = [0 2\pi]', 'FontSize', 14)
xlabel('\theta (rad)', 'FontSize', 14)
ylabel('X(e^{j\theta})', 'FontSize', 14)

%plotting X0 + X2 + X4 + X5
subplot(5,1,4)
plot(theta,X0+X2+X4+X5)
title('ECE 148 HW 4, Problem 2b: Plot of X_1(e^{j\theta})+X_2(e^{j\theta}) + X_4(e^{j\theta}) +  X_5(e^{j\theta}), \theta = [0 2\pi]', 'FontSize', 14)
xlabel('\theta (rad)', 'FontSize', 14)
ylabel('X(e^{j\theta})', 'FontSize', 14)

%plotting X0 + X2 + X4 + X5 + X6
subplot(5,1,5)
plot(theta,X0+X2+X4+X5+X6)
title('ECE 148 HW 4, Problem 2b: Plot of X(e^{j\theta}), \theta = [0 2\pi]', 'FontSize', 14)
xlabel('\theta (rad)', 'FontSize', 14)
ylabel('X(e^{j\theta})', 'FontSize', 14)

%plotting X(e^jn*theta)
X = 4 + exp(-1i*2*theta) + 2*exp(-1i*4*theta) + 7*exp(-1i*5*theta) + 8*exp(-1i*6*theta);
figure;
plot(theta,X)
title('ECE 148 HW 4, Problem 2b: Plot of X(e^{j\theta}), \theta = [0 2\pi]', 'FontSize', 14)
xlabel('\theta (rad)', 'FontSize', 14)
ylabel('X(e^{j\theta})', 'FontSize', 14)