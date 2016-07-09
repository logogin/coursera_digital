%% my version of normc
% normalise a symmetrical square matrix by columns
% not general purpose
function C = normc(M)
s = size(M);
n = s(1);
C = zeros(n);

col_norms = sqrt(sum(M .^ 2)); % it is symmetrical
% normalise the columns
for col = 1:n
    C(:, col) = M(:, col) / col_norms(col);
end;
% x = sum(C.^2) %test columns are all normalised to 1

%%%%%%%%%%%%%%%%
A./repmat(sqrt(sum(A.*A)),size(A,1),1)

%%%%%%%%%%%%%%%%
for i = 1: N
    Anorm(:,i) = A(:,i)/norm(A(:,i));
end