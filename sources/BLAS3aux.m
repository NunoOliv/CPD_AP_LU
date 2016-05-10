function A=BLAS3aux(A,j,o,last)

%A(i:n,i:last)=BLAS3LU(A(i:n,i:last)); % step 1 (L22, L32)

%A=B(j:o,j:last);

m = j-o;
n = j-last;
for i=1:min(m-1,n)
    i2=i+j;
    % apply row permutations to A and L
    [M,I] = max(A(i2:n,i2));
    linha = I+i2-1;
    if(linha > i2)
        A=swapLine(A,linha,i2);
        %B=swapLine(B,linha+j-1,i+j-1);
    end
    
    A(i2+1:m,i2)=A(i2+1:m,i2)/A(i2,i2);
    if i2<n
        A(i2+1:m,i2+1:n)=A(i2+1:m,i2+1:n)-A(i2+1:m,i2)*A(i2,i2+1:n);
    end
end
