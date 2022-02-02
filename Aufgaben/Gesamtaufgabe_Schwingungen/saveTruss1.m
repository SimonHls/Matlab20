function saveTruss1(x0, A, N, m, c, filename)
    % speichert Daten eines Fachwerks
    % Parameter:
    %    x0        Gleichgewichtskoordinaten aller Punkte
    %    A         Verbindungsmatrix (symmetrisch, auf der Diagonalen 0)
    %    N         Zahl der beweglichen Massen
    %    m         Größe einer Masse
    %    c         Steifigkeit eines Balkens
    %    filename  Name der Datei (ohne Endung .truss)
    
    fid = fopen(filename + ".truss", "w");
    
    fprintf(fid, "%% x0\n");
    fprintf(fid, "%d %d\n", size(x0));
    fprintf(fid, " %7.4f", x0);
    fprintf(fid, "\n%% A\n");
    fprintf(fid, "%d %d\n", size(A));
    fprintf(fid, " %1d", A);
    fprintf(fid, "\n%% N\n");
    fprintf(fid, "%d", N);
    fprintf(fid, "\n%% m\n");
    fprintf(fid, "%f", m);
    fprintf(fid, "\n%% c\n");
    fprintf(fid, "%f\n", c);
    
    fclose(fid);
