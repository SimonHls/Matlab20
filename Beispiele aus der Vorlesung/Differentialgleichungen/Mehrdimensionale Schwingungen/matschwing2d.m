function dy = matschwing2d(t, y, M, C)
% rechte Seite der DGL bei zweidimensionaler Schwingerkette

x = y(1:2);
v = y(3:4);
dx = v;
dv = -inv(M)*C*x;
dy = [dx; dv];