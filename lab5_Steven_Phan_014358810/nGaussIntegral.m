function val = nGaussIntegral(f,a,b,N)

    syms x; 
    
    X = sym('x'); 
    
    x2 = [-0.577350269, 0.577350269]; 
    c2 = [1,1];
    
    x3 = [-0.774596669,0,0.774596669]; 
    c3 = [0.555555556, 0.888888889,0.555555556]; 
    
    x4 = [-0.861136311,-0.339981043,0.339981043,0.861136311]; 
    c4 = [0.347854845,0.652145154,0.652145154,0.347854845]; 
    
    x5 = [-0.906179845,-0.538469310,0,0.538469310,0.9061798459];
    c5 = [0.236926885,0.478628670,0.568888889,0.478628670,0.236926885];
    
    p1 = (b-a)/2; 
    p2 = (b+a)/2; 
    pIn = (p1 * x + p2) * p1;
    
    if N == 2
        n = x2;
        c = c2; 
    elseif N == 3
        n = x3; 
        c = c3;
    elseif N == 4
        n = x4;
        c = c4;
    elseif N == 5; 
        n = x5;
        c = c5;
    end 
    
    result = vpa(subs(pIn,X,n));
    result = c.*vpa(subs(f,X,result));
    val = sum(result);
    
    
    
    