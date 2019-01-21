function res = is_in_area(T)
M = [   0.2, 0.1; 0.2, 0.5; 0.5, 0.8;
    0.8, 0.5; 0.6, 0.3; 0.6, 0.1; 0.4, 0.3; 0.2, 0.1; NaN, NaN;
    0.2, 0.8; 0.2, 0.9; 0.4, 0.9; 0.4, 0.8; 0.2, 0.8];

    n = length(T);
    res = zeros(n, 1);
    for i = 1:n
        res(i) = inpolygon(T(i,1), T(i,2), M(:,1), M(:,2));
    end
    res = res';
end