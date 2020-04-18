% x = [0,1,2,4,5,6]; 
% y = [1,14,15,5,6,19]; 
% x = [15,18,22]; 
% y = [24,37,25]; 
x = [0.1 0.2 0.3 0.4 0.5]
y = [9.9833 4.9667 3.2836 2.4339 1.9177] 



% a = newtonIter(x,y); 

val = newtonInterEval(x,y,0.25)


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

%%
% x=[2,3,5,8,12];
% y=[10,15,25,40,60];
% x=[0,15,18,22,24]; 
% y=[22,24,37,25,123]; 
x=[5 6 9 11]
y=[12 13 14 16]
% x = [-2:0.01:2];
% y = 1./((x.^2 + 1)); 

j = 10; 
xi = 5;
% Lj = lagrangeInter(j,x,xi); 
val = lagrangeInterEval(x,y,xi)




%%

x = [0 20 40 60 80 100];
y = [26.0 48.6 61.6 71.2 74.8 75.2];
n = length(x) - 1;

xp = 40;

sm = 0;
for i = 1 : n+1
  pr = 1;
  for j = 1 : n+1
    if j ~= i
      pr = pr * (xp - x(j))/(x(i) - x(j));
    end
  end
  sm = sm + y(i) * pr;
end


%%

x = [-2:0.01:2];
y = 1./((x.^2 + 1)); 

newX_5 = [-2, -1.50, 0, 1, 2];
newY_5 = 1./((newX_5.^2+1))

% tes = newtonInterEval(newX_5,newY_5,1)
fk = newtonInterEval(x,y,2)

%%
a=[1 2 3 4 5 6 7 8 9 10];
b= 2
 % this will work even if 'a' is  in random order
  d=sort(abs(b-a));   
  lowest=find(abs(b-a)==d(1));
  low = lowest(1)
  
  sec_lowest=find(abs(b-a)==d(2));
  sec_low = max(sec_lowest)
 
  %%
x = [12 13 14 16];
y = [5 6 9 11];
sum = 0;
a = 12.5;
for i = 1:length(x)
    u = 1;
    l = 1;
    for j = 1:length(x)
        if j ~= i
            u = u * (a - x(j));
            l = l * (x(i) - x(j));
        end
    end
    sum= sum + u / l * y(i);
end
disp(sum);
  
  
  
  
  
  
  
