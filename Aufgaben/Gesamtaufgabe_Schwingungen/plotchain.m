function plotchain(axes, chain)
    %{ 
    zeichnet die gegebene Schwingerkette Chain mit den Argumenten 
    
    axes = ausgewähltes Achsensystem
    chain.N = Anzahl der Schwinger
    chain.m = Massen der Schwinger 
    chain.c = Federkonstanten der Federn zwischen den Schwingern
    chain.y Positionen der Schwinger
    
    %}
    
    % Übernahme der chain Variablen in gebräuchlichere Variablen
    n = chain.N;
    y = chain.y(1,:);
    
    % Erstellen einer Matrix für alle x Werte, inklusive der Befestigungen
    x = 0:1:chain.N+1;
    
    % Erstellen einer Matrix für alle y Werte durch Übertragen der y Werte in y2. 
    % Es werden am Anfang und Ende zwei Werte mit y=0 für die Schwingerbefestigung benötigt.
    
    y2 = zeros(1,size(chain.y,2)+2); 
    for k=1:size((chain.y),2)
        y2(1,k+1)=y(1,k);
    end
    
    % Zeichnen der Knoten und Verbindungen in Rot, Setzen eines Achsensystems
    subplot(2,1,1,axes);
    plot(axes, x, y2, "r-");
    axis(axes,"equal");
    axis(axes,[-1 n+2 min(y)-1 max(y)+1]); %Begrenzungen festlegen
    set(axes, "XTick", [], "YTick", []); 
    hold on;
    
    % Zeichnen der grauen Rechtecke um die Befestigungspunkte
    plotrectangle(axes, x(1), y2(1));
    plotrectangle(axes, x(n+2), y2(n+2));
    
    % Zeichnen der Kreise um die Schwinger
    for  i=1:size((chain.y),2)
    plotcircle (axes, x(1,i+1), y2(1,i+1))
    end
    
    hold(axes, "off")
    
    
    %--------------------------------------------------------------------
    function plotrectangle (axes,x0,y0)
    %{
    Zeichnet ein kleines graues Rechteck zur Befestigung
    Argumente:
        axes: Aktuelles Bild
        x0: x Wert Mittelpunkt
        y0: Y Wert Mittelpunkt
    Interne Variablen:
        width = Breite
        height = Höhe
     %}
    
    width = 0.1;
    height = 0.4;
    
    rectangle(axes,"Position", [x0-width/2 y0-height/2 width height],"FaceColor",[0.00,0.00,0.00]);
    
    function plotcircle (axes, x0, y0)
    %{
    Zeichnet einen Kreis mit Randung
    Argumente:
        axes: Aktuelles Bild
        x0: x Wert Mittelpunkt
        y0: Y Wert Mittelpunkt
    
    Interne Variablen:
        d  = Kreisdurchmesser
        f1 = Füllfarbe
        f2 = Linienfarbe
        l  = Liniendicke
    %}
    
    d = double(0.5);
    f1 = [0.00,0.00,1.00];
    f2 = [0.00,0.00,0.00];
    l = 2; 
    
    r= rectangle(axes,"Position", [x0-d/2, y0-d/2, d, d], "FaceColor",...
        f1,"EdgeColor",f2, "LineWidth",l);
    r.Curvature = (1); % Curvature,1 = Vollkreis
    
    
    
    
    