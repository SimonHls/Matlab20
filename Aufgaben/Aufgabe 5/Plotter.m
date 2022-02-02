function A5plot()
    %Zeichnet einen 3D-Plot für A.5
    x = -10:0.1:10;
    y = -10:0.11:10;
    
    [X, Y] = meshgrid(x, y);
    Z = A5func(X, Y);
    
    mesh(X, Y, Z);
    view(-10,40)
    
    xlabel("x","Fontsize",14);
    ylabel("y","Fontsize",14);
    zlabel("z","Fontsize",14);
    
    saveas(gcf, "manta.png");