function dy = erzwungen(t, y)
% Beispiel 3
% rechte Seite des DGL bei erzwungener Schwingung

% Parameter
m = 1.0;
b = 0.3;
c = 1.0;
A = 1.0;
omega = 1.0;

dy1 = y(2);
dy2 = (1/m)*(A*cos(omega*t) - b*y(2) - c*y(1));
dy = [dy1; dy2]; % SPALTENVEKTOR