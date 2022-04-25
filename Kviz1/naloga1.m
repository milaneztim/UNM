% 1. Naloga
X = [41.3477   41.1652   40.9966   40.8009   40.6111   40.4934   40.2494   40.0246   39.8930   39.6418   39.4306   39.1946   39.0827   38.8907   38.7291]';      
Y = [-17.8104  -17.7921  -17.7105  -17.7045  -17.7041  -17.7034  -17.7548  -17.8773  -17.9660  -18.1852  -18.2932  -18.4563  -18.6589  -18.8606  -19.1617]';

A = [X.*Y Y.^2 X Y ones(1,length(X))'];
b = -X.^2;

psevdoA = inv(A'*A)*A';
x1 = psevdoA*b; % x1 = A \ b

% Drugače do psevdo inverza:
%[U,Sigma,V] = svd(A);
%for i = 1:length(V)
%    if Sigma(i,i) ~= 0
%        Sigma(i,i) = 1/Sigma(i,i);
%    end
%end
%A_pseudo = V*Sigma'*U';

% x = [b,c,d,e,f]

F = @(x_,y_) [x_.^2 x_.*y_ y_.^2 x_ y_ ones(1,length(x_))']*[1; x1];

% --------------------------------------------------------------

[U,S,V] = svd([A b]);

x2 = -1/V(end,end)*V(1:end-1,end);
p = @(x) LocalElipse(x,x2);
dist = @(x) norm([x; p(x)] - [38.8907; -18.8606]);
dist(fminbnd(dist, -40,40))

