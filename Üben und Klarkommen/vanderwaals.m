
T = [300;400;500;600;700;800;900]; %temperatur in K
d = [1.0;1.2;1.4;1.4;1.6;1.8;2.0]; %dichte in kg pro kubikmeter

%Parameter für die Luft
a = 161.85; 
b = 1.2566e-3;
Ri = 287.04;

% Druck berechnen
p = ((Ri.*T) ./ ((1./d)-b)) - (a.*d.^2);

%Tabelle machen
tbl = table(T,d,p, 'variablenames',{'temperatur','dichte','druck [bar]'});
disp(tbl)

