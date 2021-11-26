function A=fractionMatrix(x, y)
m = length(x);
n = length(y);
A = zeros(m, n);
for i=1:m
    for j=1:n
        if y(j) == 0
            A(i, j) = x(i);
        else
            A(i, j) = x(i) / y(j);
        end
    end
end