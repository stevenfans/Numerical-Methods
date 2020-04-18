function val = lagrangeInterEval(x,y,xi)

    % misunderstood: performed quadratic lagrange
    % Find the the closet values that bracket xi in x
    d=sort(abs(xi-x));   
    lowest=find(abs(xi-x)==d(1));
    lowest=min(lowest);
    
    second_lowest=find(abs(xi-x)==d(2));
    sec_lowest = max(second_lowest)
    
    thrd_lowest =find(abs(xi-x)==d(3));
    
    y0=lowest;y1=sec_lowest; y2=thrd_lowest;
    
    %do 0 element condition 
    if x(lowest)>xi && lowest~=1
        bf = lowest - 1; 
        new_lowest = bf;
        y0=new_lowest; y1=lowest;
        y2=sec_lowest;
    end
   
   
    % y values
    ind = [y0 y1 y2]; 
    ind = sort(ind);
    res = [y(ind(1)) y(ind(2)) y(ind(3))];
    
    
    % get the Lagarange coefficients
    j = ind(1);
    Lj = lagrangeInter(j,x,xi);
    
     X = sym('X');
     
    l0 = vpa(subs(Lj(1),X,4)) * res(1);
    l1 = vpa(subs(Lj(2),X,4)) * res(2);
    l2 = vpa(subs(Lj(3),X,4)) * res(3);
    
    
    val = l0+l1+l2;
    
    
    
   
    
    
    
    
    