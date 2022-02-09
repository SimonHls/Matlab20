# Tipps und Hinweise
Enthält einige Tipps und Erklärungen zu Funktionen von MatLab. 

## Tipps

- Quadratische Matrizen vermeiden, indem man z.B. unterschiedliche Schrittweiten in der Darstellung benutzt. So bekommt man bei falscher Verwendung von einem '.' eine Fehlermeldung.
- Wann Punkt und wann nicht?
    - *Regeln nachreichen*

## Funktionen und Befehle

### Mit Zahlen arbeiten
- **roots(MATRIX)** - *Löst Polynome, Eingabe ist Matrix z.B. [3, 2, 1] für 3x^2 + 2x + 1, geht auch mit höherer Ordnung. Ausgabe ist Lösung(en) der Gleichung.*
- **integral(Funktion, linkeGrenz, rechteGrenze)** - *gibt das Integral der Funktion aus. Ggf. '@' vor die Funktion schreiben.*
- **fzero(Funktion, BereichAlsMatrix oder Wert)** - *Gibt die Nullstellen im Bereich aus. Bereichsmatrix ist [linkeGrenze, rechteGrenze]. Bei mehr als einer Lösung im Bereich gibt er trotzdem nur eine Nullstelle aus. Anstatt der Bereichsmatrix kann man auch einen Wert eingeben. Dann gibt die Funktion die Nullstelle aus, die am nächsten an diesem Wert liegt.*
- **solve(gleichung, Variable zum Auflösen)** - *Für Polynomgleichungen. Eingabe ist eine Gleichung und die gewünschte Variable zur Auflösung.*
- **vpasolve(gleichung, Variable zum Auflösen, Positionoder Interval, ggf. 'Random', true)** - *Löst Gleichungen numerisch. Variable muss als "syms x;" deklariert werden. "'Random', true" gibt eine zufällige Lösung im Intervall aus, sonst wird immer die geringste Lösung ausgegeben. Für alle Lösungen im Intervall muss die Funktion mehrfach ausgeführt werden.*
  
### Eingabe und Ausgabe
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

### Mit Dateien arbeiten
- **fid = fopen(Dateiname, "r")** - *Öffnet eine Datei und nennt diese 'fid'*
- **fid = fopen(Dateiname, "w")** - *Öffnet ein Datei zum schreiben und nennt diese 'fid'*
- **fid = fopen(Dateiname, "r+")** - *Öffnet eine Datei zum lesen und schreiben und nennt diese 'fid'*
- **fprintf(fid, Formatstring, Variablen)** - *Schreibt den Inhalt der Variable in die Datei fid'*
- **line = fgetl(fid)** - *Hol die nächste Zeile aus der Datei und speichert diese in 'line'*
- **zahl = fscanf(fid, "%f")** - *fscanf ließt etwas definiertes aus der Datei 'fid' ein, hier z.B. eine Fließkommzahl %f, und speichert diese als 'zahl'*
- **dims = fscanf(fid, "%d %d\n", 2);** - *Hier werden Zweiervektoren ausgelesen, die nach dem Format 'Zahl, Zahl (nächste Zeile) Zahl, Zahl, usw.' gespeichert sind*
- **fclose(fid)** - *Schließt die Datei fid*

### Datenstrukturen
Es gibt die typischen Datentypen. Alle Daten werden in Array-Form / Matrix gespeichert. Um einer Zahl in ein bestimmtes Format zu drängen, z.B. int32, dann initialisiert man als **"a = int32(*zahl*)"**. #
- **cell(x,y)** - *Erstellt ein Cell-Array, welches an jeder Stelle unterschiedliche Datentypen (Auch Arrays) speichern kann. Zugriff auf Stellen mit 'Name{x,y}'*
- Man kan 'struct'-Objekte erstellen. Diese können wie eine Klasse mit *Name.Attribut* , *(z.B. p1.age = 12)* alles mögliche speichern, ohne dass man die Klasse erst erstellen muss.

### Klassen
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