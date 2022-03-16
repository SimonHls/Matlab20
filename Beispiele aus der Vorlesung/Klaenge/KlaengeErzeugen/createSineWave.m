function [y, t] = createSineWave(f, A, T)
    % erzeugt eine Sinusschwingung 
    % Parameter: 
    %    f   Frequenz in Hz
    %    A   Amplitude
    %    T   Tondauer in s
    % Ergebnisse:
    %   y    Schwingung
    %   t    Zeitwerte
    
    fS = 44100;    % feste Sample-Frequenz in Hz
    dt = 1/fS;     % Zeitintervall zwischen zwei Samplewerten
    t = 0:dt:T;    % Zeitwerte
    
    omega = 2*pi*f;
    y = A*sin(omega*t);

    %plotten mit plot(t, y1)