function myplot(X, testing, title_)
    figure
    hold on
    title(title_);
    [~,~,l] = size(X);
    scatter(X(1,:,testing), X(2,:,testing), 'b', 'filled');
    for i = 1:l
        if i ~= testing
            scatter(X(1,:,i), X(2,:,i), 'r', 'filled');
        end
    end
    axis([0 1 0 1])
    axis square
    legend(["Тестовая" "Обучающая"]);
    hold off
end