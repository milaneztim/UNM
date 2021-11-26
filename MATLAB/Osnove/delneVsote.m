function sez=delneVsote(x)
l = length(x);
sez = zeros(1, l);
vsota = 0;
for i=1:l
    vsota = vsota + x(i);
    sez(i) = vsota;
end

    