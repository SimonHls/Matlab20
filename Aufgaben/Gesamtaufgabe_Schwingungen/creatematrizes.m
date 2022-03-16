function [M,C] = creatematrizes(chain)
    %{
    Ja, das ist falsch geschrieben. Egal.
    Funktion zur Erstellung zweier Matrizen zur späteren Lösung der DGL: 
    1) Massenmatrix M
    2) Steifigkeitsmatrix C
    
    Parameter:
     m = Vektor mit dem eingesetzen Massen
     c = Vektor mit den eingesetzten Federsteifigkeiten (Anzahl Masse + 1)
    
    
    
    !! Wenn offene Schwingerkette: letzte Masse hat nur eine Feder!!!
    -> einbauen!!
    %}
    clc; clear all;
    
    chain.N =4;
    chain.m = [1,2,2,1];
    chain.c = [2,13,1,2,1];
    chain.y = [0.8,0,2,3];
    
    N = length(chain.m);
    M = diag(chain.m);
    
    for k=1:1:N
        chelp(1,k)=chain.c(k)+ chain.c(k+1);
    end
    
    C1 = diag(chelp);
    C2 = diag(-1.*chain.c(2:N),1);
    C3 = diag(-1.*chain.c(2:N),-1);
    C = C1+C2+C3;
