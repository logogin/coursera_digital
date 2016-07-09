function X = normr(M)
  if (1 != nargin)
    print_usage;
  endif
  
  norm = sqrt(sum(M .* conj(M),2));
  X = diag(1./norm) *  M;
endfunction