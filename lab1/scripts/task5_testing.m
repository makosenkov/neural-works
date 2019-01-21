clear all
how_many_iter = 20;
max_epochs = 1000;
line_fun = @(x, y) -.5 * x - y + .75;

trainc_learnp = test_fcns(line_fun, 'trainc', 'learnp', how_many_iter, max_epochs, 0);
disp("Trainc and Learnp");
disp(["Average accuracy" sum(trainc_learnp(:,1)) / how_many_iter]);
disp(["Average epochs" sum(trainc_learnp(:,2)) / how_many_iter]);
 
trainc_learnpn = test_fcns(line_fun, 'trainc', 'learnpn', how_many_iter, max_epochs, 0);
disp("Trainc and Learnpn");
disp(["Average accuracy" sum(trainc_learnpn(:,1)) / how_many_iter]);
disp(["Average epochs" sum(trainc_learnpn(:,2)) / how_many_iter]);
 
trainr_learnp = test_fcns(line_fun, 'trainr', 'learnp', how_many_iter, max_epochs, 0);
disp("Trainr and Learnp");
disp(["Average accuracy" sum(trainr_learnp(:,1)) / how_many_iter]);
disp(["Average epochs" sum(trainr_learnp(:,2)) / how_many_iter]);
 
trainr_learnpn = test_fcns(line_fun, 'trainr', 'learnpn', how_many_iter, max_epochs, 0);
disp("Trainr and Learnpn");
disp(["Average accuracy" sum(trainr_learnpn(:,1)) / how_many_iter]);
disp(["Average epochs" sum(trainr_learnpn(:,2)) / how_many_iter]);
 
trainb_learnp = test_fcns(line_fun, 'trainb', 'learnp', how_many_iter, max_epochs, 0);
disp("Trainb and Learnp");
disp(["Average accuracy" sum(trainb_learnp(:,1)) / how_many_iter]);
disp(["Average epochs" sum(trainb_learnp(:,2)) / how_many_iter]);
 
trainb_learnpn = test_fcns(line_fun, 'trainb', 'learnpn', how_many_iter, max_epochs, 0);
disp("Trainb and Learnpnp");
disp(["Average accuracy" sum(trainb_learnpn(:,1)) / how_many_iter]);
disp(["Average epochs" sum(trainb_learnpn(:,2)) / how_many_iter]);