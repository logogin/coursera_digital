%% Homework 12: Orthogonal Matching Pursuit (Refer to Slide 36)

clear all % Delete All Stored Variables 
close all % Close All Figures
clc % Remove All Lines in Command Window

%% Input: A (with unit norm columns), b, and S

n = 10;
I = eye (n);
D = zeros (n, n);

for i = 1: 1 :n
    for j = 1: 1: n
        D (i, j) = sin (i + j);
    end
end

A = D + I;
b = transpose ([-2, -6, -9, 1, 8, 10, 1, -9, -4, -3]);
S = 3;

% Normalize A
A = A ./ repmat (sqrt (sum (A .* A)) ,size (A, 1), 1);

%% Initialize

r = b;                          % Initial value of Residual is b
Omega = false (n, 1);           % Empty Set
count = 0;                      % Number of Elements in Set

%% Processing Loop

while (count < S)
    x = zeros (n, 1);
    for j = 1: n
        if (~ Omega (j))
            x (j) = transpose (A(:, j)) * r;
        end
    end

    % Add the index of the maximum value of x to the set Omega
    [mx, j] = max (abs (x));
    Omega (j) = true;
    count = count + 1;

    fprintf ('x[%d] = %f\n', j, mx);

    % A_omega is the matrix formed by keeping only the columns of A
    % that are in Omega.
    A_omega = A (:, Omega);

    % Update the coefficients.
    z_omega_star = pinv (A_omega' * A_omega) * A_omega' * b;

    % Update the residual.
    r = b - A_omega * z_omega_star;
end