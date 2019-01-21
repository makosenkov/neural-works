function task1_1(n, m, layer_fun, weight_fun, bias_fun) 
    rng('default');
    lfuns = {'initnw', 'initwb'};
    ifuns = {'initzero', 'rands', 'randsmall', ... % 1-3
    'midpoint', 'randnc', 'randnr', 'initlvq', 'initsompc', ...
    'initcon' % 9 
    };
    net = network(n, 1, 1, ones(1, n), 0, 1);
    net.layers{1}.size = m;
    net.layers{1}.initFcn = lfuns{layer_fun};
    net.biases{1}.initFcn = ifuns{bias_fun};
    for i = 1 : n
        net.inputs{i}.size = 1;
        net.inputWeights{i}.initFcn = ifuns{weight_fun};
    end
    net = init(net);
    print(net, n);
end