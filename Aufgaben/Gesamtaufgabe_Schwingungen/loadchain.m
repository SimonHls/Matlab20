function [N, m, c, y] = loadchain(filename)
% Lädt Parameter aus einer .chain Datei
% Parameter:
%   filename      Name der .chain Datei im Verzeichnis
%                 ohne Suffix
% Ergebinswerte:
%   m             Massen
%   c             Federsteifigkeit
%   y             Anfangsauslenkung

clc; 

fid = fopen(filename + ".chain", "r");

% 1. Zeile überspringen
fgetl(fid);

% 2. Zeile ist N, auslesen als float (%f)
N = fscanf(fid, "%f");

% 3. Zeile überspringen
fgetl(fid);        

% 4. Zeile ist m, Anzahl der Zeichen ist N
m = fscanf(fid, "%f", [1, N]);

% 5. Zeile überspringen
fgetl(fid);      

% 6. Zeile ist c, Anzahl Zeichen = N + 1
c = fscanf(fid, "%f", [1, N + 1]);

% 7. Überspringen
fgetl(fid);      

% 8. Zeile ist y, Anzahl Zeichen ist N
y = fscanf(fid, "%f", [1, N]);

% Datei schließen
fclose(fid);