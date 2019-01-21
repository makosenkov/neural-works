rng('default')
Ntrain = 1000; % Size of train data
Ntest = 2000; % Size of test data

raw_train = rand(1, Ntrain); % Generate random values for train data
raw_train = cat(2, -raw_train(1:Ntrain/2), raw_train(Ntrain/2 + 1:end) );
raw_test = rand(1, Ntest);
raw_test = cat(2, -raw_test(1:Ntest/2), raw_test(Ntest/2 + 1:end) );
target_train = my_fun(raw_train);
target_test = my_fun(raw_test);

net = network(1, 1, 1, 1, 0, 1);
net.inputs{1}.size = 1;
net.layers{1}.initFcn = 'initnw';
net.layers{1}.size = 1;

net = init(net);
net.trainFcn = 'trainscg';
net.trainParam.epochs = 1; 

net = train(net, raw_train, target_train);
net_answer_1 = sim(net, raw_test);
netwb_1 = getwb(net); % ax + b, a and b
net = train(net, raw_train, target_train);
net_answer_2 = sim(net, raw_test);
netwb_2 = getwb(net);
net = train(net, raw_train, target_train);
net_answer_3 = sim(net, raw_test);
netwb_3 = getwb(net);

netl = newlind(raw_train, target_train);
netl_answer = sim(netl, raw_test);
netlwb = getwb(netl);
figure
hold on
scatter(raw_train, target_train, 'r');
plot(raw_test, netlwb(2) * raw_test + netlwb(1), 'b');
plot(raw_test, netwb_1(2) * raw_test + netwb_1(1), 'm');
plot(raw_test, netwb_2(2) * raw_test + netwb_2(1), 'c');
plot(raw_test, netwb_3(2) * raw_test + netwb_3(1), 'g');
legend(["real" "By newlind" "After 1 epoch" "After 2 epochs" "After 3 epochs"]);
axis([-1 1 -1 1])
axis square
hold off
mae(target_test, net_answer_1)
mae(target_test, net_answer_2)
mae(target_test, net_answer_3)
mae(target_test, netl_answer)