function dy = radiokette(t, y)
% Beispiel 2
% rechte Seite des DGL für Radiokette

lambda1 = 0.1;
lambda2 = 0.03;

dy1 = -lambda1*y(1);
dy2 = -lambda2*y(2) + lambda1*y(1);

dy = [dy1; dy2];     % MUSS EIN SPALTENVEKTOR SEIN (Semikolon statt Komma)!


end