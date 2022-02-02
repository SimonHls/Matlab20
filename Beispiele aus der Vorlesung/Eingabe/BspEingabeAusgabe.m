%Beispiel zur Ein-/Ausgabe

%===AUSGABE===

clc
fprintf("Hallo Peter\n")
fprintf("Zwei mal drei sind &d\n", 2*3)
fprintf("pi = %f, und zum Quadrat: %f\n", pi, pi^2)
fprintf("%5d\n%5d\n%5d\n%5d\n", 2^5, 2^10, 2^15, 2^20)
fprintf("pi = %12.8f\n", pi)

%Vektoren Ausgeben

v1 = 1:10; 
fprintf("%f, %f\n", v1);

fprintf("\n\n") %Leerzeilen

v2 = 1:2:10; 
fprintf("%f, %f\n", v2);

fprintf("\n\n") %Leerzeilen

A = [1,2,3;4,5,6];
fprintf("%4.2f %4.2f %4.2f\n", A);

%===EINGABE===

in = input("Zahl zwischen 1 und 10 eingeben: ") %ungeprüfte Eingabe einer Zahl oder Variable mit Zahlenwert, 
                                                %für Zeichenkette Eingabe in "" setzen.
