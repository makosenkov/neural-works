P = zeros(16, 2);
T = zeros(16, 1);
for i = 1:16
    P(i, 1) = fix((i - 1)/4) * 0.25;
    P(i, 2) = mod((i - 1), 4) * .25;
end
 
T(2) = 1; T(3) = 1;
T(5) = 1; T(8) = 1;
T(9) = 1; T(12) = 1;
T(14) = 1; T(15) = 1;
 
% Plot
color1 = [0 0 0];
color2 = [1 1 1];
figure
hold on
for i = 1:length(T)
    r = rectangle('Position', [P(i, 1) P(i, 2) .25 .25], 'FaceColor',color2);
    if T(i) == 1
        r.FaceColor = color1;
    end
end
 
axis([0 1 0 1])
axis square
title('First Data');
hold off