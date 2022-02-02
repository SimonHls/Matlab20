function y = rw7(r)


%Funktion zur Berechnung von w(r) * r
%Argumente
% r = Abstand vom Rohrmittelpunkt
n=7;

y = stroemung(r,n).*r;


