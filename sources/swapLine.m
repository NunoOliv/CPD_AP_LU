function [ A ] = swapLine( A, a, b )


aux = A(a,:);   % Extract third row
A(a,:)= A(b,:);
A(b,:)=aux;

end

