function j = Ruleta(Probabilidad)

    r = rand;
    C = cumsum(Probabilidad);
    j = find(r <= C, 1, 'first');

end