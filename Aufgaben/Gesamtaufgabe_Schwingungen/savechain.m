function savechain(chain, filename)
    %{
    
    Script für Aufgabe 9 zum Schreiben einer Schwingerkette mit einem Datenfeld
    
    Parameter: 
    
    chain = Struktur der Schwingerkette mit den Feldern:
        N = Anzahl der zu schwingenden Massen
        m = Massen der einzelnen Schwinger
        c = Federsteifigkeiten der einzelnen Schwinger
        y = Anfangsauslenkungen als Abstand von der Nullachse
    
    filename = Name der Datei
    
    
    %}
    
    fid = fopen(filename + ".chain", "w");
    
    fprintf(fid,"%% N\n%d\n",chain.N);
    fprintf(fid,"%% m\n");
    fprintf(fid,"  %0.4f ",chain.m);
    fprintf(fid,"\n%% c\n");
    fprintf(fid,"  %0.4f ",chain.c);
    fprintf(fid,"\n%% y\n");
    fprintf(fid,"  %0.4f\n",chain.y);
    disp("Datei '" + filename + ".chain' angelegt.");
    fclose(fid);
    
    
    
    