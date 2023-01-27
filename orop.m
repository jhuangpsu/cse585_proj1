function [after_or] = orop(X,Y)
[M,N] = size(X);
for i = 1 : M
    for j = 1 : N
        if (X(i,j) == 0) || (Y(i,j) == 0)
            after_or(i,j) = 0;
        else
            after_or(i,j) = 255;
        end
    end
end

