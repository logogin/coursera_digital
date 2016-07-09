function X = normc(M)
  if (1 != nargin)
    print_usage;
  endif

  X = normr(M.').';
endfunction