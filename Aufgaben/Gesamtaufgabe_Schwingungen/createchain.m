function chain = createchain()

    %{
    
    Funktion zur Erstellung einer Struktur .chain
    
    Parameter:
        N = Anzahl der zu schwingenden Massen
        m = Massen der einzelnen Schwinger
        c = Federsteifigkeiten der einzelnen Schwinger
        y = Anfangsauslenkungen als Abstand von der Nullachse
    %}
    
    
    chain.N = 4;
    chain.m = [1,2,2,1];
    chain.c = [2,1,3,1,2];
    chain.y = [0.8,0,0,0];
    
    