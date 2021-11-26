function [x, X, k] = sekantna(f, x0, x1, tol, N)
X=[x0, x1];
k = 0;
fxk = f(X(1));
while k < N
    k = k + 1;
    fxkn = f(X(k+1));
    X(k+2) = X(k+1) - fxkn*(X(k+1)-X(k))/(fxkn-fxk);
    fxk = fxkn;
    if abs(X(k+2)-X(k+1)) < tol
        break
    end
end
x = X(k+2);