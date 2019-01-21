function [cross, mse_] = task2(spread, Ntrain, pl)
    % Preparing
    Ntest = 4000;
    raw_train = rand(2, Ntrain);
    raw_test = rand(2, Ntest);
    Ttrain = is_in_area(raw_train');
    Ttest = is_in_area(raw_test');
    t = [Ttrain; ~Ttrain];
    
    net = newpnn(raw_train, t, spread);
    answer = net(raw_test);
    cross = crossentropy([Ttest; ~Ttest]', answer');
    mse_ = mse([Ttest; ~Ttest]', answer');
    if pl; plot2classes(raw_test', answer'); end