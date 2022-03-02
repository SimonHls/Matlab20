% Öffnet ein Bild, filtert schwarze und weiße Pixel, zeigt das Bild an.

B = imread("bild32.gif");
% Alternatives Bild:
% B = imread("bild33.gif");

% Benutzerdefinierte Farbskala (Grayscale)
scale = (0:255)'/255;
map = [scale, scale, scale];
colormap(map); 
% image(B);

% colormap("colorcube"); % Ich bevorzuge "colorcube" für bild33.gif

% Kantenfilter
% filterB = (1/8)*[-1,-1,-1; -1,8,-1; -1,-1,-1];
% B2 = filter2(filterB, double(B));
% image(B2);


% Bild filtern mit "Image Processing Toolbox"
B3 = medfilt2(B);
% image(B3);

% diffs ist eine Matrix, die die Differenzen zwischen gefiltertem und
% ungefiltertem Bild darstellt.
diffs = abs(double(B) - double(B3));

% Bildet ein Histogramm, das die Differenzen zwischen gefilter und
% ungefiltert darstellt.
% imhist(uint8(diffs));
% ylim([0,100]);

% Speicher alle Positionen, bei denen diffs > 30 ist
badspots = (diffs > 30);
indices = find(badspots); % Positionen in der Matrix

B4 = B;
% Erstezt nur die "kaputten" Pixel im Originalbild durch die gefilterten
% Pixel => Selektiver Medianfilter
B4(indices) = B3(indices);
image(B4);

axis("off");
axis("image");

