function y = rw6(r)


%Funktion zur Berechnung von w(r) * r
%Argumente
% r = Abstand vom Rohrmittelpunkt
n=6;

y = stroemung(r,n).*r;


