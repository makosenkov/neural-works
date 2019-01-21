function neurons = task1_2(goal, df)
    %% Prepare data
    Ntrain = 1000; % Size of train data
    raw_train = rand(1, Ntrain); % Generate random values for train data
    % Make half data negative
    raw_train = cat(2, -raw_train(1:Ntrain/2), raw_train(Ntrain/2 + 1:end) );
    % Creating target data
    target_train = my_fun(raw_train);
    spread = 0.2;
    net = newrb(raw_train, target_train, goal, spread, Ntrain, df);
    neurons = net.layers{1}.size;