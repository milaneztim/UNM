function [Q, R] = extendedqr(A, eps)
    [m, n] = size(A);
    Q = eye(m);
    for i = 1 : m
        vecjih = 0;
        k = i;
        for j = i+1 : m
            if abs(A(j, i)) > abs(A(i, i)) * eps
                vecjih = vecjih + 1;
                k = j;
            end
        end
        if vecjih == 0
            continue
        elseif vecjih == 1
            % givens na indeks
            r = sqrt(A(i, i)^2 + A(k, i)^2);
            c = A(i, i)/r;
            s = A(k, i)/r;
            A([i k], i:n) = [c s; -s c] * A([i k], i:n);
            % b([i k]) = [c s; -s c] * b([i k]);
            Q([i k], :) = [c s; -s c] * Q([i k], :);
        else
            % householder
            w = A(i:m, i);
            w(1) = w(1) + sgn(w(1)) * norm(w);
            P = eye(m-i+1) - 2 * (w * w')/(w' * w);
            A(i:m, i:n) = P * A(i:m, i:n);
            % b(i:m) = P * b(i:m);
            Q(i:m, :) = P * Q(i:m, :);
        end
    end
    R = A;
    Q = Q';
end