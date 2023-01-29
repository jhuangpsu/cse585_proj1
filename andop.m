% ==============================================================
% Module: andop.m
%
% Usage: Helper function
%
% Purpose:
%   Doing a logical and operation.
%
% Input Variables:
%   X An image to compare with
%   Y An image to compare with
%
% Returned Results:
%   after_and An image after doing logical AND operation on img X and Y
%
% Processing Flow:
%   1. Get size for X
%   2. logical AND all pixel
%   3. Write output image
%
%
% Author: Junzhe Huang, Yiyang Mei, Tianhui Li
% Date: 01/29/2023
% ===============================================================*
function [after_and] = andop(X,Y)
[M,N] = size(X);
for i = 1 : M
    for j = 1 : N
        if (X(i,j) == 0) && (Y(i,j) == 0)
            after_and(i,j) = 0;
        else
            after_and(i,j) = 255;
        end
    end
end

