function elimin =  gaussEliminat(A) 

%Basically this function turns a LINEAR System written in matrix form to a
%triangular matrix/ row echelon form. Just like the Gaussian Elimination
%Method.
   

[rows, cols] = size(A);
   for k = 1 : cols
        for i  = k : rows
            pivot = A(i,:) ./ A(i,k);
            
                    
            nextRow = i + 1;
            if nextRow <= rows
                
                    for j = nextRow : rows
                        if A(j, k) == 0
                            continue;
                        else
                        diffPivot = pivot .* A(j, k);
                        A(j, :) = A(j, :) - diffPivot;
                        end
                    end
               
            else 
                break;
            end
            
        end
   end
   
   elimin = A;
    
   