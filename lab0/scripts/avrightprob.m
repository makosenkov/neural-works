function r = avrightprob(T)
    [m, ~] = size(T);
    diag = 0;
    all = 0;
    for i = 1:m
        all = all + sum(T(i,:));
        diag = diag + T(i, i);
    end
    r = diag / all;
end