function Hx = hermitepoly(X, Y, dervY)

% where dervY is the first dervative of Y with respect to X

sizeX = size(X);
sizeY = size(Y);
sizedervY = size(dervY);

if max(sizeX) ~= max(sizeY) 
     error("Interpolation not possibe as data points of X and Y are not equal");
elseif sizeX(1) ~= 1 || sizeY(1) ~= 1 || sizedervY(1) ~= 1
    if sizeX(1) ~= 1
        X = transpose(X);
    elseif sizeY(1) ~= 1
        Y = transpose(Y);
    else
        dervY = transpose(dervY);
    end
end

L = lagrangeP(X);
[~, lcol] = size(L);
Vx = zeros(sizeX(2), 2.*lcol -1);

for i = 1:sizeX(2)
    Li = L(i, :);
    Vx(i,:) = conv(Li, Li);
end

sizeVx = size(Vx);

R = zeros(sizeX(2), sizeVx(2) + 1);
S = zeros(sizeX(2), sizeVx(2) + 1);

for i = 1:sizeX(2)
    Li = L(i, :);
    Xi = X(i);
    dervLi = polyder(Li);
    dervLiXi = polyval(dervLi, Xi);     
    Ux = [-2.*dervLiXi, Xi.*(2.*dervLiXi)+1];
    Rx = conv(Ux, Vx(i,:));
    R(i,:) = Rx;
end

for i = 1:sizeX(2)
    Xi = X(i);
    Ux = [1 -Xi];
    S(i,:) = conv(Ux, Vx(i,:));
end

YR = zeros(sizeX(2), sizeVx(2) + 1);
dervYS = zeros(sizeX(2), sizeVx(2) + 1);

for i = 1:sizeX(2)
    YR(i,:) = R(i,:) .* Y(i);
    dervYS(i,:) = S(i,:) .* dervY(i);
end

SumR = sum(YR);
SumS = sum(dervYS);

sizeSumR = size(SumR);
sizeSumS = size(SumS);
xH = [sizeSumR, sizeSumS];
maxH = max(xH);
H = zeros(2, maxH);

if max(sizeSumR) == maxH
    H(1, :) = SumR;
else
    j = maxH - max(sizeSumR);
    j = j + 1;
    H(1, j:maxH) = SumR;
end
if max(sizeSumS) == maxH
    H(2, :) = SumS;
else
    j = maxH - max(sizeSumS);
    j = j + 1;
    H(2, j:maxH) = SumS;
end

Hx = sum(H);


    

    
        