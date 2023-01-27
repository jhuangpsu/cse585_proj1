function [after_pad] = padding(X,r1,r2,ifreverse)
[M,N] = size(X);
M_n = M + 2*r1;
N_n = N + 2*r2;

if ifreverse == true
    after_pad = reverse(zero(M_n, N_n));
else
    after_pad = zero(M_n, N_n);
end

for i = r1+1 : M+r1
    for j = r2+1 : N+r2
        after_pad(i,j) = X(i-r1,j-r2);
    end
end

