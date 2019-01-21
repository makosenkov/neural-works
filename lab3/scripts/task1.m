%% Prepare data
Ntrain = 1000; % Size of train data
Ntest = 2000; % Size of test data
raw_train = rand(1, Ntrain); % Generate random values for train data
raw_train = cat(2, -raw_train(1:Ntrain/2), raw_train(Ntrain/2 + 1:end) );
raw_test = rand(1, Ntest);
raw_test = sort(cat(2, -raw_test(1:Ntest/2), raw_test(Ntest/2 + 1:end)));
target_train = my_fun(raw_train);
target_test = my_fun(raw_test);
spread = 0.2;
less_spread = 0.001;
more_spread = 0.5;
net_optimal = newrbe(raw_train, target_train, spread);
view(net_optimal);
answer_optimal = net_optimal(raw_test); 
net_less = newrbe(raw_train, target_train, less_spread);
answer_less = net_less(raw_test);
net_more = newrbe(raw_train, target_train, more_spread);
answer_more = net_more(raw_test); 
fprintf('sse for optimal spread: %f\n', sse(target_test, answer_optimal));
fprintf('sse for less spread: %f\n', sse(target_test, answer_less));
fprintf('sse for more spread: %f\n', sse(target_test, answer_more));
hold on
pl1 = plot(raw_test, target_test, 'xr');
sc1 = plot(raw_test, answer_optimal, 'k','LineWidth', 2);
sc2 = plot(raw_test, answer_less, 'g');
sc3 = plot(raw_test, answer_more, 'b');
legend([pl1 sc1 sc2 sc3], 'Real', 'NN answer (optimal spread)', 'NN answer (less)', 'NN answer (more)');
hold off