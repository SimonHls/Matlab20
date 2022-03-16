%% MP3 Einlesen und Plotten

[y, Fs] = audioread("ton2.mp3");

subplot(1,2,1);
subplot(2,1,1);
plot(y(:,1));
subplot(2,1,2);
plot(y(:,2));
size(y,1);


%% MP3 einlesen, in Mono umwandeln und Spektralanalyse Plotten

[y, Fs] = audioread("ton2.mp3");

yMono = (y(:,1) + y(:,2))/2;

N1 = 73400;
N = 2^16;
y1 = yMono(1:N);

[Y, f] = spektrum(y1, 44100);
subplot(1,1,1);
plot(f, Y);
xlim([0,2600])