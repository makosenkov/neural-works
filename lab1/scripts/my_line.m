function r = my_line(x1, y1, x2, y2)
    x = y1 - y2;
    y = x2 - x1;
    b = x1*y2 - x2*y1;
    r = [x y b];
end