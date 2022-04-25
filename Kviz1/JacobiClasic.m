function [D, Q] = JacobiClasic(A, tol)
% Navadna jakobijeva metoda
Q = eye(length(A));
[p,q, a] = maxoff(A);
    while a > tol
        [A,Q] = JacobiHelper(A,Q,p,q);
        [p,q,a] = maxoff(A);
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