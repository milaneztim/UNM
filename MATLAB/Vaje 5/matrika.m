function A = matrika(n)
A = zeros(n, n);
A = A + diag(-2:-2:-2*n) + diag(n-1:-1:1, 1) + diag(n-1:-1:1, -1);
