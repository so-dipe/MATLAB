function colorMandelbrot(n, maxiter) 

cx = linspace(-2, 0.75, n);
cy = linspace(-1.5, 1.5, n);
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
%colormap(hot);
    