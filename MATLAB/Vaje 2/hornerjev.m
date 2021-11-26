function y = hornerjev(p, x, dolzina_mantise, baza)
% a=[a0, a1, ..., an]
n = length(p);
y = p(n);
for i = (n-1):-1:1
    yx = float(y*x, dolzina_mantise, baza);
    ai = float(p(i), dolzina_mantise, baza);
    y = float(ai + yx, dolzina_mantise, baza);
end 
