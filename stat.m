% ==============================================================
% Module: stat.m
%
% Usage: Helper function.
%
% Purpose:
%   Get status of the image with comparing element
%
% Input Variables:
%   X Original img
%   obj Comparing element
%
% Returned Results:
%   num The number of pixel that matches obj in X
%
% Processing Flow:
%   1. Find size of original image
%   2. Check each pixel
%   3. Store the result
%
% Author: Junzhe Huang, Yiyang Mei, Tianhui Li
% Date: 01/29/2023
% ===============================================================*

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

