clc; clear; close all; 

syms x; 
 

fx = 1/(x.^2 +1);
fdx = diff(fx);             % 1st derivative
fddx = diff(fdx);         % 2nd derivative
fdddx = diff(fddx);     % 3rd derivative
fddddx = diff(fdddx); % 4th derivative

% e = exp(1);
% fx = x*e^x;

lowL  = -2; 
highL =  2;

N = [2,3,4,5];

% Trapezoidal Rule
valTrap = zeros(1,length(N)); 
for i = 1:length(N)
    valTrap(i) = tranpezoidalIntegral(fx,lowL,highL,N(i));
end
X = sym('x');

% Get maximum value of second derivative function 
interval = -2:1:2;
for i = 1:length(interval)
    asdf(i) = vpa(subs(fddx,X,interval(i)));
end
[M,idx] = max(asdf);

% calculate the trapezoidal error
for i = 1:length(N)
    errTrap = (highL-lowL)^3/((12*N(i))^2)*abs(M);
end


% 1/3 Simpson Rule
valSimp = zeros(1,length(N)); 

for i = 1:length(N)
    valSimp(i) = simpsonIntegral(fx,lowL,highL,N(i));
end

% Get maximum value of fourth derivative function 
interval = -2:1:2;
for i = 1:length(interval)
    asdf(i) = vpa(subs(fddddx,X,interval(i)));
end
[M,idx] = max(asdf);

% calculate the 1/3 simpson error
for i = 1:length(N)
    errSimp(i) = (((highL-lowL)^5)/(180*N(i)^4))*abs(M);
end


% Gaussian Quadrature Rule
% valGauss = zeros(1,length(N)); 
for i = 1:length(N)
    valGauss(i) = nGaussIntegral(fx,lowL,highL,N(i));
end
