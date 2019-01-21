P = zeros(32, 5);
T = zeros(32, 1);
 
% Fill the matrix P
for i = 1:length(P)
   if mod(i, 2) == 0
       P(i, 5) = 1;
   end 
   if mod(fix((i - 1)/ 2), 2) == 1
       P(i, 4) = 1;
   end
   if mod(fix((i - 1)/ 4), 2) == 1
       P(i, 3) = 1;
   end
   if mod(fix((i - 1)/ 8), 2) == 1
       P(i, 2) = 1;
   end
   if mod(fix((i - 1)/ 16), 2) == 1
       P(i, 1) = 1;
   end
end
 
% Fill the matrix T 
T(2) = 1;
T(9) = 1;
T(17) = 1;
T(21) = 1;
T(25) = 1;