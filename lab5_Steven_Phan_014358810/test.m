
syms x; 

e = exp(1);
fx = x*e^x;
fx = 5*x*e^(-2*x);
% fx = 1/(x^2 + 1);

% val = tranpezoidalIntegral(fx, 0.2, 2.2, 3)
% val = simpsonIntergral(fx, 0.2, 2.2, 4);  
val = nGaussIntegral(fx,0.1,1.3,3)

