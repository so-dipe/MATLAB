function numb = lowterm(numer, denom)

lcm = 0;
while(lcm ~= 1)
    if numer > denom
        maxNum = numer;
        minNum = denom;
    else
        maxNum = denom;
        minNum = numer;
    end

    factorsMax = factor(maxNum);
    [~, sizeMax] = size(factorsMax);
    factorsMin = factor(minNum);

    for i = 1:sizeMax
        if factorsMax(i) == lcm
            lcm = 1;
            continue;
        end
        for j = 1:max(size(factorsMin))
            if factorsMin(j) == lcm
                lcm = 1;
                continue;
            end
            if factorsMax(i) == factorsMin(j)
                lcm = factorsMax(i);
                numer = numer/lcm;
                denom = denom/lcm;
            else 
                lcm = 1;
            end
        end
        if lcm == 0
            lcm = 1;
        end
    end
end

numb = sprintf(' %d/%d ', numer, denom);

