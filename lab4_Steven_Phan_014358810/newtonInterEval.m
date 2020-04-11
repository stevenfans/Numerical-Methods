function val = newtonInterEval(x,y,xi)

%  fx0 = D(n,n);
%  for i = n-1:-1:1
%     fx0 = fx0*(x0-x(i)) + D(i,i);
%  end

    a = newtonIter(x,y); % Get coefficients
    
    lenA = length(a); 
    fx = a(lenA); 
    
    for i=lenA-1:-1:1
        fx=fx*(xi-x(i))+a(1,i); 
    end
    
    val = fx; 
    