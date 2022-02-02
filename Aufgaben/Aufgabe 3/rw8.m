function y = rw8(r)


%Funktion zur Berechnung von w(r) * r
%Argumente
% r = Abstand vom Rohrmittelpunkt
n=8;

y = stroemung(r,n).*r;


