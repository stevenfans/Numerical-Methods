function Lj = lagrangeInter(j,x,xi)

        % j?? 
        % says to be skipped over, but wtf lol 
        % j is starting point for now
%      Misunderstood and used quadratic Lagrange
        result = find(x==j) %get the index to skip 
        result = j;

%         so now im guesssing since we skipped it
%         get the next three values for x0,x1,x2
        x0 = x(1,result+0) 
        x1 = x(1,result+1)
        x2 = x(1,result+2)


%          Now get L0,L1,L2
        syms X; 

        L0 = ((X-x1)/(x0-x1))*((X-x2)/(x0-x2));
        L1 = ((X-x0)/(x1-x0))*((X-x2)/(x1-x2));
        L2 = ((X-x0)/(x2-x0))*((X-x1)/(x2-x1));

        Lj = [L0, L1, L2];