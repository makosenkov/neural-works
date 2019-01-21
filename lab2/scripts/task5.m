    layers = [17, 5, 5];
    train_alg = 4;
    arch_type = 1;
    perf_fcn = 5;
    to_fun = 2;    
% Preparing
    Ntrain = 10000;
    Ntest = 2000;
    raw_train = rand(2, Ntrain);
    raw_test = rand(2, Ntest);
    Ttrain = is_in_area2(raw_train', 2);
    Ttest = is_in_area2(raw_test', 2);
    
    net = createnn(train_alg, layers, arch_type, to_fun);
    net = setParams(net, train_alg, perf_fcn);
    
    view(net)
    
    net = train(net, raw_train, Ttrain);
    y = sim(net, raw_test);
    y2 = zeros(1, Ntest);
    
    for i = 1:Ntest
       [~, ind] = max(y(:,i));
       y2(ind, i) = 1;
    end
    
    plot5classes(raw_test', y2);
    crossentropy(Ttest, y)
    
    function net = createnn(ftype, hidden_neurons, atype, tofun)
        tfuns = {'traingdx', 'traincgf', 'trainbfg', 'trainlm'};
        trans_out_funs = {'logsig', 'softmax'};
        
        if atype == 1
            net = feedforwardnet(hidden_neurons, tfuns{ftype});
        elseif atype == 2
            net = cascadeforwardnet(hidden_neurons, tfuns{ftype});
        end
        net.layers{length(hidden_neurons) + 1}.size = 5;
        net.layers{length(hidden_neurons) + 1}.transferFcn = trans_out_funs{tofun};
        net.numInputs = 2;
%         Create connection from each input
        net.inputConnect = [1 1; net.inputConnect(2:end, :)];
        net.inputs{1}.range = [0 1];
        net.inputs{2}.range = [0 1];
        net = init(net);
    end
    
    function neto = setParams(net, ftype, pfcn) 
        pfcns = {'mse', 'mae', 'sse', 'sae', 'crossentropy'};
        net.performFcn = pfcns{pfcn};
        trainParam = net.trainParam;
        trainParam.epochs = 6000;
        trainParam.time = Inf;
        trainParam.goal = 0.001;
        trainParam.min_grad = 1e-05;
        trainParam.max_fail = 40;
       
        switch ftype
            case 1 %traingdx
                trainParam.lr = 0.01;
                trainParam.mc = 0.9;
                trainParam.lr_inc = 1.4;
                trainParam.lr_dec = 0.3;
                trainParam.max_perf_inc  = 1.04;
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
                trainParam.gama = 0.001;            
                trainParam.low_lim = 0.1;           
                trainParam.up_lim = 0.5;          
                trainParam.max_step = 100;           
                trainParam.min_step = 1.0e-6;        
                trainParam.bmax = 26;               
                if ftype == 3
                    trainParam.batch_frag = 10;          
                end
            case 4 % trainlm
                trainParam.mu = 0.001;              % Initial mu
                trainParam.mu_dec = 0.6;            % mu decrease factor
                trainParam.mu_inc = 1.25;             % mu increase factor
                trainParam.mu_max = 1e10;           % Maximum mu
        end
        net.trainParam = trainParam;
        neto = net;
    end