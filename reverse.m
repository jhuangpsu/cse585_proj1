% ==============================================================
% Module: reverse.m
%
% Usage: Helper function.
%
% Purpose:
%   Reverse the image
%
% Input Variables:
%   X Original img
%
% Returned Results:
%   after_reverse The image after reverse
%
% Processing Flow:
%   1. Find size of original image
%   2. Reverse each pixel
%   3. Store the result
%
% Author: Junzhe Huang, Yiyang Mei, Tianhui Li
% Date: 01/29/2023
% ===============================================================*

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

