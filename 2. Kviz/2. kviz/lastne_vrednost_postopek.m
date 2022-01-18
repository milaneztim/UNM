% najvecja lastna vrednost
x = poweriteration(A' * A,  0.1 * ones(100, 1), 10);
sigma1 = sqrt(rayleigh(A' * A, x))

% najmanjsa lastna vrednost
x = poweriteration(inv(A' * A),  0.1 * ones(100, 1), 10);
sigman = sqrt(rayleigh(A' * A, x))

% spektralna obcutljivost
sigma1 / sigman