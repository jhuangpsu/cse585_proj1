function [trans] = lo2uint(X)
trans = uint8(X.Neighborhood);
[M,N] = size(trans);
for i = 1 : M
    for j = 1 : N
        if trans(i,j) == 1
            trans(i,j) = 0;
        elseif trans(i,j) == 0
            trans(i,j) = 255;
        end
    end
end
end

