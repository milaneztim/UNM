function y = LocalElipse(x, skalarji)
% Lokalno izračuna vrednost elipse
% x^2 + bxy + cy^2 + dx + ey + f = 0
% skalarji = [b,c,d,e,f]
    D = (skalarji(1)*x + skalarji(4))^2 - 4*skalarji(2)*(x^2 + skalarji(3)*x + skalarji(5));
    y = (-(skalarji(1)*x + skalarji(4)) + sqrt(D))/(2*skalarji(2));
end