clear all
close all
clc

D = zeros(10, 10);
I = eye(10);
b = [-2,-6,-9,1,8,10,1,-9,-4,-3]';
S = 3;
Omega = false (10, 1);

for i = 1:1:10
  for j = 1:1:10
    D(i,j) = sin(i + j);
  end
end



r = b;
A = normc(D + I);
x = abs(A(1) * r);

while (norm(x, 0) < S)
  for j = 1:1:10
    if Omega(j) == false
      x_j = abs(A(j) * r);
      [x, i] = max(x_j);
    endif
  endfor
  
  abs(A'*r)
  x_j = abs(a_j .* r)
  
  Omega(j) = true;
  
  #x*_omg = argmin ||A_omg*X - b||2_2
endwhile