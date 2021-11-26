function naloga2
a = [1 1/2];
b = [1 1/3];
for i = 3:51
    a(i) = 5/2*a(i-1) - a(i-2);
    b(i) = 10/3*b(i-1) - b(i-2);
end

subplot(3,1,1);
semilogy(0:50,a,'.');
title('Seznam a');

subplot(3,1,2);
semilogy(0:50,b,'.');
title('Seznam b');

b = [zeros(1,49) 1 0];
for i = 49 : -1 : 1
    b(i) = 10 / 3 * b(i+1) - b(i+2);
end
b = b / b(1);
subplot(3,1,3);
semilogy(0:50, b, '.');
title('Zaporedje b v nazaj');