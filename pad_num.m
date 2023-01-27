function [padding] = pad_num(out, in, kernel)
padding = (out-in+kernel-1)/2;
end

