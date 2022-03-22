function elimin =  gaussElim(A)

%Basically this function turns a LINEAR System written in matrix form to a
%triangular matrix/ row echelon form. Just like the Gaussian Elimination
%Method.
   

[rows, cols] = size(A);
ZeroTrilCheck = 1;
%     if rows == cols
%         %A is a square MATRIX
%     else 
%         remx = abs(rows - cols);
%         if rows > cols
%             %More Rows than Columns
%             stat = logical(1);
%         else
%             %More Columns than rows
%             stat = logical(0);
%         end
%     end
   for k = 1 : cols
        for i  = k : rows
            if i ~= rows
             pivotCell = A(i,i);
            end
             
                if pivotCell == 0 
                     E = eye(cols, rows);
                     pivotColn = A(:,k);
                 for z = k : rows
                   if pivotColn(z) ~= 0
                         E(i+1,k) = 1;
                         E(k,i+1) = 1;
                         E(k,k) = 0;
                         E(i+1,i+1) = 0;
                         A = E * A;
                         newA = A(1:rows, :);
                         A = newA;
                         pivot = A(i,:) ./ A(i,k);
                         break;
                    end
                  end
                    else
                         pivot = A(i,:) ./ A(i,k);
                end
              
            nextRow = i + 1;
            if nextRow <= rows
                    for j = nextRow : rows
                       if A(j, k) == 0
                            continue;
                       else
                            diffPivot = pivot .* A(j, k);
                            A(j, :) = A(j, :) - diffPivot;
                       end
                         for n = 1:rows
                            ZeroTrilCheck = A(n, 1:n);
                         end
                    end
             
            else 
                break;
            end
             if ZeroTrilCheck == 0
                break;
            end
        end
   end
   
   elimin = A;

   

   
   