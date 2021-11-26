function naloga1 

x = 2^(-1) + 2^(-13) + 2^(-24);
y = 2^(-1) + 2^(-13);

d = x^2 - y^2;

sx = single(x);
sy = single(y);

metoda1 = sx * sx - sy * sy;
metoda2 = (sx - sy) * (sx + sy);

napaka1 = abs(d - double(metoda1))/abs(d);
napaka2 = abs(d - double(metoda2))/abs(d);

fprintf('Točen rezultat: %g\n', d);
fprintf('Rezultat pri x*x - y*y: %g\n', double(metoda1));
fprintf('Rezultat pri (x-y)(x+y): %g\n', double(metoda2));
fprintf('Relativna napaka pri x*x - y*y:  %g\n', napaka1);
fprintf('Relativna napaka pri (x-y)(x+y): %g\n', napaka2);
