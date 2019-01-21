function plot_spread_and_err(start_spread, step_spread, end_spread)
    %% Prepare data
    Ntrain = 1000; % Size of train data
    Ntest = 2000; % Size of test data
    raw_train = rand(1, Ntrain); % Generate random values for train data
    % Make half data negative
    raw_train = cat(2, -raw_train(1:Ntrain/2), raw_train(Ntrain/2 + 1:end) );
    raw_test = rand(1, Ntest);
    raw_test = sort(cat(2, -raw_test(1:Ntest/2), raw_test(Ntest/2 + 1:end)));
    % Creating target data
    target_train = my_fun(raw_train);
    target_test = my_fun(raw_test);
    spreads = start_spread:step_spread:end_spread;
    err = zeros(1, length(spreads));
    for i = 1:length(spreads)
        spread = spreads(i);
        net = newrbe(raw_train, target_train, spread);
        answer = net(raw_test);
        err(i) = sse(target_test, answer);
    end
    [~, minind] = min(err);
    hold on
    plot(spreads, err, 'r');
    set(gca, 'YScale', 'log');
    set(gca, 'XTick', sort([spreads(minind), get(gca, 'XTick')]));
    hold off
end