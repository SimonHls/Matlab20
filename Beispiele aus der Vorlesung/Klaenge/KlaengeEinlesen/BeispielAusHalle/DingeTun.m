% Hier wird eine Spektralanalyse von einer simulierten Messung
% durchgeführt.

xx = load("stoerung.dat");
t = xx(:,1);
y = xx(:,2);

dt = t(2) - t(1);

Fs = 1/dt;
[Y, f] = spektrum(y, Fs);
plot(f, Y);