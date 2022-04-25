function [R] = givensR(n, c, s, p ,q)
    % Konstruira matriko za givensovo rotacijo
    R = eye(n);
    R(p,p) = c;
    R(q,q) = c;
    R(p,q) = -s;
    R(q,p) = s;
end