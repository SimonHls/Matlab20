function Aufgabe7()
% Definiert die Gleichung und übergib diese an getAllSolutions
% Es ist möglich, dass bei zu wenig Durchläufen nicht alle Lösungen
% gefunden werden.

%ACHTUNG:Lösung geht nicht an Hochschul-Rechnern, da die Toolbox fehlt.

clear all, clc

% Symbol x deklarieren. (Funktioniert nur mit Symbolic Math Toolbox) 
syms x;

% Performance erhöhen durch weniger Stellen (1.6s vs 2.3s Laufzeit)
digits(6);

% Gleichung 
eqn = x.*log(0.1.*x) == tan(x);

%Lösung in solution speichern und ausgeben.
solution = getAllSolutions(eqn, x, [0,10], 10);
disp('Gefundene Lösungen: ');
disp(solution);

% Stellen zurücksetzen
digits(32);