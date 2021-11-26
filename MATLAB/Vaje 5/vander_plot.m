function vander_plot(n)
c = [];
i = 1;
for k=1:n
    c(i) = cond(vander(0:1/k:1));
    i = i + 1;
end
semilogy(1:n, c)