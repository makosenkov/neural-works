nmin = 25; ndelta = 5; nmax = 85; nrun = 7;
perf = 'sse';
means = zeros(1, (nmax - nmin) / ndelta + 1);
for i = nmin:ndelta:nmax
    x = task3_trainlm (nrun, i, perf);
    % mean of sse
    mean = sum(x(3,:))/nrun;
    means(fix((i - nmin) / ndelta) + 1) = mean;
end
plot(nmin:ndelta:nmax, means, 'r');