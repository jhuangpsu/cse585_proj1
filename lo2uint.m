% ==============================================================
% Module: lo2uint.m
%
% Usage: Helper function
%
% Purpose:
%   Doing a lo2uint operation.
%
% Input Variables:
%   X The image to process with
%
% Returned Results:
%   trans An image after transformation
%
% Processing Flow:
%   1. Get size for X
%   2. Transform all pixels
%   3. Write output image
%
%
% Author: Junzhe Huang, Yiyang Mei, Tianhui Li
% Date: 01/29/2023
% ===============================================================*

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

