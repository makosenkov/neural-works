% Part 1
net = feedforwardnet(32, 'trainlm');
net.inputs{1}.range = [0 1];
net.inputs{1}.size = 1;
net.layers{2}.size = 1;
net.layers{1}.initFcn = 'initwb';
net.layers{2}.initFcn = 'initwb';
net.layerWeights{1}.initFcn = 'rands';
net.layerWeights{2}.initFcn = 'rands';
net.biases{1}.initFcn = 'rands';
net.biases{2}.initFcn = 'rands';
net.inputWeights{1}.initFcn = 'rands';
net = init(net);
view(net)
% Part 2 
Ntrain = 3000;
Ntest = 9000;
raw_train = rand(1, Ntrain);
raw_test = rand(1, Ntest);
raw_train = cat(2, -raw_train(1:Ntrain/2), raw_train(Ntrain/2 + 1:end));
raw_test = sort(cat(2, -raw_test(1:Ntest/2), raw_test(Ntest/2 + 1:end)));
Ttrain = my_fun(raw_train);
Ttest = my_fun(raw_test);
% Part 3
net.trainParam.goal = 0.9;
net.trainParam.max_fail = 50;
net.performFcn = 'sse';
 
% Part 4 set params
net.trainParam.mu = 0.002;              % Initial mu
net.trainParam.mu_dec = 0.5;            % mu decrease factor
net.trainParam.mu_inc = 1.22;             % mu increase factor
net.trainParam.mu_max = 1e10; 
net = train(net, raw_train, Ttrain);
y = sim(net, raw_test);
 
hold on
scatter(raw_test, y, 'r');
scatter(raw_test, Ttest, 'b');
legend(["NN", "Real"]);
hold off
 
fprintf('mae: %f \t mse : %f \nsae : %f \t sse : %f', ...
mae(y, Ttest), mse(y, Ttest), sae(y, Ttest), sse(y, Ttest));