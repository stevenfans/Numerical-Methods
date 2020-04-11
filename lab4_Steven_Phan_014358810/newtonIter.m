function a = newtonIter(x,y)

vertY = y';
lenX = length(x);

for i=2:lenX
    for j=2:i
        num = vertY(i,j-1)-vertY(i-1,j-1); 
        den  = x(i)-x(i-j+1);
        vertY(i,j) = num/den;
    end
end 

a = (diag(vertY))';
