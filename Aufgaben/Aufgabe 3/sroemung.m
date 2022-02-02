function stroemung = w(r, n)
    % Geschwindigkeit der Rohrströmung 
    % Parameter
    %   r   Abstand von der Mittelaachse in Metern
    %   n   Parameter der Formel
    % Ergebnis
    %   y   Geschwindigkeit in m/s
    
    wmax = 2.5;
    r0 = 0.05;
    
    stroemung= wmax*(1-r/r0).^(1/n);