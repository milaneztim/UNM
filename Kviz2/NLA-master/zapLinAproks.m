function [lambda, v] = zapLinAproks(T, dT, lambda, maxKorakov, tol)

for k = 1:maxKorakov
    [U, V] = eig(T(lambda), dT(lambda));
    es = diag(V);
    [~, i] = min(abs(es));
    v = U(:,i);
    dlambda = es(i);
    
    if abs(dlambda) < tol
        break
    end

    lambda = lambda - dlambda;
end