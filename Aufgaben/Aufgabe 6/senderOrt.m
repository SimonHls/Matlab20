function Lsg = senderOrt(A, wb)


    %Berechnen der Steigung der Geraden
    m = sin(wb)./cos(wb);
    
    
    x = 0:0.1:40;
    k = 1:1:4;
    
    
    %Berechnen des Y-Achsen Abschnitts
    b = ( A(k,2) - A(k,1) .* m(k)');
    
    %Aufstellen der Funktionen
    y1 = m(1) .* x + b(1);
    y2 = m(2) .* x + b(2);
    y3 = m(3) .* x + b(3);
    y4 = m(4) .* x + b(4);
    
    %Schreiben als LSG iond er Form A x= b 
    n = - m;
    d = n./b';  % ??? 
    
    % Schrieben der Werte des LSG in Matrix
    C = ones(4,2);
    C(k,2) = n(k)';
    
     
    % Berechnen von x = A\b
    Lsg = C\b;
    
    %Zeichnen der Graphen
    plot(x,y1,x,y2,x,y3,x,y4,Lsg(2),Lsg(1),"kx"); grid();
    