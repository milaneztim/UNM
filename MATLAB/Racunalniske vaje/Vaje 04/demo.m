% primer tangentne metode

% natancen priblizek
xt = fzero(f,1,optimset('TolX',1e-16));
fprintf('Natancen priblizek: %g\n', xt);

% tangentna metoda z 10 koraki pri zacetnem priblizku 3
f = @(x) x+4-exp(x.^2);
df = @(x) 1 - 2*x.*exp(x.^2);
[x,X,k] = tangentna(f,df,3,1e-100,10);
fprintf('Tangentna metoda po 10 korakih: %g\n', x);
fprintf('''Napaka'': %g\n', abs(x-xt));