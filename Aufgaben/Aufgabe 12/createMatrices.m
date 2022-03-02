function [M, C] = createMatrices(chain)
% Erstellt die Matrizen aus M und C aus einem chain-Objekt
% Parameter:
%       chain-Objekt

% m und c als vektoren aus Chain-Objekt importieren
m = chain.m;
c = chain.c;

% M ist einfach eine Diagonalmatrix aus m
M = diag(m);

% C-Matrix erstellen, ist immer quadrat. Matrix mit Dim. c-1 x c-1
C = zeros(length(c) - 1);

% Werte c aus dem chain-objekt in C-matrix einfügen:

% Diagonale Werte einfügen
for k = 1:length(c)-1
    C(k,k) = c(k) + c(k + 1);
end

% Werte oberhalb und unterhalb der Diagonalen einfügen
for l = 1:length(c)-2
    C(l,l+1) = -c(l+1);
    C(l+1,l) = -c(l+1);
end

