X = rand(1, 5000);
X = cat(2, -X(1:2500), X(2501:end) );
Y = my_fun(X);
 
x = linspace(-1, 1, 1000);
y =  sin(2.^(5-x));
figure
hold on
scatter(X, Y, 'r');
plot(x, y, 'b', 'LineWidth', 2);
legend(["By my\_fun" "Inmmediate"]);
hold off