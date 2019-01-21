function plot5classes(X, res)
num_of_ones = sum(res(1, :) == 1);
num_of_twoes = sum(res(2, :) == 1);
num_of_trees = sum(res(3, :) == 1);
num_of_fours = sum(res(4, :) == 1);
num_of_fives = sum(res(5, :) == 1);
 
ones_ = zeros(num_of_ones, 2);
twoes_ = zeros(num_of_twoes, 2);
trees_ = zeros(num_of_trees, 2);
fours_ = zeros(num_of_fours, 2);
fives_ = zeros(num_of_fives, 2);
 
j = 1;
k = 1;
l = 1;
m = 1;
n = 1;
for i = 1:length(res)
    if res(1,i) == 1
        ones_(j,:) = X(i,:);
        j = j + 1;
    elseif res(2,i) == 1
        twoes_(k, :) = X(i, :);
        k = k + 1;
    elseif res(3,i) == 1
        trees_(l, :) = X(i, :);
        l = l + 1;
    elseif res(4,i) == 1
        fours_(m, :) = X(i, :);
        m = m + 1;
    else
        fives_(n, :) = X(i, :);
        n = n + 1;
    end
end 
 
figure
hold on
scatter(ones_(:,1), ones_(:,2), 'r');
scatter(twoes_(:,1), twoes_(:,2), 'y');
scatter(trees_(:,1), trees_(:,2), 'c');
scatter(fours_(:,1), fours_(:,2), 'b');
scatter(fives_(:,1), fives_(:,2), 'g');
legend(["Class 1" "Class 2" "Class 3" "Class 4" "Class 5"]);
axis([0 1 0 1])
axis square
hold off
end