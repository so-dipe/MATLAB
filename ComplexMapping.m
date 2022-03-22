%To plot the graph of a complex function
%This is done using complex mapping idea.

% step one: define the range for the real axis
prompt1 = "Enter real axis range, e.g [0:1:5] for start 0, step 1, stop 5\n";
x = input(prompt1);

%step 2: define the range for the imaginary axis
%prompt2 = "Enter imag. axis ramge, e,g [0:1:5] for start 0, step 1, stop 5\n";
%y = input(prompt2);

[X,Y] = meshgrid(x, x);

Z = complex(X,Y);

%Enter complex function f(Z)
prompt3 = "Enter complex function, e.g Z.^2\n";
f_Z = input(prompt3);

Re_fZ = real(f_Z);
Im_fZ = imag(f_Z);

sizeRe = size(Re_fZ);
sizeIm = size(Im_fZ);

u_xy = 0;
v_xy = 0;

for i = 1: sizeRe(2)
    u_xy = [u_xy, Re_fZ(i,:)];
    v_xy = [v_xy, Im_fZ(i,:)];
end

scatter(u_xy, v_xy);






