function Aufgabe7easy()
% Löst die Gleichung eqn
% Lösung nicht sehr elegant, da die Anzahl der Lösungen hierfür bekannt
% sein muss und die Lösungen nur durch Manuelles verändern der Intervalle
% gefunden werden konnten.

clear all, clc
syms x;
eqn = x.*log(0.1.*x) == tan(x);
disp("Lösungen: ")
vpasolve(eqn,x,[0 1])
vpasolve(eqn,x,[1 2])
vpasolve(eqn,x,[2 5])
vpasolve(eqn,x,[8 10])