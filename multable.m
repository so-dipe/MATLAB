function [prod, sume] = multable( n, m)
if (nargin < 2) 
    m = n;
end

prod = (1:n)' * (1:m);


if (nargout == 2)
    sume = sum(prod(:));
end


    