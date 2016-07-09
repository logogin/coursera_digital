function [retval] = msa(input1, input2)
  [rows, cols] = size(input1);
  retval = sum(sum(abs(double(input1) - double(input2))))/(rows * cols);
endfunction
