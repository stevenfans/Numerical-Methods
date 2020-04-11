function val = newtonInterEval(x,y,xi)

    a = newtonIter(x,y); % Get coefficients
    
    lenA = length(a); 
    fx = a(lenA); 
    
    for i=lenA-1:-1:1
        fx=fx*(xi-x(i))+a(1,i); 
    end
    
    val = fx; 
    