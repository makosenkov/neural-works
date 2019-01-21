function r = alphaerr(T)
    [m, n] = size(T);
    r = zeros(1, n);
    for i = 1:n
        err = 0;
        all = 0;
        for j = 1:m
            if i ~= j; err = err + T(j, i); end
            all = all + T(j, i);
        end
        r(i) = err / all;
    end
end