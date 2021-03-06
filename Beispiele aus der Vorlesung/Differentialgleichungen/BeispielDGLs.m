% beispielDGLs
% INFO: Sektionen Bsp.1 und 2 ausführen mit Strg + Enter
%% Beispiel 1
tSpan = [0, 100];
y0 = 10000;

[t, y] = ode45(@radioaktiv, tSpan, y0);
plot(t, y, "b*");

%% Beispiel 2
tSpan = [0, 100];
y0 = [10000, 0];

[t, y] = ode45(@radiokette, tSpan, y0);
N1 = y(:,1); % Dieses Vorgehen erlaubt mehr Kontrolle über Kurven.
N2 = y(:,2); % Das in den Klammern bedeutet 1. bzw. 2. Spalte des Vektors y
plot(t, N1, "k-", t, N2, "k-."); 
legend("N_1", "N_2", "Location", "best");

%% Beispiel 3
% Das minus die Kommentare wäre die Lösung für eine Aufgabe
% "Bestimmen sie die Lösung dieser DiffGl und Plotten sie diese"

tSpan = [0, 30];
y0 = [0, 0]; % Hier Anfangs...[auslenkung, geschwindigkeit]

[t, y] = ode45(@erzwungen, tSpan, y0);
x = y(:,1);
v = y(:,2);

%plot(t, x, t, v);
%legend("x", "v", "Location", "best");

plot(t,x);

%% Beispiel 4

tSpan = [0, 30];
y0 = [0, 0]; % Hier Anfangs...[auslenkung, geschwindigkeit]

% Parameter
m = 1.0;
b = 0.3;
c = 3.0;
A = 1.0;
omega = 1.0;

myfunc = @(t,y) erzwungenP(t,y,m,b,c,A,omega);
[t1, y] = ode45(myfunc, tSpan, y0);
x1 = y(:,1);
v1 = y(:,2);

m = 0.8;
myfunc = @(t,y) erzwungenP(t,y,m,b,c,A,omega);
[t2, y] = ode45(myfunc, tSpan, y0);
x2 = y(:,1);
v2 = y(:,2);

subplot(2,1,1);
plot(t1,x1, t2, x2);
legend("x_1", "x_2", "Location", "best");

subplot(2,1,2);
plot(t1,v1, t2, v2);
legend("x_1", "x_2", "Location", "best");
