function B=BLAS3aux(B,j,o,last)

%A(i:n,i:last)=BLAS3LU(A(i:n,i:last)); % step 1 (L22, L32)

A(B(j:o,j:last));

[m n]=size(A);
for i=1:min(m-1,n)
    % apply row permutations to A and L
    [M,I] = max(A(i:n,i));
    linha = I+i-1;
    if(linha > i)
        A=swapLine(A,linha,i);
        B=swapLine(B,linha,i);
    end
    
    A(i+1:m,i)=A(i+1:m,i)/A(i,i);
    if i<n
        A(i+1:m,i+1:n)=A(i+1:m,i+1:n)-A(i+1:m,i)*A(i,i+1:n);
    end
end

B(j:o,j:last)=A;