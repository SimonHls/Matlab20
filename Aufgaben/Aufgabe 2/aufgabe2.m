%

messwerte=([6.99 10.25 25.00 29.03 41.40 49.73 53.23 64.52 70.97 95.7; 4.202 4.184 4.17 4.173 4.173 4.173 4.177 4.187 4.189 4.209]);

temperatur=messwerte(1,:);
kapazitaet=messwerte(2,:);
save datenaufgabe2.mat;


load datenaufgabe2.mat;
hold on;
p1 = polyfit(temperatur,kapazitaet,1);
p2 = polyfit(temperatur,kapazitaet,2);
p3 = polyfit(temperatur,kapazitaet,3);
p4 = polyfit(temperatur,kapazitaet,4);
p5 = polyfit(temperatur,kapazitaet,5);

x = linspace(-10,110,121);

y1=polyval(p1,x);
y2=polyval(p2,x);
y3=polyval(p3,x);
y4=polyval(p4,x);
y5=polyval(p5,x);

plot(temperatur,kapazitaet,x,y1,x,y2,x,y3,x,y4);
legend("Messwerte", "Funktion 1. Grades", "Funktion 2. Grades", "Funktion 2. Grades", "Funktion 3. Grades", "Funktion 4. Grades", "location", "best");

