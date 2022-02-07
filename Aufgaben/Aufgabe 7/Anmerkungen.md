Gegeben war: Die Gleichung von Aufgabe 7 im Intervall 1:10 hat vier Lösungen

Ich habe zwei Lösungswege gefunden:

#### Aufgabe7easy.m
- **Aufgabe7easy.m** ist die einfachste Lösung, die ich gefunden habe.
- Hier werden mit der Funktion vpasolve() einfach manuell alle Intervalle abgetestet, in denen eine Lösung ist.
- Das Problem ist, dass diese Lösung nur funktioniert, wenn man die Funktionen vorher plottet um die Anzahl der Lösungen und deren Position zu finden. 
- Außerdem muss man die Prüfintervalle manuell einstellen. Das ist nicht sehr elegant, aber einfach.


#### Aufgabe7.m 
- **Aufgabe7.m** funktioniert zusammen mit **getAllSolutions.m**
1. An die funktion *getAllSolutions.m* werden die Funktion, die relevante Unbekannte, das Suchintervall und eine Zählervariable *'Steps'* übergeben.
2. Steps gibt an, in wie vielen Teilschritten das angegebene Interval durchschritten werden soll. Die Funktion *vbsolve()* gibt immer die nächste Lösung zu einem bestimmten Punkt aus. Durch die Schrittweite werden Punkte in regelmäßigen Abstängen im Intervall auf die nächste Lösungsstelle untersucht. 
3. Alle gefundenen Lösungen werden gespeichert. Am Ende werden Dopplungen aus dem Lösungsvektor entfernt. Übrig bleiben die einzelnen Lösungen als Ausgabewert.
- Problem: Das Verfahren ist langsam, da viele Werte mehrfach untersucht und gespeichert werden müssen. Außerdem können bei zu großer Schrittweite Lösungen übersehen werden, allerdings führen zu kleine Schritte zu unnötig langer Rechenzeit. Es ist schwer, einen allgemein gültigen Kompromiss aus maximaler Ganauigkeit und minimaler Rechenzeit zu finden.