function [Y, f] = spektrum(y, Fs)
% berechnet das Spektrum der Zeitreihe y (bei gegebener Samplerate fS)
% gibt die Spektralfunktion Y und die zugehörigen Frequenzwerte f zurück

N = length(y);
T = N/Fs;            % Zeitdauer von y
X = fft(y);
Y = abs(X(1:floor(N/2)))/N;
f = (0:(N/2)-1)/T;