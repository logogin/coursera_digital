clear all;


%initializing D:
I = eye(10);
D = zeros(10,10);
for i=1:10
    for j=1:10
        D(i,j) = sin(i+j);
    end
end

A = D + I;

b = [ -2, -6, -9, 1, 8, 10, 1, -9, -4, -3]';

S = 3;

%% the Orthogonal Matching Pursuit

X = zeros(10,1);

An = normc(A);
r = b;
omega = zeros(10,1);

while (sum(X~=0) < S)
    xj = An'*r .* (omega == 0);

    [mx,idx] = max(abs(xj));
    omega(idx) = 1;

    % creating A_omega, which is An with only the selected columns filled in, others set to 0:
    Ao = An;
    Ao(:,omega==0)=0;

    % solve the least-squares problem:
    X = Ao'*pinv(Ao*Ao')*b;
	
    % update the residual
    r = b - Ao*X;
end

X
residual = b - An*X
norm_res = (b - An*X) ./ b