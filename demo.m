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
%imtool(fg_binary);

fg_reverse = uint8(reverse(fg_binary));
%imtool(fg_reverse);

% build the structuring element
r1 = 100;
se1 = strel("disk",r1,8);
se_1 = lo2uint(se1);

r2 = 50;
se2 = strel("disk",r2,4);
se_2 = lo2uint(se2);
se_2 = padarray(se_2, [50,50], 255);


output = uint8(andop(fg_reverse, fg_binary));
%imtool(output);
