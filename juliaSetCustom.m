function juliaSetCustom(iter, c, n, M, x0, x1)

cx = linspace(x0, x1, n);
cy = linspace(x0, x1, n);
[X, Y] = meshgrid(cx, cy);
maxCx = max(size(cx));
maxCy = max(size(cy));
pic = zeros(maxCx, maxCy);

for k = 1:iter
    Fz = fractalpoly(X + 1i*Y, c, k);
    abso = abs(Fz);
    for i = 1: maxCx
        for j = 1: maxCy
            if abso(i, j) > M && pic(i, j) == 0
                pic(i, j) = k;
            end
        end
    end
end

imagesc(pic);