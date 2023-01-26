function [after_reverse] = reverse(X)
[M,N] = size(X);
for x = 1 : M
    for y = 1 : N
        if X(x,y) == 0
            after_reverse(x,y) = 255;
        elseif X(x,y) == 255
            after_reverse(x,y) = 0;
        end
    end
end

