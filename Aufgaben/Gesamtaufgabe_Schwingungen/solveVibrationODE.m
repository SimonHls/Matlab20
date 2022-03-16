function [t,y] = solveVibrationODE(M, C, x0, tEnd, tStep)
    %{ 
    
    löst die (Nx2)- dimensionale Schwingungs-DGL für das Zeitintervall [0 tEnd]
    Parameter
     M       Massenmatrix (2N x 2N)
     C       Steifigkeitsmatrix (2N x 2N)
     x0      Anfangsauslenkungen (2 x N)
     v0      Anfangsgeschwindigkeiten (2 x N)
     tEnd    Endzeit
    
     Ergebniswerte:
     t       Zeitwerte (NT-Vektor, vom Solver bestimmt)
     d       Auslenkungen (NT x 2 x N)
     v       Geschwindigkeiten (NT x 2 x N)
    
    %}
    N = length(x0);
    v0=zeros(N,1);
    tspan=[0,tEnd];
    y0=[x0,v0'];
    
    myfunc = @(t, y) vibrationODE(t, y, M, C);
    [t, y] = ode45(myfunc,tspan,y0);
    
    
    %{
    %pflücke den Ergebnisvektor auseinander
    NT = length(t);
    d = y(:, 1:(2*N));
    v = y(:, (2*N+1):end);
    % und ordne ihn um
    d = reshape(d, NT, 2, N);
    v = reshape(v, NT, 2, N);
    %}
    
    
    
    
    function dy = vibrationODE(t, y, M, C)
    % Zustandsform der Schwingungsgleichung
    %   M x'' + C x = 0
    % Dabei ist
    %   y = [x; v]
    
    N = length(y)/2;
    x = y(1:N);
    v = y(N+1:end);
    
    dy = [v; -inv(M)*C*x];
    
    
    
    
    
    
    