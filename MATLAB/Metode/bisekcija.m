function [x, X, k] = bisekcija(f, a, b, tol, N)

if sign(f(a)) == sign(f(b))
    error('f v točkah a in b ni nasprotno predznačena ')
end

X=a;
k = 0;
while k<N
    k = k +1;
    x = (a+b)/2;
    X(k+1) = x;
    if abs(X(k+1) - X(k)) < tol
        break
    end

    if sign(f(a)) ~= sign(f(x))
        b=x;
    else
        a=x;
    end
end
