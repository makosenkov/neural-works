function task2_2 (mult)
rng('default')
close all;
Ntrain = 500; % Size of train data
Ntest = 500; % Size of test data
raw_train = rand(1, Ntrain); % Generate random values for train data
raw_train = sort(cat(2, -raw_train(1:Ntrain/2), raw_train(Ntrain/2 + 1:end)));
raw_test = rand(1, Ntest);
raw_test = sort(cat(2, -raw_test(1:Ntest/2), raw_test(Ntest/2 + 1:end)));
Ttrain = my_fun(raw_train);
Ttest = my_fun(raw_test);
maxlr = mult * maxlinlr(raw_train,'bias');
delta_epochs = 1;
n_delta = 40;
net = newlin(raw_train,1,0, maxlr);
net.trainParam.showWindow = 0;
net.iw{1} = -.9;
net.b{1} = -.32;
net.trainparam.epochs = delta_epochs;
w = zeros(n_delta +1,2); 
w(1,:) = [net.iw{1} net.b{1}]; 
for i = 1: n_delta
    net = train(net,raw_train,Ttrain);
    w(i+1,1) = net.iw{1};
    w(i+1,2) = net.b{1};
end
subplot(2,1,1);
w_range = -1:0.1:1; 
b_range = -1:0.1:1;
ES = errsurf(raw_train,Ttrain,w_range,b_range,'purelin'); 
contour(w_range, b_range, ES); 
hold on; 
grid on; 
plot(w(:,1), w(:,2), '-ro');
xlabel('w_{1}'); ylabel('b');
subplot(2,1,2);
plot(raw_train,Ttrain, '-ro');
hold on; grid on;
Y = sim(net,raw_test);
plot(raw_test,Y, '-bx');
legend({'Desire', 'Real'});
xlabel('x'); ylabel('y');
fprintf('mse: %f; \tmae: %f\n', mse(Ttest, Y), mae(Ttest, Y));
fprintf('sse: %f; \tsae: %f\n', sse(Ttest, Y), sae(Ttest, Y));
w(:,1)
w(:,2)