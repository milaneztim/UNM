function [x, X, k] = iteracija(g, x0, tol, N)
X = x0;
k = 0;
while k<N
    k = k+1;
    X(k+1) = g(X(k));
    if abs(X(k+1) - X(k)) < tol
        break
    end
end
x = X(k+1);