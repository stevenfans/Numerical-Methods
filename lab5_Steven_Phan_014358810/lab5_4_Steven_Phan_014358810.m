clc; clear; close all; 

syms x; 

fx = 1/(x.^2 +1);
fdx = diff(fx);
% e = exp(1);
% fx = x*e^x;

lowL  = -2; 
highL =  2;

N = [2,3,4,5];

valTrap = zeros(1,length(N)); 

for i = 1:length(N)
    valTrap(i) = tranpezoidalIntegral(fx,lowL,highL,N(i));
end

errTrap = ((b-a)^3)/(12*N); 

valSimp = zeros(1,length(N)); 

for i = 1:length(N)
    valSimp(i) = simpsonIntegral(fx,lowL,highL,N(i));
end

valGauss = zeros(1,length(N)); 

for i = 1:length(N)
    valGauss(i) = nGaussIntegral(fx,lowL,highL,N(i));
end