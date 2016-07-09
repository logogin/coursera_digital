function [retval] = isnr (original, noisy, restored)
  retval = 10 * log10(sum(sum((original - noisy).^2))/sum(sum((original - restored).^2)));
endfunction
