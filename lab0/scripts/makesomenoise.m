function res = makesomenoise(x, maxval)
    len = size(x);
    std_noise = random('Uniform', -maxval, maxval, len);
    res = x + std_noise;
end