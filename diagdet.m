function det = diagdet(A)

    [rows, cols] = size(A);
    detMat = gaussElim(A);
    if rows == cols
        diagon = diag(detMat);
        det = 1;
        for i = 1:rows
            det = det .* diagon(i);
        end
    else
        det = NaN;
    end
