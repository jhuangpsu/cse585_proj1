clear;

% Read the image and convert it to a grascale image
f=imread('RandomDisks-P10.jpg');
fg = rgb2gray(f);

fg_threshed = img2b(fg);

[M, N] = size(fg_threshed);



% Filter the image using the 3x3 mean filter
fg_filtered = mean3x3(fg_threshed, zero(M, N), M, N);
%fg_filtered = fg;



% Set threshold to transfer the image into the binary image
fg_binary = img2b(fg_filtered);



fg_reverse = uint8(reverse(fg_binary));



% build the structuring elements and the restore element
r1 = 10; % should be the second smallest r
se1 = strel("disk",r1,6);
se_1 = lo2uint(se1);
%se_1 = padding(se_1,24);

r2 = 31; % should be the second largest r
se2 = strel("disk",r2,8);
se_2 = lo2uint(se2);
se_2 = uint8(reverse(padding(se_2,5,5,true))); % not good to set padding size too large

se3 = strel("disk",3,0);
se_3 = lo2uint(se3);



% do hit and miss transform and get the positions of 3 middle-sized disks


a2 = imerode(fg_binary,se1);
imtool(a2);
a = erosion(fg_binary,se_1);

imtool(a);


