function surface = errsurf(start_n, delta_n, end_n, start_s, delta_s, end_s)
    neurons = start_n:delta_n:end_n;
    spreads = start_s:delta_s:end_s;
    errs = zeros(length(neurons), length(spreads));
    for i = 1:length(neurons)
        for j = 1:length(spreads)
            [cross, ~] = task3(spreads(j), neurons(i), 0);
            errs(i, j) = cross;
        end 
    end
    surface = errs;
    figure 
    surf(neurons, spreads, errs,'FaceAlpha',0.8);
    colorbar
    xlabel('neurons');
    ylabel('spread');
    zlabel('crossentropy');
    hold on
    s = size(errs);
    z = zeros(s);
    surf(neurons, spreads, z, errs);
    xlim([start_n end_n]);
    ylim([start_s end_s]);
    view(127.5, 30)