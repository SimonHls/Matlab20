# Allgemeines und Hinweise

### Tips


- Quadratische Matrizen vermeiden, indem man z.B. unterschiedliche Schrittweiten in der Darstellung benutzt. So bekommt man bei falscher Verwendung von einem '.' eine Fehlermeldung.
- Wann Punkt und wann nicht?
    - *Regeln nachreichen*

***

### Funktionen
- **roots(MATRIX)** - *Löst Polynome, Eingabe ist Matrix z.B. [3, 2, 1] für 3x^2 + 2x + 1, get auch mit höherer Ordnung. Ausgabe ist Lösung(en) der Gleichung.*
- **integral(Funktion, linkeGrenz, rechteGrenze)** - *gibt das Integral der Funktion aus. Ggf. '@' vor die Funktion schreiben.*
- **fzero(Funktion, BereichAlsMatrix oder Wert)** - *Gibt die Nullstellen im Bereich aus. Bereichsmatrix ist [linkeGrenze, rechteGrenze]. Bei mehr als einer Lösung im Bereich gibt er trotzdem nur eine aus. Anstatt der Bereichsmatrix kann man auch einen Wert eingeben. Dann gibt die Funktion die Nullstelle aus, die am nächsten an diesem Wert liegt.*
- **fprintf("Text und Zeichen", Wert1, Wert2, Wert...)** - **
    - \n *- nächste Zeile*
    - Matrizen gibt man normalerweise Transponiert aus (also aus A wird A')
    - %# *- Zeichen # sind Platzhalter für Werte, die nach dem Komma im fprintf-Befehl stehen.*
    - %d *- gibt ganze Zahlen aus*
    - %f *- gibt Fließkommazahl aus (f = float)*
    - %4.2f *- Hier werden für die Ausgabe vier Zeichen und 2 Nachkommastellen bereitgestellt.*
    - %e *- gibt Exponentailschreibweise aus*
    - %g *- entscheidet sich zwischen f oder e und nimmt das Kürzere*
    - %s *- gibt String aus*
    - %% *- gibt Prozentzeichen aus*

