function dy = erzwungen(t, y, m , b, c, A, omega)
% Beispiel 4
% rechte Seite des DGL bei erzwungener Schwingung
% Parameter:
% ...

dy1 = y(2);
dy2 = (1/m)*(A*cos(omega*t) - b*y(2) - c*y(1));
dy = [dy1; dy2]; % SPALTENVEKTOR