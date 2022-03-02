function dy = freierfall(y0,g,t)
    %{ 
    Funktion des freien Falls mit den Parametern:
    y0 = Anfangswerte [Höhe,Geschwindigkeit]
    g = Erdbeschleunigung
    t = Zeitspanne
    %}
    
    
    %Bahnfunktion nach s=1/2g*t^2
    dy1=-1/2*g*(t.^2)+y0(1);
    
    %Geschwindigkeitsfunktion nach v = g*t+v0
    
    dy2=-g.*t+y0(2)*sign(y0(2));
    
    %Ausgabe als Matrix dy (Bahn;Geschwindigkeit)
    
    dy=[dy1;dy2];
    
    
    
    
    