function A=BLAS3LUPP(A,b)

n=length(A);
for i=1:b:n-1
    % apply row permutations to A and L
    
    last=min(i+b-1,n);  
    
    A=BLAS3aux(A,i,n,last); % step 1 (L22, L32)
    if n-i+1 > b  % SIZE OF REMAINING BLOCK LARGER THAN b
        L22=tril(A(i:last,i:last),-1)+eye(b);
        A(i:last,i+b:n)=inv(L22)*A(i:last,i+b:n); % step 2 (U22)
        A(i+b:n,i+b:n)=A(i+b:n,i+b:n)-A(i+b:n,i:last)*A(i:last,i+b:n); % step 3 (U33)
    end
end
    