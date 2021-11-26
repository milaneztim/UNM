function [p, dp] = polinom(a, x)

p = a*poly(x);
dp = polyder(p);
X = min(x):0.001:max(x);
Y = polyval(p,x);
Yd = polyval(dp,x);
figure
plot(X,Y,'b-', X,Yd,'r-')
