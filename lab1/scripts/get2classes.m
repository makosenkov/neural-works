function T = get2classes(fun, X)
    res1 = fun(X(:,1), X(:,2));
    positive_indices1 = find(res1 > 0);
    negative_indices1 = find(res1 < 0);
    T = zeros(length(X), 1);
    T(positive_indices1) = 1;
    T(negative_indices1) = 0;
end