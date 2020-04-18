clc; close all; clear all; 

% fx = 1/((X^2) + 1)

x = [-2:0.01:2];
y = 1./((x.^2 + 1)); 

% Randomly pick 5 points on this function and apply the Newton’s and Lagrange’s Interpolation. 
% Graph the result and compare with the actual graph of f(x). Make sure to label the points 
% you pick.

newX_5 = [-2:1:2];
newY_5 = 1./((newX_5.^2+1));
randX = [-2, -1, 0, 1, 2];

% Pick 5 for NDD
newDD_5 = newtonInterEval(newX_5,newY_5,randX);

% Pick 5 for Lagrange
% SideNote: sorry but i misuderstood Lagrange and performed
% a quadratic lagrange like in the quizzes
lag_5= [-1.75 -1.25 0 0.35 1.50];
% newL_5 = lagrangeInterEval(x,y,)
newL_5 = zeros(1,5);
for i=1:5
    newL_5(i) = lagrangeInterEval(newX_5,newY_5, lag_5(i));
end

newP_5 = zeros(1,length(x)); 
for i = 1:length(x)
    newP_5(i) = newtonInterEval(newX_5,newY_5,x(i));
end


% Randomly pick 10 points on this function and 
% apply the Newton’s and Lagrange’s Interpolation. 
% Graph the result and compare with the actual graph 
% of f(x). Make sure to label the points you pick.
newX_10 = [-2, -1.6, -1.2, -0.8, -0.4, 0.4, 0.8, 1.6, 1.8, 2];
newY_10 = 1./((newX_10.^2) + 1);
rand10 = [-2 -1.5 -1.25 -1 0 0.25 0.75 1.25 1.75 2];

% pick 10 newtons
newDD_10 = newtonInterEval(newX_10,newY_10, rand10);

% pick 10 lags
newL_10 = zeros(1,10); 
for i=1:10
    newL_10(i) = lagrangeInterEval(newX_10,newY_10,rand10(i));  
end


hold on 

grid minor
plot (x,y, 'b'); %original

plot (newX_5,newDD_5,'redo'); % 5 newtons
plot(newX_10,newDD_10,'+'); %10 newtons

plot(newX_5,newL_5, '^'); 
plot(newX_10,newL_10, 's'); 

legend('Original', '5 Newton DP', '10 Newton DP', '5 Lagrange DP', '10 Lagrange DP');   
title('Lab 4 Part C')
xlabel('X values') 
ylabel('Y values') 
% xlim([-2.5 2.5])
% ylim([-0.1 1.1])
hold off

