% 4. naloga
n = 200;
h = 20;
gamma = 5;
% Pripravimo konvolucijske koeficiente
D = zeros(1,2*h+1);
for k = 1:2*h + 1
   D(k) = exp(-(k-h-1)^2/(2*gamma^2));
end
b = sum(D);
D = D ./ b;

aritmeticna_sred = sum(D) / length(D)

% ---------------------------------------

Dzg = [flip(D(1:h+1)) zeros(1,n-h-1)];
Dsp = [D(h+1:end), zeros(1,n-h-1)];
A = toeplitz(Dzg,Dsp);
vsota = sum(diag(A)) + sum(diag(flip(A)))

% ---------------------------------------

x = zeros(n,1);
for k = 1:n
    if (50 <= k) && (k <= 100)
        x(k) = 1;
    end
end
    
y = A*x;
razlika = norm(x-y)

% ---------------------------------------

x_ = zeros(n,1);
for k = 1:n
    if (50 <= k) && (k <= 100)
        x_(k) = (k-50)/50;
    elseif (100 < k) && (k <= 150)
        x_(k) = 4;
    end
end  

rng(1000);
w = 0.1 * randn(n,1);
y_ = A*x_ + w;

[U,S,V] = svd(A);
r = 10;
singularne = diag(S);
reciprocne_sing_do_r = diag([1./singularne(1:r); zeros(n-r,1)]); 
psevdo_Ar =  V * reciprocne_sing_do_r * U';
y_r = psevdo_Ar*y_;

nova_razlika = norm(x_ - y_r)