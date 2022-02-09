% UNNÖTIG! Loadchain und savechain funktionieren auch so.
% Bleibt nur drinnen, falls Klassen ml vorkommen.

classdef Chain
% Chain-Objekt mit folgenden Parametern:
%   m       Masse
%   c       Federsteifigkeit
%   y       Anfangsauslenkung

% FIY: Objekte erzeugt man mit 'name' = Chain(m, c, y)
% Zugriff auf Parameter dann z.B. c = 'name'.c

    properties
        m;
        c;
        y;
    end

    methods

        % Constructor gibt Eingabemaske vor
        function ch = Chain(m, c, y)

            % nargin = Anzahl der übergebenen Parameter
            if nargin > 0
                ch.m = m;
                ch.c = c;
                ch.y = y;
            end

        end

        % Man kann auch mit gettern und settern Datenzugriff
        % steuern. Dafür function obj = set.m(obj, m) etc.
        % weiß aber nicht genau wie das geht...

    end

end
