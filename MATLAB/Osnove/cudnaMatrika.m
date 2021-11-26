function A=cudnaMatrika(n)

A = diag(1:n) + triu(2.* ones(n), 1) - diag(diag(ones(n-1)), -1);

