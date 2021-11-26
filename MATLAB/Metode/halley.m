function [x, X, k] = halley(f, df, ddf,x0, tol, N)
g = @(x) = 