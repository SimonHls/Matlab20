function dy = schwingNd(t, y, M, C)
% rechte Seite der DGL bei N-dimensionaler Schwingerkette

N = length(y)/2; % Zahl der Massen
x = y(1:N); % Erste Hälfte des Vektors y
v = y((N+1):(2*N)); % Zweite Hälfte des Vektors y

dx = v;
dv = -inv(M)*C*x;

dy = [dx; dv];