function mat = gaussJordan(A)

[row, col] = size(A);


if row > col
    for i = 1:col
        A = pivot(A, i, i);
    end
elseif row < col
    for i = 1:row
        A = pivot(A, i, i);
    end
else
    for i = 1:row
        A = pivot(A, i, i);
    end
end
 mat = A;
 