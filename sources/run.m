clear all

seed = rng(1);


% Test For:
% 250
% 500
% 750
% 1000

A = rand(5000);

tic;
%B = BLAS2LU(A);
B = BLAS2LUPP(A);

%B = BLAS3LU(A,1);
%B = BLAS3LUPP(A,1);
toc


U = triu(B);
L = tril(B);

S = size(L);

for i=1:S
    L(i,i)=1;
end


[~,~,P] = lu(A);

Error = norm(P*A - L*U)
% Error = norm(A - L*U)