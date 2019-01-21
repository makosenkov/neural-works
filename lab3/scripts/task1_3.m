%% Prepare data
% Testing different train data size
Ntrain1 = 1000; % Size of train data
raw_train1 = rand(1, Ntrain1); % Generate random values for train data
raw_train1 = cat(2, -raw_train1(1:Ntrain1/2), raw_train1(Ntrain1/2 + 1:end) );
Ntrain2 = 500; % Size of train data
raw_train2 = rand(1, Ntrain2); % Generate random values for train data
raw_train2 = cat(2, -raw_train2(1:Ntrain2/2), raw_train2(Ntrain2/2 + 1:end) );
Ntrain3 = 300; % Size of train data
raw_train3 = rand(1, Ntrain3); % Generate random values for train data
raw_train3 = cat(2, -raw_train3(1:Ntrain3/2), raw_train3(Ntrain3/2 + 1:end) );
 
Ntest = 2000; % Size of test data
raw_test = rand(1, Ntest);
raw_test = sort(cat(2, -raw_test(1:Ntest/2), raw_test(Ntest/2 + 1:end)));
% Creating target data
target_train1 = my_fun(raw_train1);
target_train2 = my_fun(raw_train2);
target_train3 = my_fun(raw_train3);
target_test = my_fun(raw_test);
spread = 0.2;
 
net1 = newgrnn(raw_train1, target_train1, spread);
answer1 = net1(raw_test);
net2 = newrbe(raw_train2, target_train2, spread);
answer2 = net2(raw_test);
net3 = newrbe(raw_train3, target_train3, spread);
answer3 = net3(raw_test);
fprintf('sse for 1000 neurons: %f\n', sse(target_test, answer1));
fprintf('sse for 500 neurons: %f\n', sse(target_test, answer2));
fprintf('sse for 300 neurons: %f\n', sse(target_test, answer3));
hold on
title(['Spread = ', num2str(spread)]);
pl1 = plot(raw_test, target_test, 'xr');
sc1 = plot(raw_test, answer1, 'k','LineWidth', 2);
sc2 = plot(raw_test, answer2, 'g');
sc3 = plot(raw_test, answer3, 'b');
legend([pl1 sc1 sc2 sc3], 'Real', 'NN answer (1000 neurons)', 'NN answer (500 neurons)', 'NN answer (300 neurons)');
axis([-1 1 -1 1]);
hold off