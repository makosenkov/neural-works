function errmatrix = task3_trainlm (nrun, num_of_neurons, perf)
res = zeros(4, nrun);
for i = 1:nrun
    net = feedforwardnet(num_of_neurons, 'trainlm');
    net.trainParam.showWindow = 0;
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
 
    Ntrain = 4000;
    Ntest = 4000;
    
    raw_train = rand(1, Ntrain);
    raw_test = rand(1, Ntest);
    raw_train = cat(2, -raw_train(1:Ntrain/2), raw_train(Ntrain/2 + 1:end));
    raw_test = sort(cat(2, -raw_test(1:Ntest/2), raw_test(Ntest/2 + 1:end)));
    Ttrain = my_fun(raw_train);
    Ttest = my_fun(raw_test);
 
    net.trainParam.max_fail = 20;
    net.performFcn = perf;
    net.trainParam.mu = 0.003;              
    net.trainParam.mu_dec = 0.4;            
    net.trainParam.mu_inc = 1.25;             
    net.trainParam.mu_max = 1e10; 
    [net, tr] = train(net, raw_train, Ttrain);
    
    y = sim(net, raw_test);
    stop_code = 0;
    if (strcmp(tr.stop, 'Validation stop.')); stop_code = 1; 
    elseif (strcmp(tr.stop, 'Goal reached.')); stop_code = 2; end
    res(:, i) = [i tr.num_epochs sse(Ttest, y) stop_code]';
end
errmatrix = res;