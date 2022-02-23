% mehrdimensionale DGL Beispiele

%% 2D-Schwinger, direkt
[t, y] = ode45(@schwing2d, [0 30], [1 0 0 0]);
plot(t, y(:,1), t, y(:,2))
legend("x_1(t)", "x_2(t)", "Location", "best");

%% 2D-Schwinger, Matrixform

% Parameter
m1 = 1.0;
m2 = 1.0;
c1 = 4.0;
c2 = 0.6;
c3 = 4.0;

% Matrizen erstellen
M = [m1, 0; 0, m2];
C = [c1+c2, -c2; -c2, c2+c3];

% Die Funktion Matschwing2d braucht 4 Variablen, ode45 erwartet aber2,
% daher:
fhilf = @(t,y) matschwing2d(t, y, M, C);

[t, y] = ode45(@schwing2d, [0 30], [1 0 0 0]);
plot(t, y(:,1), t, y(:,2))
legend("x_1(t)", "x_2(t)", "Location", "best");