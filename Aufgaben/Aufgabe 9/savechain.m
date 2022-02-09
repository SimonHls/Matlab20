function savechain(chain, filename)
% speichert Daten eines chain Objektes als .chain Datei
% Parameter:
%    chain-objekt
%    filename    Name der Datei (ohne Suffix)

fid = fopen(filename + ".chain", "w");

% Parameter aus chain Objekt auslesen
m = chain.m;
c = chain.c;
y = chain.y;

% N enspricht der Anzahl der Elemente in m (oder y)
N = max(size(m));

% N
fprintf(fid, "%% N\n");
fprintf(fid, " %d", N);
% m
fprintf(fid, "\n%% m\n");
fprintf(fid, " %f", m);
% c
fprintf(fid, "\n%% c\n");
fprintf(fid, " %f", c);
% y
fprintf(fid, "\n%% y\n");
fprintf(fid, " %f", y);

fclose(fid);

disp("Datei '" + filename + ".chain' angelegt.");
