function arr = getAllSolutions(eqn, x, rng, steps)
% Findet (möglichst) alle Lösungen für eine Gleichung eqn mit einer Unbekannten x 
% im Interval rng, indem die Lösungen in Teilintervallen (steps) erfasst werden.
%
% Parameter:
%   eqn         Eingabegleichung
%   x           Unbekannte
%   rng         Interval für die Lösungssuche
%   steps       Gibt an, in wie vielen Schritten die Gleichung untersucht wird

% solutions speichert alle gefundenen Lösungen
solutions = [];

% stepwidth ist die Schrittweite durch das Intervall
stepwidth = (max(rng) - min(rng)) / steps;

% Schreitet in 'steps' Schritten durch das Intervall
for k = 1:steps

    % cs ist die Lösung, die für das aktuelle Segment [...] gefunden wurde
    cs = vpasolve(eqn,x,[min(rng) + stepwidth * k - stepwidth, min(rng) + stepwidth * k]);

    % Testet, ob eine Lösung für das Segment gefunden wurde, wenn ja wird
    % diese an den Lösungsvektor 'solutions' angehängt
    if ~isempty(cs) && isreal(cs) 
        disp(cs);
        solutions(length(solutions)+1) = cs;
    end

end

% Am Ende werden alle Duplikate im Lösungsvektor entfernt und die Lösung
% ausgegeben
arr = unique(solutions);