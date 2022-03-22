function Fz = fractalpoly(z, c, n) 
    if n == 0
        Fz = z.^2 + c;
    else
        Fz = (fractalpoly(z, c, n-1)).^2 + c;
    end
end