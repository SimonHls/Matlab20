function dy = laminar(t,y,m,g,b1,b2)
% rechte Seite der DGL bei laminarem freien Fall
% Parameter

Fr = -b1*y(2);

dy1 = y(2);
dy2 = -g+Fr./m;
dy = [dy1; dy2];