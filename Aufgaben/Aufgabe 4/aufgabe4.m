%aufgabe4

%zur Darstellung eines Kolbenkreisprozesses
%auf Basis der gegebenen Daten ex04.dat


load ex04.dat;
V = ex04(:,1);
pu= ex04(:,2);
po=ex04(:,3);

plot(V,pu,V,po);
xlabel("Volumen[cm³]");
ylabel("Druck [bar]");
title("Darstellung eines Kolbenkreisprozesses");


%Berechnung der Leistung bei n=3000 Umdrehungen pro Minute in [kW]
%Lösung passt noch nicht ganz, Ziel = 87KW
% Ursache: Umrechnung der EInheiten in KW
%
n=3000/3.6;

w1=trapz(V,po);
w2=trapz(V,pu);

wges=w1-w2;
p=wges*n/1000/10


