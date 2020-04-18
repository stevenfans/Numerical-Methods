function val = newtonInterEval(x,y,xi)

    a = newtonInter(x,y); % Get coefficients
    
    lenA = length(a); 
    fx = a(lenA); 
    
    % traverse array and multiply everything
    % together to get coeffecients
    for i=lenA-1:-1:1
        fx=fx.*(xi-x(i))+a(1,i); 
    end
    
    val = fx; 
    