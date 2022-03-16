%{
Script für Aufgabe 8 - 10, 12, 13 und 14 zum Schreiben einer Schwingerkette mit einer Chainstruktur

Aufgaben 8 - 10: Erstellen, Speichern, Laden, Plotten der Chain Struktur
Aufgabe 12: Erstellen der Massen- und Steifigkeitsmatrizen
Aufgabe 13: Plotten der DGL - Subplot
Aufgabe 14: Bestimmen der Eigenfrequenzen

Hinweis:
Die Funktionen (z.B. Plotchain) wurden im Laufe der Zeit überarbeitet und dem Ziellayout
angepasst.

Parameter:

chain = Struktur zum Speichern der Felder
    N = Anzahl der zu schwingenden Massen
    m = Massen der einzelnen Schwinger
    c = Federsteifigkeiten der einzelnen Schwinger
    y = Anfangsauslenkungen als Abstand von der Nullachse
    filename = Name der Datei

    axes = Achsensystem
%}
clear all; clc; close all;


% Chain Struktur erstellen (auch über createchain möglich, doch die
% Erstellung soll zentralisiert stattfinden //Aufgaben 8 + 9 + 10

chain.N =4;
chain.m = [1,2,2,1];
chain.c = [2,13,1,2,1];
chain.y = [0.8,0,2,3];

filename = "4Glied";
figure("Name",filename);
set(gcf, 'units','normalized','position',[0.55 0.1 0.4 0.8]); %Position [Left,bottom,width,height]
bild1 = gca();

savechain(chain,filename);
loadchain(filename);
plotchain(bild1,chain);

% C und M zur Lösung der DGL bestimmen und mit den Anfangswerten lösen //
% Aufgabe 12
[M,C] = creatematrizes(chain);
chain.M = M;
chain.C = C;
x0 = 0; tEnd = 30; tStep=(x0-tEnd)/10;
[t, x] = solveVibrationODE(M, C, chain.y, tEnd, tStep);
chain.t = t;
chain.x = x;

%Lösung der DGL nach vorgegebenen Layout plotten // Aufgabe 13
index = [1,4];
plotODESolutions(axes,chain.t,chain.x, index); 
saveas (gcf, filename + ".png");

%while Schleife für den Fall, dass ein Wert von index > Anzahl Massen ist
%oder die Anzahl zu groß ist


%Eigenschwingungen der Schwingerkette berechnen //Aufgabe 14
nr = [1,2,3,4];
f = computeFrequency(chain, nr)

%{
% Zweites Figure erstellen mit einer anderen Benennung
% Die Figures können nacheinander erstellt werden. Dieser Teil ist eine
% Wiederholung des obrigen Teils

chain.N =6;
chain.m = [1,2,2,1,1,0];
chain.c = [2,13,1,2,1,1,0];
chain.y = [0.8,0,2,3,0,0];

graphname = "eigvalues";
figure("Name",graphname);
set(gcf, 'units','normalized','position',[0.525 0.25 0.45 0.45]);
bild2=gca();

%chain = createchain()
savechain(chain,filename);
loadchain(filename);
plotchain(bild2,chain);
saveas (gcf, filename + ".png");
%}