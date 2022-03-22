function A = gride(x1, x2, n, N)

Ls = linspace(x1, x2, n);
A = zeros(N, 2);

for i = 1:N
     A(i, 2) = Ls(1, (n.*i)/N);
    if i == 1
        A(i, 1) = Ls(1, 1);
    else
        A(i, 1) = A(i-1, 2);
    end
end
