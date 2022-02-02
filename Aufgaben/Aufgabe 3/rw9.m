function y = rw9(r)


%Funktion zur Berechnung von w(r) * r
%Argumente
% r = Abstand vom Rohrmittelpunkt
n=9;

y = stroemung(r,n).*r;


