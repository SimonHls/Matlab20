function dy = turbulent(t, y)
% Laminare Reibung 
% Rechte Seite des DGLs für laminare Reibung

b2 = 0.1;

dy = -b2 * y^2 * sign(y);

end