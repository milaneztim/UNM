function [x, X, k] = ridder(f, a, b, tol, N)

if sign(f(a)) == sign(f(b))
    error("Funkcija je istega predznaka v a in b.");
end

X = a;
k = 0;
while k < N
    k = k + 1;
    c = (a+b)/2;
    x = c + (c - a)*sign(f(a)-f(b))*f(c)/(f(c)^2 - f(a)*f(b))^(1/2);
    X(k+1) = x;
    if abs(X(k+1) - X(k)) < tol
        break
    end
    if sign(f(x)) ~= sign(f(c))
        a = x;
        b = c;
    elseif sign(f(a)) ~= sign(f(x))
        x = b;
    else 
        a = x;
    end
end

