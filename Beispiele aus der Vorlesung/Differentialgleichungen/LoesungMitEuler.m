% Lösung der DGl1 mit Euler

lambda = 0.1;   % Zerfallskonstante
N0 = 10000;     % Anfangsmenge

h = 0.1;        % Schrittweite
n = 0:1000;
t = h*n;

N = N0*(1 - lambda*h).^n;

plot(t, N);