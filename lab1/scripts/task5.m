clear all
MAX_EPOCHS = 20; 
train_fun = 'trainc'; 
learn_fcn = 'learnp';
X_Y1 = rand(1000, 2);
line_fun = @(x, y) -.5 * x - y + .75;
test = get2classes(line_fun, X_Y1);
per = newp([0 1; 0 1], 1);
per.inputWeights{1,1}.initFcn='rands'; 
per.biases{1}.initFcn='rands';
per= init(per);
per.trainFcn = train_fun;
per.inputWeights.learnFcn = {learn_fcn};
per.biases.learnFcn = {learn_fcn};
per.trainParam.epochs = 1;
per.trainParam.showWindow = 0;
WB = zeros(MAX_EPOCHS, 3); PERF = zeros(MAX_EPOCHS, 1);
epochs = 0;

while true
    [per, f] = train(per, X_Y1', test');
    WB(epochs + 1, :) = getwb(per);
    PERF(epochs + 1) = f.best_perf;
    epochs = epochs + 1;
    if f.best_perf == 0 , break; end
end
 
newr = rand(2000, 2);
real = get2classes(line_fun, newr);
newp_res = per(newr');
error = 0;
for i = 1:length(newr)
    if (real(i) ~= newp_res(i)), error = error + 1; end
end
disp(["Accuracy: " (1 - error/length(newr))]);
plot2classes(newr, real);
plot2classes(newr, newp_res');
 
WB = WB(1:epochs, :); PERF = PERF(1:epochs, :);
figure % Plot w1 and w2
hold on
plot(1:epochs, WB(:,2), 'r');
plot(1:epochs, WB(:,3), 'b');
legend(["w_{1}" 'w_{2}']);
hold off
figure % Plot w1 and b
hold on
plot(1:epochs, WB(:,2), 'r');
plot(1:epochs, WB(:,1), 'b');
legend(["w_{1}" "b"]);
hold off
figure % Plot w2 and b
hold on
plot(1:epochs, WB(:,3), 'r');
plot(1:epochs, WB(:,1), 'b');
legend(["w_{2}" "b"]);
hold off
figure % Plot performance
hold on
plot(1:epochs, PERF, 'r');
legend('perf');
hold off
 
if epochs < 10
    step = 1;
    last_ind = epochs;
else
    step = fix(epochs / 10);
    last_ind = 9;
end
figure
hold on
for i = 1:last_ind
    curi = (i * step);
    func = @(x) (WB(curi, 2) * x + WB(curi, 1)) / (-WB(curi, 3));
    fplot(func, [0 1]);
end
func = @(x) (WB(epochs, 2) * x + WB(epochs, 1)) / (-WB(epochs, 3));
fplot(func, [0 1], 'k--', 'LineWidth', 1.3);
axis([0 1 0 1])
axis square
hold off