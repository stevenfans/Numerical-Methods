function val = simpsonIntegral(f,a,b,N)
    
    if(rem(N,2)==0)
        X = sym('x'); 

        h = (b-a)/N;
        dX = (b-a)/(3*N); 

        fx0 = vpa(subs(f,X,a)); 
        fx1 = vpa(subs(f,X,b)); 

        xs = zeros(1,1); 
        xs(1) = a; 

        for k = 2:N
            xs(k) = xs(k-1) + h;
        end

        xs = vpa(subs(f,X,xs));

    %     delete first index
        xs(1) = []; 

        oddInd = xs(1:2:end);
        evenInd = xs(2:2:end); 

        sumEven = sum(2.*evenInd, 'all');
        sumOdd  = sum(4.*oddInd,'all');

        val = dX * (fx0 + sumEven + sumOdd + fx1);
        
    else
        val = 'NaN';
    end