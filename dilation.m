function [output] = dilation(img, se)
[M,N] = size(img);
sum_se = stat(se,0);
[r,c] = size(se);
pad_row_r = pad_num(M,M,r);
pad_col_r = pad_num(N,N,c);
input_pad_r = uint8(padding(img,pad_row_r,pad_col_r,true));
output_r = uint8(reverse(zero(M,N)));
% use erosion to achieve dilation
for i = 1 + pad_row_r : M + pad_row_r
    for j = 1 + pad_col_r : N + pad_col_r
        tmp = input_pad_r(i-pad_row_r:i+pad_row_r, j-pad_col_r:j+pad_col_r);
        output_map = andop(tmp,se);
        if stat(output_map,0) == sum_se
            output_r(i-pad_row_r,j-pad_col_r) = 0;
        end
    end
end

output = output_r;
end

