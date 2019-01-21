%% Prepare data
Ntest = 2000; % Size of test data
raw_test = rand(1, Ntest);
raw_test = sort(cat(2, -raw_test(1:Ntest/2), raw_test(Ntest/2 + 1:end)));
target_test = my_fun(raw_test);
 
%% Create network
spread = 0.03;
min_n = 10;
delta = 25;
max_n = 2001;
 
neurons = min_n:delta:max_n;
sses = zeros(1, length(neurons));
 
for i = 1:length(neurons)
    Ntrain = neurons(i); % Size of train data and num of neurons in rb
    raw_train = rand(1, Ntrain); % Generate random values for train data
    raw_train = cat(2, -raw_train(1:Ntrain/2), raw_train(Ntrain/2 + 1:end));
    target_train = my_fun(raw_train);
    net = newrbe(raw_train, target_train, spread);
    answer = net(raw_test);
    sses(i) = sse(target_test, answer);
end
 
hold on
plot(neurons, sses);
xlabel('neurons');
ylabel('sse');
set(gca, 'YScale', 'log');
hold off