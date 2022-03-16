%% Plotten der Sinuskurve
f = 200; %Frequenz
A = 0.3;
T = 2;
[y1, t] = createSineWave(f, A, T);

stairs(t,y1);
xlim([0;12e-3]);
% Ton daraus erzeugen:
% sound(y1, 44100);

%% Plotten der Sawwave
y2 = createSineWave(2*f, A/2, T);
y3 = createSineWave(3*f, A/3, T);
y4 = createSineWave(4*f, A/4, T);
y5 = createSineWave(5*f, A/5, T);
y6 = createSineWave(6*f, A/6, T);
y = y1 + y2 + y3 + y4 + y5 + y6;
plot(t,y);
xlim([0;12e-3]);

% abspeichern als WAV Datei
% audiowrite("ton.wav", y, 44100)

%% Sawwave mit Envelope
y2 = createSineWave(2*f, A/2, T);
y3 = createSineWave(3*f, A/3, T);
y4 = createSineWave(4*f, A/4, T);
y5 = createSineWave(5*f, A/5, T);
y6 = createSineWave(6*f, A/6, T);
y = y1 + y2 + y3 + y4 + y5 + y6;
plot(t,y);
xlim([0;12e-3]);

yEnv = createEnvelope(0.1, 1.2, 0.6, T);
yH = yEnv.*y;

plot(t, yH);
xlim([0;12e-3]);
% Ton daraus erzeugen:
% sound(yH, 44100);