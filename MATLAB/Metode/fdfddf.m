function [x, X, k] = fdfddf(f, df, ddf, x0, tol, N)
g = @(x) x - f(x)/df(x) - ddf(x)*f(x)^2/(2*df(x)^3);
[x, X, k] = iteracija(g, x0, tol, N);