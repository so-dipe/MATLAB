function yx = finitediff(DE, h, BC)

% The Differential Equation should be of the form
% y'' = f(x)y' + g(x) y + r(x)
% that is written in the symbolic matrix form DE = @x [f(x) g(x) r(x)]
%h represents the step size to use and BC the boundary condition in 1 by 4
%matrix form
%for example if the boundary condtions are given by
%y(a) = N1, y(b) = N2 then BC = [a N1 b N2]

range = [BC(1):h:BC(3)];
sizeRange = size(range);
n = sizeRange(2);

A = zeros(n-2, n-1);
b = zeros(n-2, 1);

for i = 1:(n-2)
    DEans = DE(i);
    f_i = DEans(1);
    g_i = DEans(2);
    r_i = DEans(3);
    if i == 1 || i == (n -2)
        if i == 1
            b(i) = -(2+h.*f_i).*BC(2) + 2.*(h.^2).*r_i;
        elseif i == (n - 2)
            b(i) = -(2 - h.*f_i).*BC(4) + 2.*(h.^2).*r_i;
        elseif i == 1 && i == (n-2)
            b(i) = (2.*(h.^2).*r_i) - ((2+h.*f_i).*BC(2)) - ((2 - h.*f_i).*BC(4));
        end
        A(i,i) = 2 + h.*f_i;
        A(i, i+1) = -4 - ((2.*g_i).*(h.^2));
        if i+2>n-1
            break;
        else
        A(i, i+2) = 2 - h.*f_i;
        end
    else
        b(i) = 2.*(h.^2).*r_i;
        A(i, i) = 2 + h.*f_i;
        A(i, i+1) = -4 - ((2.*g_i).*(h.^2));
        if i+2 > n-1
            break;
        else
        A(i, i+2) = 2 - h.*f_i;
        end
    end
end

yx = A(:,2:n-1)\b;


