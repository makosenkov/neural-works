function res = my_fun(T)
    n = length(T);
    res = zeros(n, 1)';
    for i = 1:n
        res(i) = sin(2.^(5-T(i)));
    end
end