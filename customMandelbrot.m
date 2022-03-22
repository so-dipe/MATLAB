function customMandelbrot(n, maxiter, x1, x2, x3, x4) 

cx = linspace(x1, x2, n);
cy = linspace(x3, x4, n);
[X, Y] = meshgrid(cx, cy);
maxCx = max(size(cx));
maxCy = max(size(cy));
pic = zeros(maxCx, maxCy);

for k = 1:maxiter
    Fz = fractalpoly(0, X + 1i*Y, k);
    abso = abs(Fz);
    for i = 1: maxCx
        for j = 1: maxCy
            if abso(i, j) > 2 && pic(i, j) == 0
                pic(i, j) = k;
            end
        end
    end
end

imagesc(pic);