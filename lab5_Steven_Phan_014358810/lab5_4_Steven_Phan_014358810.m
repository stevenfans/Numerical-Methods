% Steven Phan 
clc; clear; close all; 

syms x; 
X = sym('x');

fx = 1/(x.^2 +1);
fdx = diff(fx);             % 1st derivative
fddx = diff(fdx);         % 2nd derivative
fdddx = diff(fddx);     % 3rd derivative
fddddx = diff(fdddx); % 4th derivative

lowL  = -2; 
highL =  2;

N = [2,3,4,5];

% Get exact integral value
intF = vpa(int(fx,X,lowL,highL)); 
fprintf('True Integral Value: %2.6f\n\n', intF); 


% Trapezoidal Rule
valTrap = zeros(1,length(N)); 
for i = 1:length(N)
    valTrap(i) = tranpezoidalIntegral(fx,lowL,highL,N(i));
end

% Calculate Relative True Error
for i = 1:length(N) 
    errTrap(i) = abs((intF-valTrap(i))/intF) * 100; 
end

disp('TRAPEZOIDAL RULE');
fprintf('%0s%23s\n', 'Trapezoidal Approx.','Relative True Error');
A = [valTrap; errTrap]; 
fprintf('    %2.6f                      %10.6f \n', A);
fprintf('\n');


% 1/3 Simpson Rule
for i = 1:length(N)
    valSimp(i) = simpsonIntegral(fx,lowL,highL,N(i));
end
% remove all the NaN
test  = find(valSimp=='NaN');
for i = length(test):-1:1
    L = test(i);
    valSimp(L) = [];
end

% Calculat Relative True Error
for i = 1:length(valSimp)
    errSimp(i) = abs((intF-valSimp(i))/intF) * 100; 
end

disp('1/3 SIMPSON RULE');
fprintf('%0s%23s\n', '1/3 Simpson Approx.','Relative True Error');
A = [valSimp; errSimp]; 
fprintf('    %2.6f                      %10.6f \n', A);
fprintf('\n');


% Gaussian Quadrature Rule
for i = 1:length(N)
    valGauss(i) = nGaussIntegral(fx,lowL,highL,N(i));
end

% Calculate the Relative True Error
for i = 1:length(N)
    errGauss(i) = abs((intF-valGauss(i))/intF) * 100; 
end

disp('GUASS QUADRATURE RULE');
fprintf('%0s%23s\n', 'Gauss Quad Approx.','Relative True Error');
A = [valGauss; errGauss]; 
fprintf('    %2.6f                      %10.6f \n', A);
fprintf('\n');