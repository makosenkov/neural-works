function print(net, n)
    disp('Biases for neyrons');
    disp(net.b{1});
    for i = 1 : n
        disp(['Weights for the ', num2str(i), ' input ']);
        disp(net.IW{1,i});
    end  
end