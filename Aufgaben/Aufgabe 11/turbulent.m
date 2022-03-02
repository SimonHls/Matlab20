function dy = turbulent(t,y,m,g,b1,b2)
    %{ 
    rechte Seite der DGL bei turbulenten freien Fall
    
    Parameter:
    
    t = Zeitspanne
    y = Anfangswerte (Ort, Geschwindigkeit)
    m = Masse
    g = Erdbeschleunigung
    b1 = Koeffizient Laminare Strömung
    b2 = KOeffizient Turbulente Strömung
    %}
    
    Fr = -b2*(y(2)).^2 * sign(y(2));
    
    dy1 = y(2);
    dy2 = -g+Fr./m;
    dy = [dy1; dy2];