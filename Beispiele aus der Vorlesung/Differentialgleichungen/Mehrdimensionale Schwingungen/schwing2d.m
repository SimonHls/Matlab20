function dy = schwing2d(t, y)
% rechte Seite der DGL bei zweidimensionaler Schwingerkette

% Parameter
m1 = 1.0;
m2 = 1.0;
c1 = 4.0;
c2 = 0.6;
c3 = 4.0;

dy1 = y(3);
dy2 = y(4);
dy3 = (1/m1)*(-(c1+c2)*y(1) + c2*y(2));
dy4 = (1/m2)*(c2*y(1) - (c2+c3)*y(2));

dy = [dy1; dy2; dy3; dy4]; %SPALTENVEKTOR!!!