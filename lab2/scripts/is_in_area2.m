function res = is_in_area2(T, type)
A1 = [  0.0, 0.0; 0.6, 0.0; 0.6, 0.25; 0.0, 0.25; 0.0, 0.0 ];
A2 = [ 0.25, 0.3; 0.5, 0.3; 0.5, 0.6; 0.25, 0.6; 0.25, 0.3 ];
A3 = [ 0.4, 0.7; 0.6, 0.7; 0.4, 0.9; 0.4, 0.];
A4 = [ 0.80, 0.25; 0.9, 0.25; 0.9, 0.55; 0.8, 0.55; 0.8, 0.25 ];
    n = length(T);
if type == 1
    res = zeros(n, 1);
else 
    res = zeros(n, 5); 
end
 
    for i = 1:n
        if inpolygon(T(i,1), T(i,2), A1(:,1), A1(:,2))
            if type == 1
                res(i) = 1;
            else 
                res(i, 1) = 1;
            end
        elseif inpolygon(T(i,1), T(i,2), A2(:,1), A2(:,2))
            if type == 1
                res(i) = 2;
            else 
                res(i, 2) = 1;
            end
        elseif inpolygon(T(i,1), T(i,2), A3(:,1), A3(:,2))
            if type == 1
                res(i) = 3;
            else 
                res(i, 3) = 1;
            end
        elseif inpolygon(T(i,1), T(i,2), A4(:,1), A4(:,2))
            if type == 1
                res(i) = 4;
            else 
                res(i, 4) = 1;
            end
        else 
            if type == 1
                res(i) = 5;
            else 
                res(i, 5) = 1;
            end
        end 
    end
    res = res';
end