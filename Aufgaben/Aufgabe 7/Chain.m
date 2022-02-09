classdef Chain
% Chain objekt mit folgenden Parametern:
%   m       Masse
%   c       Federsteifigkeit
%   y       Anfangsauslenkung

    properties
        m
        c
        y
    end
    
    methods
        % Constructor
        function ch = Chain(m, c, y)
            if nargin > 0
                ch.m = m;
                ch.c = c;
                ch.y = y;
            end
        end

        % Setter (Weiß nicht ob MatLab sowas braucht, 
        % für die Aufgabe an sich auf jeden Fall nicht.)
        function obj = set.m(obj, m)
            obj.m = m;
        end
        function obj = set.c(obj, c)
            obj.c = c;
        end
        function obj = set.y(obj, y)
            obj.y = y;
        end

    end

end
