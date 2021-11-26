function naloga2

g1 = @(x) x^2 - 2;
g2 = @(x) sqrt(x + 2);
g3 = @(x) 1 + 2 / x;
g4 = @(x) (x^2 + 2) / (2*x - 1);

X = linspace(-2, 4, 1000);
Y = [];
i=0;
for x=X
    i=i+1;
    [~, ~, k] = iteracija(g1, x, 1e-16, 1000);
    Y(i) = k;
end

plot(X, Y);


