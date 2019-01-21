function plot2classes(X, Y) 
% Calculate how many zeros and ones in test matrix
num_of_ones = sum(Y(:) == 1);
num_of_zeros = sum(Y(:) == 0);
% Create arrays for a plot
ones_ = zeros(num_of_ones, 2);
zeros_ = zeros(num_of_zeros, 2);
% Indexes for ones_ and zeros_
j = 1;
k = 1;
for i = 1:length(Y)
    if Y(i) == 1
        ones_(j, 1) = X(i, 1);
        ones_(j, 2) = X(i, 2);
        j = j + 1;
    else
        zeros_(k, 1) = X(i, 1);
        zeros_(k, 2) = X(i, 2);
        k = k + 1;
    end
end
% Plot dots
figure
hold on
scatter(ones_(:,1), ones_(:,2), 'r');
scatter(zeros_(:,1), zeros_(:,2), 'b', 'filled');
axis([0 1 0 1])
axis square
legend(['1st class'; '2nd class']);
hold off
end