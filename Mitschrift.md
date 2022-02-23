## Inhalt

- [Inhalt](#inhalt)
- [Spekulation](#spekulation)
- [Tipps](#tipps)
- [Funktionen und Befehle](#funktionen-und-befehle)
    - [Mit Zahlen arbeiten](#mit-zahlen-arbeiten)
    - [Eingabe und Ausgabe](#eingabe-und-ausgabe)
    - [Mit Dateien arbeiten](#mit-dateien-arbeiten)
- [Datenstrukturen](#datenstrukturen)
- [Differentialgleichungen](#differentialgleichungen)
    - [Vorgehen zum erstellen der Funktion](#vorgehen-zum-erstellen-der-funktion)
    - [Vorgehen für Lösungen:](#vorgehen-für-lösungen)
    - [Beispiele:](#beispiele)
- [Klassen](#klassen)

## Spekulation
Vermutlich wichtige Themen:
- Differentialgleichung programmieren / lösen 100%, vermutlich höherer Ordnung (keine Garantie)
- 
## Tipps

- Quadratische Matrizen vermeiden, indem man z.B. unterschiedliche Schrittweiten in der Darstellung benutzt. So bekommt man bei falscher Verwendung von einem '.' eine Fehlermeldung.
- Wann Punkt und wann nicht?
    - *Zahl hoch Vektor* **-> Punkt**

## Funktionen und Befehle

#### Mit Zahlen arbeiten
- **roots(MATRIX)** - *Löst Polynome, Eingabe ist Matrix z.B. [3, 2, 1] für 3x^2 + 2x + 1, geht auch mit höherer Ordnung. Ausgabe ist Lösung(en) der Gleichung.*
- **integral(Funktion, linkeGrenz, rechteGrenze)** - *gibt das Integral der Funktion aus. Ggf. '@' vor die Funktion schreiben.*
- **fzero(Funktion, BereichAlsMatrix oder Wert)** - *Gibt die Nullstellen im Bereich aus. Bereichsmatrix ist [linkeGrenze, rechteGrenze]. Bei mehr als einer Lösung im Bereich gibt er trotzdem nur eine Nullstelle aus. Anstatt der Bereichsmatrix kann man auch einen Wert eingeben. Dann gibt die Funktion die Nullstelle aus, die am nächsten an diesem Wert liegt.*
- **solve(gleichung, Variable zum Auflösen)** - *Für Polynomgleichungen. Eingabe ist eine Gleichung und die gewünschte Variable zur Auflösung.*
- **vpasolve(gleichung, Variable zum Auflösen, Positionoder Interval, ggf. 'Random', true)** - *Löst Gleichungen numerisch. Variable muss als "syms x;" deklariert werden. "'Random', true" gibt eine zufällige Lösung im Intervall aus, sonst wird immer die geringste Lösung ausgegeben. Für alle Lösungen im Intervall muss die Funktion mehrfach ausgeführt werden.*
  
#### Eingabe und Ausgabe
- **fprintf("Text und Zeichen", Wert1, Wert2, Wert...)** - *Druckt Werte nach Vorgabe der in den Anführungszeichen definierten Parameter*
    - \n *- nächste Zeile*
    - Matrizen gibt man normalerweise Transponiert aus (also aus A wird A')
    - %# *- Zeichen # sind Platzhalter für Werte, die nach dem Komma im fprintf-Befehl stehen.*
    - %d *- gibt ganze Zahlen aus*
    - %f *- gibt Fließkommazahl aus (f = float)*
    - %4.2f *- Hier werden für die Ausgabe vier Zeichen und 2 Nachkommastellen bereitgestellt (Also z.B. 3.42). Das Komma zählt als Zeichen.*
    - %e *- gibt Exponentailschreibweise aus*
    - %g *- entscheidet sich zwischen f oder e und nimmt das Kürzere*
    - %s *- gibt String aus*
    - %% *- gibt Prozentzeichen aus*
- **input("Text")** - *Fordert eine Nutzereingabe an. Der Text wird vor der Eingabe angezeigt. Wenn man Text eingeben will, muss man diesen in "" setzen.*
- **plot(x, y, "b*")** - *Plottet eine Funktion mit x und y Werten. Das Argument "b***" ist optional und plottet dann anstatt als kurve als Sterne. Geht z.B. auch mit 'b.'.*

#### Mit Dateien arbeiten
- **fid = fopen(Dateiname, "r")** - *Öffnet eine Datei und nennt diese 'fid'*
- **fid = fopen(Dateiname, "w")** - *Öffnet ein Datei zum schreiben und nennt diese 'fid'*
- **fid = fopen(Dateiname, "r+")** - *Öffnet eine Datei zum lesen und schreiben und nennt diese 'fid'*
- **fprintf(fid, Formatstring, Variablen)** - *Schreibt den Inhalt der Variable in die Datei fid'*
- **line = fgetl(fid)** - *Hol die nächste Zeile aus der Datei und speichert diese in 'line'*
- **zahl = fscanf(fid, "%f")** - *fscanf ließt etwas definiertes aus der Datei 'fid' ein, hier z.B. eine Fließkommzahl %f, und speichert diese als 'zahl'*
- **dims = fscanf(fid, "%d %d\n", 2);** - *Hier werden Zweiervektoren ausgelesen, die nach dem Format 'Zahl, Zahl (nächste Zeile) Zahl, Zahl, usw.' gespeichert sind*
- **fclose(fid)** - *Schließt die Datei fid*

## Datenstrukturen
Es gibt die typischen Datentypen. Alle Daten werden in Array-Form / Matrix gespeichert. Um einer Zahl in ein bestimmtes Format zu drängen, z.B. int32, dann initialisiert man als **"a = int32(*zahl*)"**. #
- **cell(x,y)** - *Erstellt ein Cell-Array, welches an jeder Stelle unterschiedliche Datentypen (Auch Arrays) speichern kann. Zugriff auf Stellen mit 'Name{x,y}'*
- Man kan 'struct'-Objekte erstellen. Diese können wie eine Klasse mit *Name.Attribut* , *(z.B. p1.age = 12)* alles Mögliche speichern, ohne dass man die Klasse erst erstellen muss.

## Differentialgleichungen

#### Vorgehen zum erstellen der Funktion
*>>Anleitung für genaues Vorgehen folgt.<<*
*Bsp. 1: direkte Lösung*
...
*Bsp. 2: Matrix Lösung*
...

#### Vorgehen für Lösungen:
- Form: y'=f(t,y); y(0) = y0
- Gelöst durch **[t, y] = ode45(f, tspan, y0)**  *, mit f = Funktion; tpan = Zeitspanne als [0, tmax] (der Vektor kann auch länger sein als 2, dann werden die Werte an den definierten Stellen ausgegeben); y0 = y-Wert an der Stelle 0 (Startwert/e, ggf. als Vektor)*
- ggf. Plot formatieren.

#### Beispiele:

**Beispiel 1**

*Bsp. 1: Direkte Funktion*
```Matlab
function dy = BeispielDGL(t, y)

% Die Parameter sind gegeben
m1 = 1.0;
m2 = 1.0;
c1 = 4.0;
c2 = 0.6;
c3 = 4.0;

% dyn gehen aus dem oben beschriebenen Vorgehen hervor
dy1 = y(3);
dy2 = y(4);
dy3 = (1/m1)*(-(c1+c2)*y(1) + c2*y(2));
dy4 = (1/m2)*(c2*y(1) - (c2+c3)*y(2));

dy = [dy1; dy2; dy3; dy4]; %SPALTENVEKTOR!!! (; statt ,)
```

*Bsp. 1: Direkte Lösung*
``` Matlab
[t, y] = ode45(@BeispielDGL, [0 30], [1 0 0 0]);
plot(t, y(:,1), t, y(:,2))
legend("x_1(t)", "x_2(t)", "Location", "best");
```
</br>

**Beispiel 2**

*Bsp. 2: Matrix Funktion*
```Matlab
function dy = BeispielDGLMatix(t, y, M, C)
% rechte Seite der DGL bei zweidimensionaler Schwingerkette

x = y(1:2); % Obere Hälfte des 4-er Spaltenvektors y
v = y(3:4); % Untere Hälfte des 4-er Spaltenvektors y
dx = v;
dv = -inv(M)*C*x;
dy = [dx; dv];
```

*Bsp. 2: Matrix Lösung*
``` Matlab
% Parameter
m1 = 1.0;
m2 = 1.0;
c1 = 4.0;
c2 = 0.6;
c3 = 4.0;

% Matrizen erstellen
M = [m1, 0; 0, m2]; % Diagonalmatrix aus den Massen
C = [c1+c2, -c2; -c2, c2+c3];

% Die Funktion Matschwing2d braucht 4 Variablen, ode45 erwartet aber2,
% daher:
fhilf = @(t,y) matschwing2d(t, y, M, C);

[t, y] = ode45(@schwing2d, [0 30], [1 0 0 0]);
plot(t, y(:,1), t, y(:,2))
legend("x_1(t)", "x_2(t)", "Location", "best");
```
</br>

**Beispiel 3 - Lösung für N-Dimensionale Schwingerkette**

*Bsp. 3 N-dim Funktion*
```Matlab
function dy = schwingNd(t, y, M, C)
% rechte Seite der DGL bei N-dimensionaler Schwingerkette

N = length(y)/2; % Zahl der Massen
x = y(1:N); % Erste Hälfte des Vektors y
v = y((N+1):(2*N)); % Zweite Hälfte des Vektors y

dx = v;
dv = -inv(M)*C*x;

dy = [dx; dv];
```

*Bsp. 3 N-dim Lösung*
```Matlab
% Matrixwerte
m1 = 6.0e3; m2 = 6.0e3; m3 = 1.0e3;
c1 = 3.0e6; c2 = 3.0e6; c3 = 1.0e6;
M = diag([m1 m2 m3]); % M ist die Diagonalmatrix der Massen
C = [c1 + c2, -c2, 0; -c2, c2 + c3, -c3; 0, -c3, c3]; % Steifigkeitsmatrix

% Anfangsbedingungen
x0 = zeros(3,1);
v0 = [0; 0; 10];
y0 =  [x0; v0];

% DGL lösen
tEnd = 2;
%Benutzt schwingNd für N-Dimansionale Schwingerkette
myfunc = @(t, y) schwingNd(t, y, M, C); 
[t, y] = ode45(myfunc, [0 tEnd], y0);

% Ergebnis plotten
plot(t, y(:,1), t, y(:,2), t, y(:,3));
legend("x_1", "x_2", "x_3", "Location", "best");

F = getframe(gcf);
imwrite(F.cdata, "bild26.png");
```

</br>

## Klassen
*Vermutlich kommen Klassen überhaupt nicht dran. Hier aus Interesse:*
**Beispiel:**
``` Matlab
classdef Beispiel
    properties
        var1;
        var2;
        usw;
    end
    methods
        % constructor
        function bsp = Beispiel(var, var2, var3)
            if nargin > 0
                bsp.var1 = var1;
                bsp.var2 = var2;
                bsp.var3 = var3;
            end
        end
    end
end
```

**Zugriff auf Objekte:**
- Erstellen von Objekt: *testklasse = Beispiel()*
- Erstellen mit Kontruktor setzt Parameter sofort: *testklasse = Beispiel(var1, var2, var3)*
- Zugreifen auf Inhalt: *var1InKlasse = testklasse.var1* 
- Unter functions können auch komplexere Operationen implementiert werden, die man erreicht mit : *funktionInKlasse = testklasse.tuEtwas(parameter)*