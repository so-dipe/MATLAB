function [lowStr, lowNum, lowDenom, divided]  = lowestterm( numer, denom) 

%% this function takes in two arguments numer for NUMERATOR and denom for DENOMINATOR
%% and returns an array or column vector of result where lowStr (i.e the
%% first output) is the new fraction(lowest term) in character form
%% (num/denom - / represents division), 
%% lowNum represents the lowest possible numerator as an Integer
%% lowDenom represents the lowest possible deniminator as an Integer
%% divided represents the actual division of the number as a double/ floating
%% point number




if nargin == 2 % for two argument input i.e Numerator and Denominator
    stringNumer = num2str(numer);  %convert numnerator to string
    stringDenom = num2str(denom); %convert denominator to string
    for i = 1:length(stringNumer)       %moving decimal place
        dotposnumer = 0; 
        if stringNumer(i) == '.' 
            ipos = i;
            dotposnumer = length(stringNumer) - ipos;
            break;
        end
    end
    for j = 1:length(stringDenom)
        dotposdenom = 0;
        if stringDenom(j) == '.'
            ipos2 = j;
            dotposdenom = length(stringNumer) - ipos2;
            break;
        end 
    end
    %recreate number with decimal point moved.
    dotmove = dotposnumer + dotposdenom;
    autonumer = str2double(stringNumer) .* (10.^dotmove);
    autodenom = str2double(stringDenom) .* (10.^dotmove);
    intNumer = int32(autonumer);
    intDenom = int32(autodenom);
    divided = numer/denom;
else  %single argument input presumably a decimal number since it's the general idea
    stringNum = num2str(numer);
    for i = 1:length(stringNum)
        if stringNum(i) == '.'          %moving decimal place
            ipos = i;
            dotpos = length(stringNum) - ipos;
            stringNum(i) = '';
            autonumer = str2double(stringNum);
            autodenom = 10.^(dotpos);
            break
        else 
            autonumer = str2double(stringNum);
            autodenom = 1;
        end
    end
    intNumer = int32(autonumer);        %convertnumber to integer
    intDenom = int32(autodenom);
    divided = autonumer/autodenom;
end
    if intNumer <= intDenom
        m = intNumer;
    else
        m = intDenom;
    end
    n = m;
    while n <= m && n > 0
        i = intNumer/n;
        j = intDenom/n;
        if (i * n) == intNumer && (j * n) == intDenom
            if ~isinteger(i) && ~isinteger(j)
                n = n - 1;
            else
                newNumer = i;
                newDenom = j;
                n = n - 1;
                    if newDenom == 1
                        lowStr = sprintf(' %d ', newNumer);
                        lowNum = newNumer;
                        lowDenom = newDenom;
                        break;
                    else
                        lowStr = sprintf(' %d/%d ', newNumer, newDenom);
                        lowNum = newNumer;
                        lowDenom = newDenom;
                        break;
                    end
            end
        else
            n = n - 1;
        end
    end

fprintf('\n');


          