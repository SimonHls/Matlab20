%Script für Aufgabe 3
%zur Darstellung der Strömungsgeschwindigkeiten in Abstand zum
%Rohrmittelpunkt r
%
%Benötigt werden: 
%stroemung.m
%rw6.m
%rw7.m
%rw8.m
%rw9.m
%
%Ziel: Plotten einer Funktion sowie Darstellung der mittleren
%Stömungsgeschwindigkeiten
%
%
r0 = 5;
r=[0:0.1:r0];
n=6;
grid();
hold on;


s6= stroemung(r,n);
n=7;
s7= stroemung(r,n);
n=8;
s8= stroemung(r,n);
n=9;
s9= stroemung(r,n);
plot(r,s6,r,s7,r,s8,r,s9);
%legend("n=6","n=7","n=8","n=9");

ylabel("Strömungsgeschwindigkeit [cm/sek]");
xlabel("Abstand vom Rohrmittelpunkt [cm]");
title("Geschwindigkeit einer Rohrströmung");


%Durchschnittsgeschwindigkeit berechnen:

wquer6 = 2/r0^2 * integral(@rw6,0,r0);
wquer7 = 2/r0^2 * integral(@rw7,0,r0);
wquer8 = 2/r0^2 * integral(@rw8,0,r0);
wquer9 = 2/r0^2 * integral(@rw9,0,r0);

plot(r,wquer6,r,wquer7,r,wquer8,r,wquer9);
