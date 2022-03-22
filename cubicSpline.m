function A = cubicSpline(X, Y)

[~, sizeX] = size(X);
[~, sizeY] = size(Y);

if sizeX ~= sizeY
    error("unequal number of data points, therefore cannot construct spline\n");
end

M = zeros(sizeX, 1);
h = zeros(1, sizeX -1);
for i = 1:max(size(h))
    h(i) = X(i+1) - X(i);
end

%R = [ones(sizeX-2, 1), 4.*ones(sizeX-2, 1), ones(sizeX-2, 1)];
R = zeros(sizeX-2, sizeX);
RHS = zeros(sizeX-2, 1);

for i = 1:(sizeX -2)
    R(i,i:i+2) = [1, 4, 1];
    RHS(i) = (6./h(i)).*(Y(i+2) - 2.*Y(i+1) + Y(i));
end

R(1,1) = 0;
[r, c] = size(R);
R(r,c) = 0;

M = R\RHS;

CS = zeros(sizeX -1, 4);

for i = 1:sizeX-1
    U = [0, 0, -1, X(i+1)];
    V = [0, 0, 1, -X(i)];
    U_3 = conv(U(3:4), conv(U(3:4), U(3:4)));
    V_3 = conv(V(3:4), conv(V(3:4), V(3:4)));
    Coff1 = (M(i)./6).*U_3;
    Coff2 = (M(i+1)./6).*V_3;
    Coff3 = (Y(i) - ((h(i).^2)./6).*M(i)).*U;
    Coff4 = (Y(i+1) - ((h(i).^2)./6).*M(i+1)).*V;
    Sum = Coff1 + Coff2 + Coff3 + Coff4;
    CS(i,:) = (1./h(i)).*Sum;    
end
    
A = CS;