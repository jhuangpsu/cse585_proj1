% ==============================================================
% Module: img2b.m
%
% Usage: Helper function.
%
% Purpose:
%   Perform a img to binary opteration on the given image 
%
% Input Variables:
%   fg_filtered Target image
%
% Returned Results:
%   fg_binary The binary form of the image
%
% Processing Flow:
%   1. Get size for fg_filtered
%   2. Filter with threshold
%   3. Write output image
%
% Author: Junzhe Huang, Yiyang Mei, Tianhui Li
% Date: 01/29/2023
% ===============================================================*

function [fg_binary] = img2b(fg_filtered)
fg_binary = fg_filtered;
[M, N] = size(fg_filtered);
for x = 1 : M
    for y = 1 : N
        if fg_binary(x,y) < 128
            fg_binary(x,y) = 0;
        else
            fg_binary(x,y) = 255;
        end
    end
end


