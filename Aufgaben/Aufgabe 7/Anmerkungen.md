Gegeben war: Die Gleichung von Aufgabe 7 im Intervall 1:10 hat vier Lösungen

Ich habe zwei Lösungswege gefunden:

#### Aufgabe7easy.m
- **Aufgabe7easy.m** ist die einfachste Lösung, die ich gefunden habe.
- Hier werden mit der Funktion vpasolve einfach manuell alle Intervalle abgetestet, in denen eine Lösung ist.
- Das Problem ist, dass diese Lösung nur funktioniert, wenn man die Funktionen vorher plottet um die Anzahl der Lösungen und deren Position zu finden. 
- Außerdem muss man die Prüfintervalle manuell einstellen. Das ist nicht sehr elegant, aber einfach.


#### Aufgabe7.m 
- **Aufgabe7.m** funktioniert zusammen mit **getAllSolutions.m**
1. An die funktion *getAllSolutions.m* werden die Funktion, die relevante Unbekannte, das Suchintervall und eine Zählervariable iterations übergeben.
2. Iterations sei 10, dann wird 10 mal an einer Zufälligen Stelle im Intervall nach Lösungen gesucht und jede gefundene Lösung gespeichert.
3. Nach den 10 durchgängen wird der Lösungsvektor nach Duplikaten durchsucht und die bereinigte Form wird übergeben
- Es gibt 3 Probleme hierbei:
    1. Wenn man iterations zu klein wählt, dann werden evtl. nicht alle Lösungen durch Zufall gefunden. Erfahrungsgemäß sollte iterations min. 3x der Anzahl der Erwarteten Lösungen ensprechen. Im Zweifel höher. **ACHTUNG, wird sehr langsam! 100 ist schon viel.**
    2. Es wird jede gefundene Lösung zunächst abgespeichert. Dadurch entstehen Dopplungen, was unschön ist. Man kann theoretisch Prüfen, ob der Wert schomal gefunden wurde und ihn dann nicht speichern, weiß aber nicht wie. *isEmpty()* hab ich nicht verstanden, ist aber glaube ich die Lösung.
    3. Baut auf 2. auf: Das Entfernen der Duplikate dauert ewig und Laufzeit steigt mit Erhöhung der iterations Exponentiell. Das nix gut. Lösung von Problem 2. würde 3. Lösen.
   