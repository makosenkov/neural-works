function plot_goal_and_neurons(start_, step_, end_)
    % BEFORE YOU RUN THIS FUNCTION, PLEASE COMMENT NEXT LINES
    % IN THE STANDART MATLAB FILE newrb: 233 228 195 193 227
    % TO SUPRESS PRINTING AND PLOTTING
    goals = start_:step_:end_;
    neurons = zeros(1, length(goals));
    ind = 1;
    for goal = goals
        neurons(ind) = task1_2(goal, 1);
        ind = ind + 1;
    end
    close all
    figure; hold on
    plot(goals, neurons, '');
    xlabel('goal');
    ylabel('neurons');
    xlim([0 0.1]);
    hold off