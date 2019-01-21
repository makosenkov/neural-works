invert = @(e) (e ~= 1);
rng(777);
N = 1000;
r = rand(2, N)';
res = is_in_area(r);
 
inverted5 = res;
inverted10 = res;
inverted20 = res;
 
rand5indicies = randperm(N, round(N * 0.05));
rand10indicies = randperm(N, round(N * 0.1));
rand20indicies = randperm(N, round(N * 0.2));
 
for index = rand5indicies
    inverted5(index) = invert(res(index));
end
for index = rand10indicies
    inverted10(index) = invert(res(index));
end
for index = rand20indicies
    inverted20(index) = invert(res(index));
end

C5 = confmatr(res, inverted5, [0 1]);
C10 = confmatr(res, inverted10, [0 1]);
C20 = confmatr(res, inverted20, [0 1]);

AERR5 = averrprob(C5);
AERR10 = averrprob(C10);
AERR20 = averrprob(C20);

ARIG5 = avrightprob(C5);
ARIG10 = avrightprob(C10);
ARIG20 = avrightprob(C20);

ALPERR5 = alphaerr(C5);
ALPERR10 = alphaerr(C10);
ALPERR20 = alphaerr(C20);

FALPOS5 = falsepos(C5);
FALPOS10 = falsepos(C10);
FALPOS20 = falsepos(C20);

SPECIFILITY5 = C5(1,1) / sum(sum(C5));
SPECIFILITY10 = C10(1,1) / sum(sum(C10));
SPECIFILITY20 = C20(1,1) / sum(sum(C20));

SENSITIVITY5 = C5(2,2) / sum(sum(C5));
SENSITIVITY10 = C10(2,2) / sum(sum(C10));
SENSITIVITY20 = C20(2,2) / sum(sum(C20));