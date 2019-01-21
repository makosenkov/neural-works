function [cross, mse_] = task3(spread, Ntrain, pl)
    % Preparing
    Ntest = 4000;
    raw_train = rand(2, Ntrain);
    raw_test = rand(2, Ntest);
    Ttrain = is_in_area2(raw_train', 2);
    Ttest = is_in_area2(raw_test', 2);
 
    
    net = newpnn(raw_train, Ttrain, spread);
    %view(net);
    answer = net(raw_test);
    cross = crossentropy(Ttest, answer)
    mse_ = mse(Ttest, answer)
    %if pl
       % figure; plot5classes(raw_test', answer); 
        %figure; plotconfusion(Ttest, answer);
    end