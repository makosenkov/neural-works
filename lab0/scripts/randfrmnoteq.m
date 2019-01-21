function res = randfrmnoteq(x, c) 
    x(x==c) = [];
    res = x(randperm(length(x), 1));
end