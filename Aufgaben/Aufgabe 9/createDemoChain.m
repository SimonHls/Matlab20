function createDemoChain()
% Hilfsfunktion, die die Datei demochain erzeugt.
% Nachkommastellen sind nicht wie in Vorlage. Egal?

m = [1, 2, 2, 1];
c = [2, 1, 3, 1, 2];
y = [0.8, 0, 0, 0];

fid = fopen("demo.chain", "w");

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

disp("Beispieldatei 'demo.chain' erzeugt.");