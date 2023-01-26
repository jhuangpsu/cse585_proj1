function [after_and] = andop(X,Y)
[M,N] = size(X);
for i = 1 : M
    for j = 1 : N
        if (X(i,j) < Y(i,j)+1) && (X(i,j) > Y(i,j)-1) 
            after_and(i,j) = X(i,j);
        else
            after_and(i,j) = 255;
        end
    end
end

