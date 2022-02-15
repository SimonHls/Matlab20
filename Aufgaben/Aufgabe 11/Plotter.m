% Plotter für A.11

tSpan = [0, 70];
x0 = [0, 5000];

[t, y] = ode45(@reibung, tSpan, x0);
plot(t, y);