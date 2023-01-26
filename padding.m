function [after_pad] = padding(X,r)
[M,N] = size(X);
M_n = M + 2*r;
N_n = N + 2*r;
after_pad = reverse(zero(M_n, N_n));
for i = r+1 : M+r
    for j = r+1 : N+r
        after_pad(i,j) = X(i-r,j-r);
    end
end

