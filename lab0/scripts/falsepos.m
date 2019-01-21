function r = falsepos(T)
    [m, n] = size(T);
    r = zeros(1, n);
    for i = 1:n
        err = 0;
        all = 0;
        for j = 1:m
            if i ~= j; err = err + T(i, j); end
            all = all + T(i, j);
        end
        r(i) = err / all;
    end
end