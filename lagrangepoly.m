function poly = lagrangepoly(X, Y)

sizeX = size(X);
sizeY = size(Y);


if max(sizeX) ~= max(sizeY)
    error("Interpolation not possibe as data points of X and Y are not equal");
elseif sizeX(1) ~= 1 || sizeY(1) ~= 1
        if sizeX(1) ~= 1
            X = transpose(X);
        else
            Y = transpose(Y);
        end
end

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

P = L.*Y';
P_x = zeros(1, sizeX(2));
for i = 1:size(L)
    P_x(i) = sum(P(:,i));
end
poly = P_x;




    
    
    