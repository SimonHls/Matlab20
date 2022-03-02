% Öffnet ein Bild, filtert schwarze und weiße Pixel, zeigt das Bild an.

% B = imread("bild32.gif");
% Alternatives Bild:
B = imread("bild33.gif");

% Benutzerdefinierte Farbskala (High Contrast)
scale = (0:255)'/255;
scale2 = rem((0:255)'/16, 1);
scale3 = rem((0:255)'/32, 1);
map = [scale, scale2, scale3];
colormap(1 - map); 
image(B);

% colormap("colorcube"); % Ich bevorzuge "colorcube" für bild33.jpg

% Kantenfilter
filterB = (1/8)*[-1,-1,-1; -1,8,-1; -1,-1,-1];
B2 = filter2(filterB, double(B));
image(B2);


% Bild filtern mit "Image Processing Toolbox"
% B3 = medfilt2(B);
% image(B3);

axis("off");
axis("image");
colorbar
