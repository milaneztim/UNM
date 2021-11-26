px = [-17 52 -42 8 0];
py = [-19.5 64 -60 16 0];
t = linspace(0, 1, 2000);
x = polyval(px, t);
y = polyval(py, t);
% a)
r =0.5;
R=1;
filter1 = (x.^2+y.^2 >= r^2) & (x.^2+y.^2<=R^2);

subplot(3, 1, 1);
plot(x, y);
axis equal;

subplot(3, 1, 2);
hold on;
plot(x(filter1==1), y(filter1==1), '.');
phi = linspace(0, 2*pi);
plot(r*cos(phi), r*sin(phi));
plot(R*cos(phi), R*sin(phi));
hold off;
axis equal;

% b)
dpx = polyder(px);
dpy = polyder(py);
ddpx = polyder(dpx);
ddpy = polyder(dpy);

dx = polyval(dpx, t);
ddx = polyval(ddpx, t);
dy = polyval(dpy, t);
ddy = polyval(ddpy, t);

ukrivljenost = abs(dx .* ddy - ddx .* dy) ./ (dx.^2 + dy.^2).^(3/2);
subplot(3, 1, 3);
plot(x(ukrivljenost > 1), y(ukrivljenost > 1));
axis equal;

px2 = conv(px, px);
py2 = conv(py, py);
t0 = roots(px2 + py2 + [0 0 0 0 0 0 0 0 -r^2]);
t1 = roots(px2 + py2 + [0 0 0 0 0 0 0 0 -R^2]);

ukrivx = x(ukrivljenost > 1);
ukrivy = y(ukrivljenost > 1);
x0 = ukrivx(1)
y0 = ukrivy(1)
x1 = ukrivx(end)
y1 = ukrivy(end)

t0 = t(x0 == polyval(px, t) & y0 == polyval(py, t))
t1 = t(x1 == polyval(px, t) & y1 == polyval(py, t))
abs(t1 - t0)
