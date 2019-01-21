rng(777);
N = 1000;
r = rand(2, N)';
K = 0.2;
testindecies = randperm(N, round(N * K));
baseindecies = 1:N;
baseindecies(testindecies) = [];
test = r(testindecies, :);
base = r(baseindecies, :);
 
figure
hold on
title('Разделение выборки на обучающую и тестовую');
scatter(test(:,1), test(:,2), 'r');
scatter(base(:,1), base(:,2), 'b', 'filled');
axis([0 1 0 1])
axis square
legend(["Тестовая" "Обучающая"]);
hold off
 
k = 4;
reshaped4 = reshape(r', [2 N/k k]);
k = 8;
reshaped8 = reshape(r', [2 N/k k]);

myplot(reshaped4, 1, 'Кросс-валидация, k = 4');
myplot(reshaped8, 1, 'Кросс-валидация, k = 8');