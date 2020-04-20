function val = tranpezoidalIntegral(f,a,b,N)

    h = (b-a)/N; 
    
    X=sym('x'); 
    
    fa = vpa(subs(f,X,a));
    fb = vpa(subs(f,X,b));
    
    dX = (b-a)/(2*N); 

    ss = zeros(1,N-1); 
    
    for k = 1:N-1
        ss(k) = a+ (k*h)
    end
    
    fs = vpa(subs(f,X,ss));
    t2 = sum(2.*fs, 'all');
    
    
    val = dX * (fa + t2 + fb); 
    
    
        