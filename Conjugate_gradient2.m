function [x_out, F_out] = Conjugate_gradient2()
%Inputs : 
%Q,b : coefficient in the objective function
[Q] = input('Enter the definite postive matrix :  ');
[b] = input('Enter the column vector : [e ; f] ' );
c = input('Enter the constant ');
[x_0] = input('Enter initial values: [0; 0] ' );
 
%Output :
%x : optimal solution
n = length(b);
x = zeros(n, 1);
G = Q*x_0 - b;
D = -G;
k = 0;
 
%Objective function is
f = @(x1, Q1, b1, c) 0.5*x1'*Q1*x1 - b1'*x1 + c;
 
alpha = - (G'*D) /(D'*Q*D);
x = x + alpha*D;
G = Q*x - b;
if (norm(G) == 0)
    fprintf('x_0 is the optimal solution');
    return;
end

beta = (G'*Q*D) /(D'*Q*D);
D = - G + beta*D;
 
 
while((k < n) && (norm(G) ~= 0))
    %Gnorm = norm(G); 
    k = k + 1;
    alpha = - (G'*D) /(D'*Q*D);
    x = x + alpha*D;
    G = Q*x - b;
    beta = (G'*Q*D) /(D'*Q*D);
    D = - G + beta*D; 
    %output :
    %x : optimal solution
    F = f(x, Q, b, c);
end
x_out = x;
F_out = F;

