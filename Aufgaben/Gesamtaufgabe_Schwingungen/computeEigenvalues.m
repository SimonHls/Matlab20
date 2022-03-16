function [Phi, freq] = computeEigenvalues(M, C)
    % berechnet die Eigenfrequenzen freq(i) und Eigenvektoren Phi(:,i)
    % Eigenvektoren sind auf Länge 1 normiert
    % Parameter
    %    M     Massenmatrix
    %    C     Steifigkeitsmatrix
    
    [Phi, om2] = eig(C,M);
    freq = sqrt(diag(om2))/(2*pi);
    
    % Eigenvektoren auf Länge 1 normieren
    norms = sqrt(diag(Phi'*Phi));
    Phi = Phi*diag(1./norms);