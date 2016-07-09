function [retval] = psnr(input1, input2, _max)
  [rows, cols] = size(input1);
  retval = 10 * log10(_max^2/mse(input1, input2));
endfunction
