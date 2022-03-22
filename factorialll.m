function f = factorialll(n)

if ~isinteger(n) || n < 0 || ~isscalar(n)
    error('n must be a real non-negative integer and a scaler');
end

if n == 0
    f = 1;
else
    f = n .* factorialll(n -1);
end