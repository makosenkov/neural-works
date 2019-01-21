function C = confmatr(T, Y, k)
    l = length(k);
    C = zeros(l, l);
    
    for i = 1:length(T)
        indC = find(k==T(i));
        indR = find(k==Y(i));
        C(indR, indC) = C(indR, indC) + 1;
    end
end