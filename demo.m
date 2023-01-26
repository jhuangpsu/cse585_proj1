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

fg_reverse = reverse(fg_binary);
%imtool(fg_reverse);

output = andop(fg, fg_binary);
imtool(output);
