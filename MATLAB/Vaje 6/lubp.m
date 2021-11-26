function [L,U] = lubp(A)
%lubp izracuna LU razcep A = LU matrike A brez pivotiranja
%A kvadratna matrika (z nesingularnimi vodilnimi podmatrikami)
n = size(A,1);
for j = 1:n-1
    for i = j+1:n
        A(i,j) = A(i,j)/A(j,j);
        for k = j+1:n
            A(i,k) = A(i,k) - A(i,j)*A(j,k);
        end
    end
end
L = tril(A,-1) + eye(n);
U = triu(A);

end