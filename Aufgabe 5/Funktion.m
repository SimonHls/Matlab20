function z = A5func(x, y)
    %Funktion für A.5
    e = exp(1)
    z = (x+y).^2+(1/5).*y.^3.*e.^(-abs(x+y))
    