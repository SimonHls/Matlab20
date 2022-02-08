function [m, c, y] = loadchain(filename)
% Lädt Parameter aus einer .chain Datei
% Parameter:
%   filename      Name der .chain Datei im Verzeichnis
%                 ohne Suffix
% Ergebinswerte:
%   m             Massen
%   c             Federsteifigkeit
%   y             Anfangsauslenkung

%ACHTUNG! FUNKTIONIERT NICHT MIT LONG.CHAIN!!! Weiß nicht wieso

clc; 

fid = fopen(filename + ".chain", "r");

% 1. Zeile überspringen
disp("suche N");
fgetl(fid);

% 2. Zeile ist N, auslesen als float (%f)
N = fscanf(fid, "%d");

% 3. Zeile überspringen
disp("suche m");
fgetl(fid);        

% 4. Zeile ist m, Anzahl der Zeichen ist N
m = fscanf(fid, "%f", [1, N]);

% 5. Zeile überspringen
disp("suche c");
fgetl(fid)    

% 6. Zeile ist c, Anzahl Zeichen = N + 1
c = fscanf(fid, "%f", [1, N + 1]);

% 7. Überspringen
disp("suche y");
fgetl(fid)     

% 8. Zeile ist y, Anzahl Zeichen ist N
y = fscanf(fid, "%f", [1, N]);

% Datei schließen
fclose(fid);