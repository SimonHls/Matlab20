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

% Format specifier zum einlesen für fscanf
% FRAGE: WIE FUNKTIONIEREN DIE GENAU?
formatSpec = "%f\n";

fid = fopen(filename + ".chain", "r");

% 1. Zeile überspringen
fgetl(fid);

% 2. Zeile ist N
N = fscanf(fid, formatSpec);

% 3. Zeile überspringen
fgetl(fid);

% 4. Zeile ist m, Anzahl der Zeichen ist N
m = fscanf(fid, formatSpec, [1, N]);

% 5. Zeile überspringen
fgetl(fid);  

% 6. Zeile ist c, Anzahl Zeichen = N + 1
c = fscanf(fid, formatSpec, (N + 1)');

% 7. Überspringen
fgetl(fid);   

% 8. Zeile ist y, Anzahl Zeichen ist N
y = fscanf(fid, formatSpec, N);

% Datei schließen
fclose(fid);