% ==============================================================
% Module: padding.m
%
% Usage: Helper function.
%
% Purpose:
%   Find padding for given imgs and kernel
%
% Input Variables:
%   X Input img
%   r1 Padding number for row
%   r2 Padding number for col
%   ifreverse Bool for setting reversed padding
%
% Returned Results:
%   after_pad The image after padding
%
% Processing Flow:
%   1. Calculate new size with padding size
%   2. See if it needs to be reversed padding
%   3. Move original img to the padded img
%
% Author: Junzhe Huang, Yiyang Mei, Tianhui Li
% Date: 01/29/2023
% ===============================================================*

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

