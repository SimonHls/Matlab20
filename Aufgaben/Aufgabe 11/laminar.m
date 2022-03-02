function dy = laminar(t,y,m,g,b1,b2)
    %{ 
    rechte Seite der DGL bei laminaren, freien Fall
    
    Parameter:
    
    t = Zeitspanne
    y = Anfangswerte (Ort, Geschwindigkeit)
    m = Masse
    g = Erdbeschleunigung
    b1 = Koeffizient Laminare Strömung
    b2 = KOeffizient Turbulente Strömung
    %}
    
    Fr = -b1*y(2);
    
    dy1 = y(2);
    dy2 = -g+Fr./m;
    dy = [dy1; dy2];