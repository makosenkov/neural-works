Figure = [   0.2, 0.1; 0.2, 0.5; 0.5, 0.8;
    0.8, 0.5; 0.6, 0.3; 0.6, 0.1; 0.4, 0.3; 0.2, 0.1; NaN, NaN;
    0.2, 0.8; 0.2, 0.9; 0.4, 0.9; 0.4, 0.8; 0.2, 0.8];

figure 
hold on
plot(Figure(:,1), Figure(:,2), 'r');
axis([0 1 0 1])
axis square
hold off
 
r = rand(2, 2000)'; 
res = is_in_area(r);
num_of_ones = sum(res(:) == 1);
num_of_zeros = sum(res(:) == 0);
 
ones_ = zeros(num_of_ones, 2);
zeros_ = zeros(num_of_zeros, 2);
 
j = 1;
k = 1;
for i = 1:length(res)
    if res(i) == 1
        ones_(j, 1) = r(i, 1);
        ones_(j, 2) = r(i, 2);
        j = j + 1;
    else 
        zeros_(k, 1) = r(i, 1);
        zeros_(k, 2) = r(i, 2);
        k = k + 1;
    end
end 
 
figure
hold on
scatter(ones_(:,1), ones_(:,2), 'r');
scatter(zeros_(:,1), zeros_(:,2), 'b', 'filled');
axis([0 1 0 1])
axis square
hold off