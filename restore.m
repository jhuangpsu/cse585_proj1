function [output] = restore(fg_binary, output_pos, se_3)
[M,N] = size(output_pos);
sum_se3 = stat(se_3,0);
[r3,c3] = size(se_3);
pad_row_r = pad_num(M,M,r3);
pad_col_r = pad_num(N,N,c3);

% use erosion to achieve dilation
while true
    output_prev = output_pos;
    input_pad_r = uint8(reverse(padding(output_pos,pad_row_r,pad_col_r,true)));
    output_r = uint8(reverse(zero(M,N)));
    for i = 1 + pad_row_r : M + pad_row_r
        for j = 1 + pad_col_r : N + pad_col_r
            tmp = input_pad_r(i-pad_row_r:i+pad_row_r, j-pad_col_r:j+pad_col_r);
            output_map = andop(tmp,se_3);
            if stat(output_map,0) == sum_se3
                output_r(i-pad_row_r,j-pad_col_r) = 0;
            end
        end
    end
    output_pos = uint8(andop(fg_binary,reverse(output_r)));
    
    if output_pos == output_prev
        break;
    end
end

output = output_pos;
end

