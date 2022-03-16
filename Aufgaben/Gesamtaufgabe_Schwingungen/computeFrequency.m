function f = computeFrequency(chain, nr)

    %{
    Funktion zur Bestimmung der Eigenschwingungen der Schwingerkette
    
    Argumente:
    chain = chain - Struktur
    nr = Zeiger auf die nr.te Eigenfrequenz
    
    Hinweis: Die Eigenvektoren werden bei der Ausgabe nicht berücksichtigt.
    
    %}
    
    [Phi, om2] = eig(chain.C,chain.M);
    freq = sqrt(diag(om2))/(2*pi);
    
    % Eigenvektoren auf Länge 1 normieren
    norms = sqrt(diag(Phi'*Phi));
    Phi = Phi*diag(1./norms);
    
    f = freq(nr);
    
    