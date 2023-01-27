clear;

% Read the image and convert it to a grascale image
f=imread('RandomDisks-P10.jpg');
fg = rgb2gray(f);

[M, N] = size(fg);
%imtool(fg);


% Filter the image using the 3x3 mean filter
fg_filtered = mean3x3(fg, zero(M, N), M, N);
%imtool(fg_filtered);


% Set threshold to transfer the image into the binary image
fg_binary = fg_filtered;
for x = 1 : M
    for y = 1 : N
        if fg_binary(x,y) < 128
            fg_binary(x,y) = 0;
        else
            fg_binary(x,y) = 255;
        end
    end
end
imtool(fg_binary);

fg_reverse = uint8(reverse(fg_binary));
%imtool(fg_reverse);


% build the structuring elements and the restore element
r1 = 10; % should be the second smallest r
se1 = strel("disk",r1,6);
se_1 = lo2uint(se1);
%se_1 = padding(se_1,24);

r2 = 30; % should be the second largest r
se2 = strel("disk",r2,8);
se_2 = lo2uint(se2);
se_2 = uint8(reverse(padding(se_2,10,10,true)));

se3 = strel("disk",3,0);
se_3 = lo2uint(se3);

%imtool(se_1);
%imtool(se_2);


% do hit and miss transform and get the positions of 3 middle-sized disks
output_pos = hitnmiss(fg_binary, fg_reverse, se_1, se_2);
% output_pos = load("output_pos.mat");
% output_pos = uint8(output_pos.output_pos);


% restore
output_filtered = restore(fg_binary, output_pos, se_3);
% output_filtered = load("output_filtered.mat");
% output_filtered = uint8(output_filtered.output_filtered);


% get the final output
output_final = reverse(reverse(fg_binary) - reverse(output_filtered));

imtool(output_pos);
imtool(output_filtered);
imtool(output_final);

