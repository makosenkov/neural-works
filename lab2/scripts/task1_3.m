function task1_3
E1_X = [1 2 1 3 1 2 1];
E1_T = [1 2.3 1 3 1 2 1.3];
disp('E1');
disp('mae');
mae(E1_X, E1_T)
disp('mse');
mse(E1_X, E1_T)
disp('sae');
sae(E1_X, E1_T)
disp('sse');
sse(E1_X, E1_T)
disp('E2');
E2_X = E1_X / 100;
E2_T = E1_T / 100;
disp('mae');
mae(E2_X, E2_T)
disp('mse');
mse(E2_X, E2_T)
disp('sae');
sae(E2_X, E2_T)
disp('sse');
sse(E2_X, E2_T)
 
E = [1 0 0 0 0 0 0];
E1 = [0.7 0.1 0.05 0.05 0.05 0.03 0.02];
crossentropy(E, E1)