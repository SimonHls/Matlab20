function dy = reibung(t, y)

b1 = 5;
b2 = 0.1;

dy1 = -b1*y(1);
dy2 = -b2*y(2)^2*sign(y(2));

dy = [dy1; dy2];