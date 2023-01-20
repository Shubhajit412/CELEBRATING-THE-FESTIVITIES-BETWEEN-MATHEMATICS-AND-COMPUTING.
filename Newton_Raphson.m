%---------------------------------------
%------- NEWTON - RAPHSON METHOD -------
%---------------------------------------

% A code to implement the Newton-Raphson method to find roots of equations.
% Program : To approximate a root of the equation
% f(x) = 0 in the interval [a, b]. 
%---------------------------------
% The main function defined is Newton-Raphson().
% To use this function run the commands:
%           1. syms x;
%           2. [numit,p,relerr,P] = Newton_Raphson(appropriate inputs)
% in the command window.
% Note: the input 'g' must me symbolic expression.
%---------------------------------



function [numit,p,relerr,P] = Newton_Raphson(g,pzero,tol,maxit)
% Input :  - g, the iteration function.
%          - pzero, the initial guess for the root.
%          - tol, tolrence.
%          - maxit, maximum number of iteraions.
% Output : - numit, the number of iterations that were carried out.
%          - p, the approximation to the fixed point/ root
%          - relerr, the relative error in the approximation.
%          - P, it contains the sequence pn.

tic;
syms x;

format long e; %...........................................................see the matlab format command
P(1) = pzero;
eps = 10^-12;

f = diff(g);

for k = 2:maxit
    g0 = vpa(subs(g,x,P(k-1)));
    g0_derr = vpa(subs(f,x,P(k-1)));

    P(k) = P(k-1) - (g0/g0_derr);

    err = abs(P(k) - P(k - 1));
    relerr = err/(abs(P(k) + eps)); %......................................machine epsilon is added in order to balance out some error for division.
    p = P(k);

    if (err < tol) || (relerr < tol )
        break;
    end
end

numit = k;
if k >= maxit 
    disp('number of maximum iterations exceeded')
else
    fprintf('Five digit accurate approximaion of fix point computed in %d iterations. \n',k);   
end

P = P';
toc
end
