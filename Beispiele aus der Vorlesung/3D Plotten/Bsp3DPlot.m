function plot3DBeispiel()
% Beispiel für 3D-Plot einer Funktion
x = -3:0.1:3;
y = -5:0.1:5;

[X, Y] = meshgrid(x, y);
Z = demo2dfunc(X, Y); 

mesh(X, Y, Z)
view(-10,40)

xlabel("x","Fontsize",14);
ylabel("y","Fontsize",14);
zlabel("z","Fontsize",14);

%z-label verdrehen
hz = get(gca(), "ZLabel");
set(hz, "Rotation", 0);

%y-label verschieben
hy = get(gca(), "YLabel");
set(hy, "Position", [-10.3, -64, 20]);