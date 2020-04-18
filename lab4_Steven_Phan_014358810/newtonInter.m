function a = newtonInter(x,y)

vertY = y';
lenX = length(x);

for i=2:lenX
    for j=2:i
        %mult all current y values
        num = vertY(i,j-1)-vertY(i-1,j-1); 
        %mult the x of the y values
        den  = x(i)-x(i-j+1);
        vertY(i,j) = num/den;
    end
end 
% grab only the top elements
a = (diag(vertY))';
