function [Num, Str] = longDiv(Numer, Denom, dps)

%intNumer = int32(Numer);
%intDenom = int32(Denom);

Deci = zeros(1, dps+2);
Divis = zeros(1, dps+1);
Divis(1) = Numer;


for i = 1:(dps+2)
    Div = floor(Divis(i)./Denom);
    Rem = abs(Divis(i) - (Div.*Denom));
    Deci(i) = Div;
    if Rem < Denom
        a = int2str(Rem);
        b = join([a,'0']);
        c = str2double(b);
        %d = int32(c);
        Divis(i+1) = c;
    elseif Rem > Denom
        Divis(i+1) = Rem;
    else
        break;
    end    
end
if Deci(dps+2) <=5
    Deci(dps+2) = 0;
    Num = Deci(1,1:dps+1);
elseif Deci(dps+2) >=5
    Deci(dps+2) = 0;
    Deci(dps+1) = Deci(dps+1) + 1;
    Num = Deci(1, 1:dps+1);
end

Strings = string(Deci);
Stri = Strings(1) + ".";
for i = 2:(dps+1)
    Stri = Stri + Strings(i);
end
Str = Stri;

