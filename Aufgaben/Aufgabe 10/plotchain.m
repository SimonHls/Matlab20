function plotchain(axes, chain)
%{ 
zeichnet die gegebene Schwingerkette Chain mit den Argumenten 
axes = ausgewähltes Achsensystem
N = Anzahl der Schwinger
m = Massen der Schwinger 
c = Federkonstanten der Federn zwischen den Schwingern
Y Positionen der Schwinger
%}

% Übernahme der chain Variablen
n = chain.N;
y = chain.y(1,:);

% Erstellen einer Matrix für alle x Werte, inklusive der Befestigungen x=0
x = 0:1:chain.N+1;

%Erstellen einer Matrix für alle y Werte, inkl. die der Befefestigungswerte y=0
%durch Übertragen der y Werte. 

y2 = zeros(1,size(chain.y,2)+2); %es werden zwei weitere Werte benötigt
for k=1:size((chain.y),2)
    y2(1,k+1)=y(1,k);
end

% Zeichnen der Knoten und Verbindungen in Rot
plot(axes, x, y2, "r-");
axis(axes, [-1 n+2 -1 1]);
set(axes, "XTick", [], "YTick", []);
hold on;

% markiere ersten und letzten Knoten als fixen Knoten und male ein graues Rechteck darum
plotrectangle(axes, x(1), y2(1));
plotrectangle(axes, x(n+2), y2(n+2));
hold(axes, "off")

% Kreise um Schwinger zeichnen: Startwert 

for  i=1:size((chain.y),2)
plotcircle (axes, x(1,i+1), y2(1,i+1))
end

% Achsensystem quadratisch machen
axis(axes, "equal")

%--------------------------------------------------------------------
function plotrectangle (axes,x0,y0)
%{
Zeichnet ein kleines graues Rechteck zur Befestigung
Argumente:
    axes: Aktuelles Bild
    x0: x Wert Mittelpunkt
    y0: Y Wert Mittelpunkt
 %}
width = 0.1;
height = 0.4;

rectangle(axes,"Position", [x0-width/2 y0-height/2 width height],...
               "FaceColor",[0.00,0.00,0.00]);

function plotcircle (axes, x0, y0)
%{
Zeichnet einen Kreis mit Randung
Argumente:
    axes: Aktuelles Bild
    x0: x Wert Mittelpunkt
    y0: Y Wert Mittelpunkt
 %}

d = double(0.5); %Durchmesser
f1 = [0.00,0.00,1.00]; %Füllfarbe Blau
f2 = [0.00,0.00,0.00]; %Linienfarbe Schwarz
l = 2;  %Liniendicke

r= rectangle(axes,"Position", [x0-d/2, y0-d/2, d, d], "FaceColor",...
    f1,"EdgeColor",f2, "LineWidth",l);
r.Curvature = (1); % Curvature,1 = Vollkreis




