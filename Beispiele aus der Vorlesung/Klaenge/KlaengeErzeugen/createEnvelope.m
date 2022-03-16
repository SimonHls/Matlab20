function [y, t] = createEnvelope(TA, TS, TR, T)
% erzeugt eine Hüllkurve mit einer Anstiegszeit (Attack-Phase), einer
% Dauerzeit (Sustain-Phase) und einer Abklingzeit (Release-Phase)
% Parameter:
%    TA    Dauer der Attack-Phase in s
%    TS    Dauer der Sustain-Phase in s
%    TR    Dauer der Release-Phase in s
%    T     Gesamtdauer in s
% Ergebnisse:
%   y    Hüllkurve
%   t    Zeitwerte

dt = 1/44100;    % feste Samplezeit 44.1 kHz
t = 0:dt:T;

% Berechnen der Index-Werte an den Grenzen
indexA = floor(TA/dt);           % Ende der Attack-Phase
indexS = floor((TA+TS)/dt);      % Ende der Sustain-Phase
indexR = floor((TA+TS+TR)/dt);   % Ende der Release-Phase

% zunächst überall auf 0
y = zeros(size(t));

% Attack-Phase
index = 1:indexA;
tA = t(index);
y(index) = tA/TA;

% Sustain-Phase
index = (indexA + 1):(indexS);
y(index) = 1.0;

% Release-Phase
index = (indexS + 1):indexR;
tR = t(index);
y(index) = (TA + TS + TR - tR)/TR;