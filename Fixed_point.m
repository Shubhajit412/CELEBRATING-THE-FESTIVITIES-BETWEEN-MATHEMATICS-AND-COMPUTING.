%---------------------------------------
%---- FIXED-POINT ITERATION METHOD -----
%---------------------------------------

% A code to implement the fixed point iteration method to find roots of equations.
% Program : To approximate a root of the equation
% f(x) = 0 in the interval [a, b]. 
%---------------------------------
% The main function defined is Fixed_point().
% To use this function run the command:
% [numit,p,relerr,P] = Fixed_point(appropriate inputs)
% in the command window.
%---------------------------------



function [numit,p,relerr,P] = Fixed_point(g,pzero,tol,maxit)
% Input :  - g, the iteration function.
%          - pzero, the initial guess for the fixed point.
%          - tol, tolrence.
%          - maxit, maximum number of iteraions.
% Output : - numit, the number of iterations that were carried out.
%          - p, the approximation to the fixed point/ root
%          - relerr, the relative error in the approximation.
%          - P, it contains the sequence pn.

tic;

format long e; %...........................................................see the matlab format command
P(1) = pzero;
eps = 10^-12;

for k = 2:maxit
    P(k) = feval(g,P(k-1));
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


%---------------------------------
%---- experiment instructions ----
%---------------------------------

% Take g = @(x) x - x^3 - 4 * x^2 + 10;     (will get divergent sequence)
% Take g = @(x) (10/x - 4 * x)^(0.5);       (became undefined, square root of -ve number involved)
% Take g = @(x) 0.5 * (10 - x^3)^(0.5);
% Take g = @(x) (10/(4.0 + x))^(0.5);
% Take g = @(x) x - ((x^3 + 4 * x^2 - 10)/(3.0 * x^2 + 8 * x));      (theoretically the fastest)    

