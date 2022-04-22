e = exp(1);
o = [0:0.0001:6*pi];
r = 2*e.^(0.2.*o);

%Spirale Koordinaten
x = r .* cos(o);
y = r .* sin(o);

%gepunktete Linie Bauen:
lx = [((2*e.^(0.2.*4*pi)) * cos(4*pi)), ((2*e.^(0.2.*6*pi)) * cos(6*pi))];
ly = [((2*e.^(0.2.*4*pi)) * sin(4*pi)), ((2*e.^(0.2.*6*pi)) * sin(6*pi))];

figure;
plot(x, y);
hold on;
plot(lx,ly,"LineStyle",":")
xlim([-100 100]);
ylim([-100 100]);
saveas(gcf, "spirale.png")