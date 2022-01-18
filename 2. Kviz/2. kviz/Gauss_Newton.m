function [x, X, k] = Gauss_Newton(f, Jf, x0, eps, koraki)
    X = x0;
    for k = 1 : koraki
        dx = Jf(X(:, k))\(-f(X(:, k)));
        X(:, k+1) = X(:, k) + dx;
        if norm(dx) < eps
            break;
        end
    end
    x = X(:, k+1);
end