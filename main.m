%%%%%%%%%%%%% main.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Try various very simple things with images  
%
% Input Variables:
%      f       input 2D image
%      M, N    rows (M) and columns in f
%      x       x coordinate of a pixel
%      y       y coordinate of a pixel
%      fzero   A scratch image of zeroes - often needed in image processing
%      
% Returned Results:
%      f1      A clipped version of an input image
%      fmean   3x3 neighborhood-average version of input image
%
% Processing Flow:
%      1.  Load and display input image
%      2.  Compute and write clipped version of input image
%      3.  Compute and display 3x3 neighborhood-average of input image
%          
%
%  Restrictions/Notes:
%      This function requires an 8-bit image as input.  
%
%  The following functions are called:
%      zero.m       create an image full of zeroes
%      mean3x3.m    filter with a 3x3 mean filter
%          worked into the code below - try to do this yourself
%
%  Author:      William E. Higgins
%  Date:        1/6/2023  (identical to 8/13/2022 version)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear;      % Clear out all memory 

%  Read in image "lake.gif" into array "f", get its 2D dimensions,
%      and display it on the screen
%  Note that "lake.gif" is needed in the directory of this .m file

f=imread('lake.gif');
[M, N] = size(f);
imtool(f);

%  Create and write a new image "f1" that is the same as the original image
%     but truncates all gray levels to a max value of 128

for x = 1 : M
    for y = 1 : N
        if f(x,y) > 127
            f1(x,y) = min(f(x,y),128);
        else
            f1(x,y) = f(x,y);
        end
    end
end
imwrite(f1,'f1.gif');

% Do a very simple 3x3 neighborhood average on image "f"
%    1.  Create an image "fzero" loaded with zeros
%    2.  Create and display an MxN image "mean" which contains
%        the 3x3 filtered version of f, with zeroes in the border
%        locations that can't be filtered

fzero = zero(M,N);
fmean = mean3x3(f,fzero,M,N);
imtool(fmean);

%%%%%%%%%%%%% End of the main.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
