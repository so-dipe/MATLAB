function L = lagrangeP(X)

sizeX = size(X);

L = zeros(sizeX(2));
L(:,sizeX(2)) = 1;

for i = 1:sizeX(2)
    numer = zeros(sizeX(2), 2);
    denom = zeros(1,sizeX(2));
    for j = 1:sizeX(2)
        if j ~= i
            denom(j) = X(i) - X(j);
            numer(j, :) = [1./denom(j), - X(j)./denom(j)];
        else 
            continue;
        end
        if numer(j,:) ~= 0
           n_L = conv(L(i,:), numer(j,:));
           L(i,:) = n_L(1, 2:sizeX(2)+1);
        end
    end
end