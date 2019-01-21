net = network(1, 3, [1; 1; 1], [1; 0; 0], [0 0 0; 1 0 0; 0 1 0], [0 0 1]);
net.inputs{1}.size = 2;
net.layers{1}.size = 14;
net.layers{2}.size = 4;
net.layers{3}.size = 1;
net.IW{1, 1} = [
1 -1 0 0 1 -1 -1 -1 1 1 -1 -1 1 1 ; 
0 0 1 -1 0 1 -1 1 -1 1 -1 0 -1 1
]';

net.LW{2, 1} = [
1.0 0.0 0.0 0.0 ;
1.0 0.0 0.0 0.0 ;
1.0 0.0 0.0 0.0 ;
1.0 0.0 0.0 0.0 ;
0.0 1.0 0.0 0.0 ;
0.0 1.0 0.0 0.0 ;
0.0 1.0 0.0 0.0 ;
0.0 0.0 1.0 0.0 ;
0.0 0.0 1.0 0.0 ;
0.0 0.0 1.0 0.0 ;
0.0 0.0 1.0 0.0 ;
0.0 0.0 0.0 1.0 ;
0.0 0.0 0.0 1.0 ;
0.0 0.0 0.0 1.0 ;
]';
net.LW{3, 2} = [1 1 1 1];
net.b{1} = [-0.2 0.4 -0.8 0.9 -0.2 0.1 0.7 0.3 0.3 -0.7 1.3 0.6 -0.3 -0.7]';
net.b{2} = [-3.5 -2.5 -3.5 -2.5]';
net.b{3} = -.5;
net.layers{1}.transferfcn = 'hardlim';
net.layers{2}.transferfcn = 'hardlim';
net.layers{3}.transferfcn = 'hardlim';
gensim(net);
X = rand(2000, 2);
test = sim(net, X');

plot2classes(X, test);
subX = X(1:1000,:);

subT = test(1:1000);
subX2 = X(1000:end,:);
subT2 = test(1000:end);

per = newp([0 1; 0 1], 1);
per= init(per);
[per, f] = train(per, subX', subT);
result = per(subX2');
plot2classes(subX2, result);

error = 0;
for i = 1:1000
if (subT2(i) ~= result(i)) 
error = error + 1;
end
end

error / length(subT2)