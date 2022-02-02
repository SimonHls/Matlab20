function [x0, A, N, m, c] = loadTruss1(filename)
    % lädt Daten eines Fachwerks
    % Parameter:
    %    filename  Name der Datei (ohne Endung .truss)
    % Ergebniswerte:
    %    x0        Gleichgewichtskoordinaten aller Punkte
    %    A         Verbindungsmatrix (symmetrisch, auf der Diagonalen 0)
    %    N         Zahl der beweglichen Massen
    %    m         Größe einer Masse
    %    c         Steifigkeit eines Balkens
    
    fid = fopen(filename + ".truss", "r");
    
    fgetl(fid);
    dims = fscanf(fid, "%d %d\n", 2);
    x0 = fscanf(fid, "%f", dims');
    fgetl(fid);         % holt das \n von der x0-Zeile
    
    fgetl(fid);
    dims = fscanf(fid, "%d %d\n", 2);
    A = fscanf(fid, "%f", dims');
    fgetl(fid);    % holt das \n von der A-Zeile
    
    fgetl(fid);
    N = fscanf(fid, "%d\n", 1);
    
    fgetl(fid);
    m = fscanf(fid, "%f\n", 1);
    
    fgetl(fid);
    c = fscanf(fid, "%f\n", 1);
    
    fclose(fid);