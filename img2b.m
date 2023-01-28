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


