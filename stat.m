function [num] = stat(X,obj)
[M,N] = size(X);
num = 0;
for i = 1 : M
    for j = 1 : N
        if X(i,j) == uint8(obj)
            num = num + 1;
        end
    end
end
end

