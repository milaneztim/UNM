function [D, Q] = JacobiCyclic(A, tol)
% Ciklična jakobijeva metoda
n = length(A);
Q = eye(n);
[~,~, a] = maxoff(A);
    while a > tol
        for p = 1:n-1
            for q = p+1:n
                [A,Q] = JacobiHelper(A,Q,p,q);
            end
        end
        [~,~, a] = maxoff(A);
    end
    D = A;
end

function [A,Q] = JacobiHelper(A,Q,p,q)
        tau = (A(p,p) - A(q,q))/(2*A(p,q));
        t = sign(tau)/(abs(tau) + sqrt(1 + tau^2));
        c = 1/(sqrt(1+t^2));
        s = c*t;
        R = givensR(length(A), c, s, p ,q);
        A = R'*A*R;
        Q = Q*R;
    end