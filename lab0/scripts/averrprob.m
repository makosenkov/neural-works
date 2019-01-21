function r = averrprob(T)
    [m, ~] = size(T);
    nondiag = 0;
    all = 0;
    for i = 1:m
        sumi = sum(T(i,:));
        all = all + sumi;
        nondiag = nondiag + (sumi - T(i, i));
    end
    r = nondiag / all;
end