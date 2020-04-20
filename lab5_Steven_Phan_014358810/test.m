
syms x; 

e = exp(1);
fx = e^x;

% val = tranpezoidalIntegral(fx, 0.2, 2.2, 3)
val = simpsonIntergral(fx, 0.2, 2.2, 4); 

