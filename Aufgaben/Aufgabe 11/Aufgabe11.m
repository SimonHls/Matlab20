%{ 
Script für Aufgabe 11 zum Lösen von Differenzialgleichungen

%}

clc; clear all;

m = 75;
g = 9.81;
b1 = 5;
b2= 0.1;

y0=[5000,10];
tspan= [0 50];

% Functionhandle und Funktion zum Lösen der DGL einsetzen
% 1. Laminare Strömung

laminarfunc = @(t,y) laminar(t,y, m,g,b1,b2); 
[t1,y] = ode45(laminarfunc,tspan,y0);
x1=y(:,1);
v1=y(:,2);

% 2. Turbulente Strömung

turbulentfunc = @(t,y) turbulent(t,y,m,g,b1,b2);
[t2,y] = ode45(turbulentfunc,tspan,y0);
x2=y(:,1);
v2=y(:,2);

%Funktion Freier Fall anzeigen lassen
t=tspan(1):0.1:tspan(2); 
f3=freierfall(y0,g,t);
x3= f3(1,:);
v3= f3(2,:);


% Orte und Geschwindigkeiten in 2 untereinander liegenden Graphen plotten


subplot(2,1,1); % 2 Zeilen, 1 Spalte, GraphNr1
plot(t1,x1,t2,x2,t,x3);
title("Bahn bei freiem Fall mit Reibung");
xlabel("Zeit in sek");
ylabel("Höhe in Meter");
legend("Laminare Strömung","Turbulente Strömung","Freier Fall ohne Reibung","location","best");


subplot(2,1,2); % 2 Zeilen, 1 Spalte, GraphNr2
plot(t1,v1,t2,v2,t,v3);
title("Geschwindigkeit bei freiem Fall mit Reibung");
xlabel("Zeit in sek");
ylabel("Geschwindigkeit in m/sek");
legend("Laminare Strömung","Turbulente Strömung","Freier Fall ohne Reibung","location", "best");






