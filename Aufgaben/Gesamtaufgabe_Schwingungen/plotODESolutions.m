function plotODESolutions(axes, t, x, index)

    %{
    
    Funktion zum Plotten des Ergebnisse der Differenzialberechnungen t und x
    Argumente:
     axes = zu wählendes Achsensystem
     t = Zeitwerte t der DGL Lösung
     x = Funktionswerte x der DGL Lösung
     index = anzuzeigende Graphen 1- N als Vektor
    %}
    
    
    
    hold on;
    subplot(2,1,2,axes); %Zweite Zeile anwählen
    set(gca,'color','k'); %Hintergrundfarbe schwarz
    steps = length(index);
    color = linspace(1,0,steps);
    
    for k = 1:steps
        plot(axes,t,(x(:,index(k))),"Color",[color(k),1,color(k)],"DisplayName","index(k)");
        text(k) = "Masse " + index(k); %Erzeugen eines (1:k) String Vektors für die Legende
    end
    
    hold off;
    legend(text,"location","best","NumColumns",2,"TextColor",'white');
    legend('boxoff');
    xlabel("Zeit in sek");
    ylabel("Amplitude in cm");
    title("Amplituden der Massen");
    
    
    
    