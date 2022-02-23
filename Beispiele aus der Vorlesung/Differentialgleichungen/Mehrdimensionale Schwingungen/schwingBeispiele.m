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


%% 3D-Schwinger 
% Matrixwerte
m1 = 6.0e3; m2 = 6.0e3; m3 = 1.0e3;
c1 = 3.0e6; c2 = 3.0e6; c3 = 1.0e6;
M = diag([m1 m2 m3]); % M ist die Diagonalmatrix der Massen
C = [c1 + c2, -c2, 0; -c2, c2 + c3, -c3; 0, -c3, c3]; % Steifigkeitsmatrix

% Anfangsbedingungen
x0 = zeros(3,1);
v0 = [0; 0; 10];
y0 =  [x0; v0];

% DGL lösen
tEnd = 2;
%Benutzt schwingNd für N-Dimansionale Schwingerkette
myfunc = @(t, y) schwingNd(t, y, M, C); 
[t, y] = ode45(myfunc, [0 tEnd], y0);

% Ergebnis plotten
plot(t, y(:,1), t, y(:,2), t, y(:,3));
legend("x_1", "x_2", "x_3", "Location", "best");

F = getframe(gcf);
imwrite(F.cdata, "bild26.png");