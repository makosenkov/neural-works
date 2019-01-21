function RES = test_fcns(cfun, train_fun, learn_fun, niter, MAX_EPOCHS, goal)
    RES = zeros(niter, 2);
    accuracy = zeros(niter, 1);
    nepochs = zeros(niter, 1);
    X_Y1 = rand(1000, 2);
    test = get2classes(cfun, X_Y1);
    newr = rand(2000, 2);
    real = get2classes(cfun, newr);
    for j = 1:niter 
        clearvars -except cfun train_fun learn_fun niter accuracy nepochs MAX_EPOCHS goal j RES X_Y1 test newr real
        per = newp([0 1; 0 1], 1);
        per.inputWeights{1,1}.initFcn='rands'; 
        per.biases{1}.initFcn='rands';
        per= init(per);
        per.trainFcn = train_fun;
        per.inputWeights.learnFcn = {learn_fun};
        per.biases.learnFcn = {learn_fun};
        per.trainParam.epochs = MAX_EPOCHS;
        per.trainParam.goal = goal;
        per.trainParam.showWindow = 0;
        [per, f] = train(per, X_Y1', test');
        newp_res = per(newr');
        
        error = 0;
        for i = 1:length(newr)
            if (real(i) ~= newp_res(i)), error = error + 1; end
        end
        
        accuracy(j) = 1 - error / length(newr);
        nepochs(j) = length(f.epoch);
    end
    RES(:,1) = accuracy;
    RES(:,2) = nepochs;
end