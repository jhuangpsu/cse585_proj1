% ==============================================================
% Module: hitnmiss.m
%
% Usage: Helper function.
%
% Purpose:
%   Perform a hitnmiss opteration on the given images with corresbonding 
% structing elements
%
% Input Variables:
%   input_h Hit image
%   input_m Miss image
%   se_1 Structing element for Hit image
%   se_2 Structing element for Miss image
%
% Returned Results:
%   output The image after hitnmiss transformation
%
% Processing Flow:
%   (a) Pad the images
%   (b) Apply erosion with corresponding structing element
%   (c) Find the intersection
%   (d) Store the result
%
% Author: Junzhe Huang, Yiyang Mei, Tianhui Li
% Date: 01/29/2023
% ===============================================================*


function [output] = hitnmiss(input_h, input_m, se_1, se_2)
[Mh,Nh] = size(input_h);
[Mm,Nm] = size(input_m);

[r1,c1] = size(se_1);
[r2,c2] = size(se_2);

pad_row_h = pad_num(Mh,Mh,r1);
pad_col_h = pad_num(Nh,Nh,c1);
input_pad_h = padding(input_h,pad_row_h,pad_col_h,true);
output_hit = reverse(zero(Mh,Nh));

pad_row_m = pad_num(Mm,Mm,r2);
pad_col_m = pad_num(Nm,Nm,c2);
input_pad_m = padding(input_m,pad_row_m,pad_col_m,false);
output_miss = reverse(zero(Mm,Nm));

sum_se1 = stat(se_1,0);
sum_se2 = stat(se_2,0);

% hit
for i = 1 + pad_row_h : Mh + pad_row_h
    for j = 1 + pad_col_h : Nh + pad_col_h
        tmp = input_pad_h(i-pad_row_h:i+pad_row_h, j-pad_col_h:j+pad_col_h);
        output_map = andop(tmp,se_1);
        if stat(output_map,0) == sum_se1
            output_hit(i-pad_row_h,j-pad_col_h) = 0;
        end
    end
end

% miss
for i = 1 + pad_row_m : Mm + pad_row_m
    for j = 1 + pad_col_m : Nm + pad_col_m
        tmp = input_pad_m(i-pad_row_m:i+pad_row_m, j-pad_col_m:j+pad_col_m);
        output_map = andop(tmp,se_2);
        if stat(output_map,0) == sum_se2
            output_miss(i-pad_row_m,j-pad_col_m) = 0;
        end
    end
end

imtool(output_hit);
imtool(output_miss);

output = andop(output_hit, output_miss);

end

