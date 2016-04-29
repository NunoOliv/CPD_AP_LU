clear all

%A = [ 3 2 4; 8 4 2; 3 5 1];
%A = [ 2 7 9; 5 7 9; 1 4 5];

A = rand(10);

%B = BLAS2LU(A);
B = BLAS2LUPP(A);

%B = BLAS3LU(A,1);
%B = BLAS3LUPP(A,1);

[L,U,P] = lu(A);

Error = norm(P*B - L*U)