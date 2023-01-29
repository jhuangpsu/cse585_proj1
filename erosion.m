% ==============================================================
% Module: erosion.m
%
% Usage: Helper function.
%
% Purpose:
%   Perform a erosion opteration on a given image with structing 
% element
%
% Input Variables:
%   img Target image
%   se Structing element
%
% Returned Results:
%   output The image after erosion
%
% Processing Flow:
%   (a) Pad the image
%   (b) Apply erosion with structing element se
%   (c) store result
%
% Author: Junzhe Huang, Yiyang Mei, Tianhui Li
% Date: 01/29/2023
% ===============================================================*

function [output] = erosion(img, se)
[M,N] = size(img);
[r,c] = size(se);
pad_row_r = pad_num(M,M,r);
pad_col_r = pad_num(N,N,c);
input_pad_r = uint8(zero(M+2*pad_row_r, N+2*pad_col_r));
% use erosion to achieve dilation
for i = 1:r
    for j = 1 : c
        if se(i,j) == 0
            input_pad_r(i+pad_row_r:M+pad_row_r,j+pad_col_r:N+pad_col_r) = andop(input_pad_r(i+pad_row_r:M+pad_row_r,j+pad_col_r:N+pad_col_r),reverse(img) );
        end
    end
end

output = reverse(input_pad_r(1+pad_row_r:M+pad_row_r, 1+pad_col_r:N+pad_col_r));
end

