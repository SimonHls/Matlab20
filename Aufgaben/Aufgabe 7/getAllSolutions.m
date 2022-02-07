function arr = getAllSolutions(eqn, x, rng, iterations)
% Findet alle Lösungen für eine Gleichung mit einer Unbekannten eqnin 
% im Interval rngin. Je höher die Eingabe für iterations, desto
% wahrscheinlicher ist es, alles Lösungen im Interval zu finden.
%
% Parameter:
%   eqn         Eingabegleichung
%   x           Variable
%   rng         Interval für die Lösungssuche
%   iterations  Gibt an, wie oft die Gleichung durchsucht werden soll

%solutions speichert alle gefundenen Lösungen
solutions = zeros(iterations);

% Für jeden 1 bis iterations wird eine zufällige Lösung im Intervall
% gespeichert
for k = 1:iterations
    cs = vpasolve(eqn,x,[0 10],'Random',true);
    solutions(k) = cs;
end

% Am Ende werden alle Duplikate im Lösungsvektor entfernt
arr = unique(solutions);