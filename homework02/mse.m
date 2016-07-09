function [retval] = mse(input1, input2)
  [rows, cols] = size(input1);
  retval = sum(sum((double(input1) - double(input2)).^2))/(rows * cols);
endfunction
