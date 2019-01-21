    layers = [15, 5, 3];
    train_alg = 4;
    arch_type = 1;
    perf_fcn = 4;
    to_fun = 2;
    % Preparing
    Ntrain = 10000;
    Ntest = 3000;
    raw_train = rand(2, Ntrain);
    raw_test = rand(2, Ntest);
    % is_in_area from lab0
    Ttrain = is_in_area(raw_train');
    Ttest = is_in_area(raw_test');
 
    net = createnn(train_alg, layers, arch_type, to_fun);
    net = setParams(net, train_alg, perf_fcn);
    
    view(net)
    
    t = [Ttrain; ~Ttrain];
    net = train(net, raw_train, t);
    y = sim(net, raw_test);
    y2 = zeros(1, Ntest);
    
    for i = 1:Ntest
       if (y(1,i) > y(2,i)); y2(i) = 1;
       else; y2(i) = 0; end
    end
    % plot2classe from lab0
    plot2classes(raw_test', y2);
    crossentropy([Ttest; ~Ttest], y)
 
    function net = createnn(ftype, hidden_neurons, atype, tofun)
        tfuns = {'traingdx', 'traincgf', 'trainbfg', 'trainlm'};
        trans_out_funs = {'logsig', 'softmax'};   
        if atype == 1
            net = feedforwardnet(hidden_neurons, tfuns{ftype});
        elseif atype == 2
            net = cascadeforwardnet(hidden_neurons, tfuns{ftype});
        end
        net.layers{length(hidden_neurons) + 1}.size = 2;
        net.layers{length(hidden_neurons) + 1}.transferFcn = trans_out_funs{tofun};
        net.numInputs = 2;
%         Create connection from each input
        net.inputConnect = [1 1; net.inputConnect(2:end, :)];
        net.inputs{1}.range = [-1 1];
        net.inputs{2}.range = [-1 1];
        net = init(net);
    end
    
    function neto = setParams(net, ftype, pfcn) 
        pfcns = {'mse', 'mae', 'sse', 'sae', 'crossentropy'};
        net.performFcn = pfcns{pfcn};
        trainParam = net.trainParam;
        trainParam.epochs = 6000;
        trainParam.time = Inf;
        trainParam.goal = 0.008;
        trainParam.min_grad = 1e-05;
        trainParam.max_fail = 40;  
        switch ftype
            case 1 %traingdx
                trainParam.lr = 0.01;
                trainParam.mc = 0.75;
                trainParam.lr_inc = 1.3;
                trainParam.lr_dec = 0.5;
                trainParam.max_perf_inc  = 1.1;
            case {2, 3} % traincgf, trainbfg
                if ftype == 2
                    trainParam.searchFcn = 'srchcha';
                else
                    trainParam.searchFcn = 'srchbac';
                end
                trainParam.scale_tol = 15; 
                trainParam.alpha = 0.00001;
                trainParam.beta = 0.1;
                trainParam.delta = 0.1;
                trainParam.gama = 0.00001;
                trainParam.low_lim = 0.1;
                trainParam.up_lim = 0.5;
                trainParam.max_step = 100;
                trainParam.min_step = 1.0e-6;
                trainParam.bmax = 26;
                if ftype == 3
                    trainParam.batch_frag = 15;          
                end
            case 4 % trainlm
                trainParam.mu = 0.001;              
                trainParam.mu_dec = 0.6;            
                trainParam.mu_inc = 1.25;
                trainParam.mu_max = 1e10;           
        end
        net.trainParam = trainParam;
        neto = net;
    end