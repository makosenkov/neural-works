net = network(1, 3, [1; 1; 1], [1; 0; 0], [0 0 0; 1 0 0; 0 1 0], [0 0 1]);
net.inputs{1}.size = 2;
net.layers{1}.size = 8;
net.layers{2}.size = 4;
net.layers{3}.size = 1;
net.IW{1, 1} = [
1 1 -1 -1 0 0 0 0; 
0 0 0 0 1 1 -1 -1
]';
net.LW{2, 1} = [
0 0 1 0 1 0 0 1;
1 0 0 1 0 1 0 0;
0 1 0 0 1 0 0 1;
1 0 0 1 0 0 1 0;
];
net.LW{3, 2} = [1 1 1 1];
net.b{1} = [ -.25 -.75 .25 .75 -.25 -.75 .25 .75]';
net.b{2} = [-2.5 -2.5 -2.5 -2.5]';
net.b{3} = -.5;
net.layers{1}.transferfcn = 'hardlim';
net.layers{2}.transferfcn = 'hardlim';
net.layers{3}.transferfcn = 'hardlim';
%gensim(net);
p = [
.125 .375 .625 .875 .125 .375 .625 .875 .125 .375 .625 .875 .125 .375 .625 .875;
.125 .125 .125 .125 .375 .375 .375 .375 .625 .625 .625 .625 .875 .875 .875 .875;
];
p_res = [0 1 1 0 1 0 0 1 1 0 0 1 0 1 1 0];
%plot2classes(p', p_res);
 
X = rand(1000, 2);
test = sim(net, X');
%plot2classes(X, test);
 
per = newp([0 1; 0 1], 1);
  
[per, f] = train(per, X', test);
 per(p);
 r = rand(2000, 2);
 result = per(r');
plot2classes(r, result);