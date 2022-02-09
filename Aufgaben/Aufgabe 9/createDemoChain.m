function chain = createDemoChain()
% Hilfsfunktion, die die Datei demo.chain erzeugt.
% Nachkommastellen sind nicht wie in Vorlage. Egal?

m = [1, 2, 2, 1];
c = [2, 1, 3, 1, 2];
y = [0.8, 0, 0, 0];

chain.m = m;
chain.c = c;
chain.y = y;