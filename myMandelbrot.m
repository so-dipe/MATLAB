function myMandelbrot(n, iter)
cx = linspace(-2, 0.75, n);
cy = linspace(-1.5, 1.5, n);
[X, Y] = meshgrid(cx, cy);

Fz = fractalpoly(0, (X + 1i*Y), iter);
abso = abs(Fz);
maxCx = max(size(cx));
maxCy = max(size(cy));

for i = 1: maxCx
    for j = 1: maxCy
        if abso(i, j) > 2
            abso(i, j) = 1;
        else
            abso(i, j) = 0;
        end
    end
end

imagesc(abso);
colormap(hot);
