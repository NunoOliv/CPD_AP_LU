clear all

% Test For:
% 100
% 300
% 500
% 700
% 900

rng(0);
A = rand(6);

tic;
%B = BLAS2LU(A);
B = BLAS2LUPP(A);

%B = BLAS3LU(A,3)
%B = BLAS3LUPP(A,1);
toc

[L,U,P] = lu(A);

Error = norm(P*A - L*U)