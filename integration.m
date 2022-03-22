function integration(fun)
n = fliplr(0:(length(fun) - 1));
for i = 1 : length(fun)
    if fun(i) == 0
        fun(i) = 0;
    else
        fun(i) = fun(i)/(n(i) + 1);
    end
end
n = n+1;
for j = 1:length(fun)
    if fun(j) > 0
        fprintf(' + %dx^%d ',fun(j), n(j) );
    elseif fun(j) < 0 || j == 1
        fprintf(' %dx^%d ',lowestterm(fun(j)), n(j) );
    else
        fprintf(' ');
    end
end
fprintf('%d', lowestterm(23, 36))
fprintf('\n')

    