function neurons = task1_2_plot(goal, df)
    %% Prepare data
    Ntrain = 1000; % Size of train data
    Ntest = 1000;
    raw_train = rand(1, Ntrain); % Generate random values for train data
    % Make half data negative
    raw_train = cat(2, -raw_train(1:Ntrain/2), raw_train(Ntrain/2 + 1:end) );
    raw_test = rand(1, Ntest);
    raw_test = sort(cat(2, -raw_test(1:Ntest/2), raw_test(Ntest/2 + 1:end)));
    % Creating target data
    target_train = my_fun(raw_train);
    target_test = my_fun(raw_test);
    %% Create NN
    spread = 0.2;
    net = newrb(raw_train, target_train, goal, spread, Ntrain, df);
    neurons = net.layers{1}.size;
    answer = net(raw_test);
    hold on
    pl1 = plot(raw_test, target_test, 'xr');
    pl2 = plot(raw_test, answer, '-k');
    legend([pl1 pl2], 'Real', 'NN answer');
    title(['goal = ' num2str(goal)]);
    hold off