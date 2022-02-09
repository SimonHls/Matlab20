function savechain(m, c, y, filename)
% speichert Daten einer Kette als .chain Datei
% Parameter:
%    m       Masse
%    c       Federsteifigkeit
%    y       Anfangsauslenkung
%    filename    Name der Datei (ohne Suffix)

fid = fopen(filename + ".chain", "w");

% N enspricht der Anzahl der Elemente in m 
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