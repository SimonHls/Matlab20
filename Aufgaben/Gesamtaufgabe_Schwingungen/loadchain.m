
function loadchain(filename)
    %{
    
    Script für Aufgabe 9 zum Laden einer Schwingerkette mit einem Datenfeld
    chain
    
    Parameter: 
    
    chain = Struktur der Schwingerkette mit den Feldern:
        N = Anzahl der zu schwingenden Massen
        m = Massen der einzelnen Schwinger
        c = Federsteifigkeiten der einzelnen Schwinger
        y = Anfangsauslenkungen als Abstand von der Nullachse
    
    filename = Name der Datei (ohne Endung .chain)
    %}
    
    %formatSpec = "%f\n"; %Floatformat und Zeilenwechsel als Standard
    
    fid = fopen(filename + ".chain", "r");
    if (fid == -1)
      fprintf("Datei %s.chain konnte nicht geöffnet werden\n", filename) 
      % Dummy-Rückgabewerte
      chain.N = []; chain.m = []; chain.c = 0; chain.y = []; 
      return
    end
    
    % Erste Zeile überspringen
    fgetl(fid);
    % Zweite Zeile = N
    chain.N = fscanf(fid, "%d\n");
    
    
    % Dritte Zeile überspringen
    fgetl(fid);
    
    %Vierte Zeile = m
    chain.m = fscanf(fid," 0.4f",chain.N);
    
    %Fünfte Zeile überspringen
    fgetl(fid);
    
    % Sechste Zeile = c
    chain.c = fscanf(fid," 0.4f",chain.N+1);
    
    %Siebte Zeile überspringen
    fgetl(fid);
    
    %Achte Zeile
    chain.y = fscanf(fid," 0.4f",chain.N);
    
    %Datei schließen
    fclose(fid);
    
    disp("Datei '" + filename + ".chain' erfolgreich geladen.");
    