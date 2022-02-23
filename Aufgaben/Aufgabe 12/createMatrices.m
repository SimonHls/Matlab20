function [M, C] = createMatrices(chain)
% Erstellt die Matrizen aus M und C aus einem chain-Objekt
% Parameter:
%       chain-Objekt

% m und c als vektoren aus Chain-Objekt importieren
m = chain.m;
c = chain.c;

M = diag(m);

clength = length(c);
C = zeros(clength - 1);

% Pfusch-Lösung, soll das auch allgemein gehen? Wenn nicht:
C(1,1) = c(1) + c(2);
C(1,2) = -c(2);
C(2,1) = -c(2);
C(2,2) = c(2) + c(3);
C(2,3) = -c(3);
C(3,2) = -c(3);
C(3,3) = c(3) + c(4);
C(3,4) = -c(4);
C(4,3) = -c(4);
C(4,4) = c(4) + c(5);

%ALLGEMEINE LÖSUNG MACHEN!
% muss nur die diagonale und die beiden angrenzenden diagonalen füllen, das
% eZ it schleife, sonst mal gucken wie ohne





