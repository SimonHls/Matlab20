function plotModeAnimation(axes, xe, truss, nLoop)
% zeigt eine Animation der Eigenschwingung xe 
% Parameter
%    axes      verwendetes Achsensystem
%    xe        Eigenvektor r Fachwerk-Schwingung
%    truss     Fachwerk
%    nLoop     Anzahl angezeigter Schwingungen      

amp = 0.3;         % Amplitude der Eigenschwingung
nFrames = 16;      % Zahl der Bilder pro Schwingung

N = truss.N;
trussT = truss;

for j = 1:nFrames*nLoop
  t = 2*pi*j/nFrames;
  trussT.x0(1,1:N) = truss.x0(1,1:N) + amp*sin(t)*xe(1:2:end)';
  trussT.x0(2,1:N) = truss.x0(2,1:N) + amp*sin(t)*xe(2:2:end)';
  
  plotTruss(axes, trussT); %Funktion fehlt in diesem Verzeichnis, 
                           % deshalb gehts nicht
  drawnow;
end