function [p,q,a] = maxoff(A)
% Vrne največjo izvendiagonalno vrednost matrike
    tempA = abs(A - diag(diag(A)));
    [M, I] = max(tempA);
    [a, i] = max(M);
    p = I(i);
    q = i;
end