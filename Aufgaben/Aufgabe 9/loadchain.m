function chain = loadchain(filename)
% Lädt Parameter aus einer .chain Datei
% Parameter:
%   filename      Name der .chain Datei im Verzeichnis
%                 ohne Suffix
% Ergebinswerte:
%   chain objekt mit den Werten:
%       m       Masse
%       c       Federkonstante
%       y       Anfangsauslenkung
clc; 

% Format specifier zum einlesen für fscanf
formatSpec = "%f\n";

fid = fopen(filename + ".chain", "r");

%Falls keine Datei gefunden:
if (fid == -1)
    disp("Es wurde keine Datei mit dem Namen '" + ...
        filename + "' gefunden.");
    chain.m = [];
    chain.c = [];
    chain.y = [];
    return
end

% 1. Zeile überspringen
fgetl(fid);

% 2. Zeile ist N
N = fscanf(fid, formatSpec);

% 3. Zeile überspringen
fgetl(fid);

% 4. Zeile ist m, Anzahl der Zeichen ist N
chain.m = fscanf(fid, formatSpec, [1, N]);

% 5. Zeile überspringen
fgetl(fid);  

% 6. Zeile ist c, Anzahl Zeichen = N + 1
chain.c = fscanf(fid, formatSpec, (N + 1)');

% 7. Überspringen
fgetl(fid);   

% 8. Zeile ist y, Anzahl Zeichen ist N
chain.y = fscanf(fid, formatSpec, N);

% Datei schließen
fclose(fid);