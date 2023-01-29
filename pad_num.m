% ==============================================================
% Module: pad_num.m
%
% Usage: Helper function.
%
% Purpose:
%   Find padding size for given imgs and kernel
%
% Input Variables:
%   out Result img
%   in Input img
%   kernel Num kernele
%
% Returned Results:
%   padding The size of padding
%
% Processing Flow:
%   1. Calculate padding size
%
% Author: Junzhe Huang, Yiyang Mei, Tianhui Li
% Date: 01/29/2023
% ===============================================================*

function [padding] = pad_num(out, in, kernel)
padding = (out-in+kernel-1)/2;
end

