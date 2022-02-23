%{ 
Script für Aufgabe 11 zum Lösen von Differenzialgleichungen

%}

m = 75;
g = 9.81;
b1 = 5;
b2= 0.1;

y0=[5000,0];
tspan= [0 100];

laminarfunc = @(t, y) laminar(t, y, m , g, b1, b2);
[t,y] = ode45(laminarfunc,tspan,y0);

x=y(:,1);
v=y(:,2);

laminarfunc = @(t, y) laminar(t, y, m , g, b1, b2);
[t,y] = ode45(laminarfunc,tspan,y0);

subplot(2,1,1);
plot(t,x);
title("Bahn bei freiem Fall mit Reibung");
subplot(2,1,2);
plot(t,v);
title("Geschwindigkeit bei freiem Fall mit Reibung");