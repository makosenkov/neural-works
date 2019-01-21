net = network(1, 3, [1; 1; 1], [1; 0; 0], [0 0 0; 1 0 0; 0 1 0], [0 0 1]);
net.inputs{1}.size = 2;
net.layers{1}.size = 13;
net.layers{2}.size = 4;
net.layers{3}.size = 5;
net.IW{1, 1} = [
    1 -1 1 -1 1 -1 0 0 0 0 0 0 -1;
    0 0 0 0 0 0 1 -1 1 -1 1 -1 -1
    ]';
net.LW{2, 1} = [
    1 1 0 0 0 0 1 1 0 0 0 0 0;
    0 0 1 1 0 0 0 0 1 1 0 0 0;
    0 0 0 0 1 0 0 0 0 0 1 0 1;
    0 0 0 0 0 1 0 0 0 0 0 1 0;
];
net.LW{3, 2} = [
    1 0 0 0 0;
    0 1 0 0 0;
    0 0 1 0 0;
    0 0 0 1 0;
]';
net.b{1} = [-.3 .5 -.8 .9 -.4 .6 -.3 .6 -.25 .55 -.7 .25 1.3 ]';
net.b{2} = [-3.5 -3.5 -2.5 -1.5]';
net.b{3} = [-.5 -.5 -.5 -.5 -.5]';
net.layers{1}.transferfcn = 'hardlim';
net.layers{2}.transferfcn = 'hardlim';
net.layers{3}.transferfcn = 'hardlim';
gensim(net);
r = rand(10000, 2);
test = sim(net, r');
real = is_in_area2(r, 2);
error = 0;
for i = 1:length(r)
    if (~isequal(test(:,i), real(:,i))) error = error + 1;
    end
end
plot5classes(r, test);