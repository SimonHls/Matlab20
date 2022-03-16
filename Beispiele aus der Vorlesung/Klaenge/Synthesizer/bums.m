%Macht einen lauten, hohen Ton
% Sampling
fs = 1000;     % Sampling rate [Hz]
Ts = 1/fs;     % Sampling period [s]
fNy = fs / 2;  % Nyquist frequency [Hz]
duration = 10; % Duration [s]
t = 0 : Ts : duration-Ts; % Time vector
noSamples = length(t);    % Number of samples
% Original signal
x = 220.*sin(2 .* pi .* 50 .* t);
% Harmonics
x1 = 100.*sin(2 .* pi .* 100 .* t);
x2 = 100.*sin(2 .* pi .* 200 .* t);
x3 = 100.*sin(2 .* pi .* 300 .* t);
% Contaminated signal
xn = x + x1 + x2 + x3;
% Frequency analysis
f = 0 : fs/noSamples : fs - fs/noSamples; % Frequency vector
% FFT
x_fft = abs(fft(x));
xn_fft = abs(fft(xn));
% Plot
figure(1);
subplot(2,2,1);
plot(t, x);
subplot(2,2,2);
plot(t, xn);
subplot(2,2,3);
plot(f,x_fft);
xlim([0 fNy]);
subplot(2,2,4);
plot(f,xn_fft);
xlim([0 fNy]);

sound(xn, 44000);