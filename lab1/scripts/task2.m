net = network(1, 2, [1; 1], [1; 0], [0 0; 1 0], [0 1]);
net.inputs{1}.size = 5;
net.layers{1}.size = 5;
net.layers{2}.size = 1;
net.IW{1, 1} = [
    -1 -1 -1 1 -1;
    -1 1 -1 -1 1;
    1 -1 -1 -1 1;
    1 -1 1 -1 1;
    1 1 -1 -1 1;
    ];
net.LW{2, 1} = [ 1 1 1 1 1 ];
net.b{1} = [-.5 -1.5 -1.5 -2.5 -2.5]';
net.b{2} = -.5;
net.layers{1}.transferfcn = 'hardlim';
net.layers{2}.transferfcn = 'hardlim';
gensim(net);
p = [
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
    0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1;
    0 0 0 0 1 1 1 1 0 0 0 0 1 1 1 1 0 0 0 0 1 1 1 1 0 0 0 0 1 1 1 1;
    0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1;
    0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1;
];
 
p_res = sim(net, p);
 
per = newp([0 1; 0 1; 0 1; 0 1; 0 1], 1);
[per, f] = train(per, p(:,1:20), p_res(1:20));
newp_res = per(p);
errors = 0;
for i=1:length(p_res)
    if (p_res(i) ~= newp_res(i))
        errors = errors + 1;
    end
end
 
rel_err = errors / length(p_res)
rel_right = (length(p_res) - errors) / length(p_res)