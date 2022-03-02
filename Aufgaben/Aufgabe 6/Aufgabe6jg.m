function Aufgabe6jg()

    A = ([2.7,2.5;36.1,5.5;28.4,31.9;4,24.6]);
    b = [-64.5,62,147.6,-122.7];
    
    %Funktion1: f1(x) = 0,4770* x + 1,2121
    %Funktion2: f2(x) = -0.5317* x + 24.6944
    %Funktion3: f3(x) = 1.5757* x -12.8499 
    %Funktion4: f4(x) = -0.6420* x + 27.1680
    
    %Finktionen aufstellen
    %Bogenmaß bilden 
    
    wg = b-90;
    wb = wg/180*pi;
    m = sin(wb)./cos(wb);
    
    Loesung = senderOrt(A,wb)
    