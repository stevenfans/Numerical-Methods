x = [0,1,2,4,5,6]; 
y = [1,14,15,5,6,19]; 
% x = [15,18,22]; 
% y = [24,37,25]; 


% a = newtonIter(x,y); 

val = newtonInterEval(x,y,3); 


% b(:1 )= y';
% for i = 2:length(x)
%     for j = i:length(x)
%         b(i,j) = (b(i-1,j-1)-b(i,j-1)) / (x(i-j+1)-x(i));
%     end
% end
% a = diag(b)';
% disp(a);


%%
 % Newton's divided difference
 % Find the approximate value of f(1.5) from 
 % (x,y)= (0,1), (1,e), (2,e^2) & (3,e^3). 
 
 n = input('Enter n for (n+1) nodes, n:  ');
 x = zeros(1,n+1);
 y = zeros(n+1,n+1);
 
 for i = 0:n
   fprintf('Enter x(%d) and f(x(%d)) on separate lines:  \n', i, i);
   x(i+1) = input(' ');
   y(i+1,1) = input(' ');
 end
 x0 = input('Now enter a point at which to evaluate the polynomial, x = ');
 
 n = size(x,1);
 if n == 1
    n = size(x,2);
 end

 for i = 1:n
    D(i,1) = y(i);
 end

 for i = 2:n
    for j = 2:i
       D(i,j)=(D(i,j-1)-D(i-1,j-1))/(x(i)-x(i-j+1));
    end
 end

 fx0 = D(n,n);
 for i = n-1:-1:1
    fx0 = fx0*(x0-x(i)) + D(i,i);
 end
fprintf('Newtons iterated value: %11.8f \n', fx0)