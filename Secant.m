%---------------------------------------
%------------ SECANT METHOD ------------
%---------------------------------------

% A code to implement the Secant method to find roots of equations.
% Program : To approximate a root of the equation
% f(x) = 0 in the interval [a, b]. 
%---------------------------------
% The main function defined is Secant().
% To use this function run the commands: [numit,p,relerr,P] = Secant(appropriate inputs)            
% in the command window.
%---------------------------------



function [numit,p,relerr,P] = Secant(g,pzero,pone,tol,maxit)
% Input :  - g, the iteration function.
%          - pzero, the initial guess for the root.
%          - pone, the second initial guess for the root.
%          - tol, tolrence.
%          - maxit, maximum number of iteraions.
% Output : - numit, the number of iterations that were carried out.
%          - p, the approximation to the fixed point/ root
%          - relerr, the relative error in the approximation.
%          - P, it contains the sequence pn.

tic;


format long e; %...........................................................see the matlab format command
P(1) = pzero;
P(2) = pone;
eps = 10^-12;



for k = 3:maxit
    numerator = feval(g,P(k-1)) * (P(k-1) - P(k-2));
    dinominator = feval(g,P(k-1)) - feval(g,P(k-2));
    P(k) = P(k-1) - (numerator/dinominator);

    err = abs(P(k) - P(k - 1));
    relerr = err/(abs(P(k) + eps)); %......................................machine epsilon is added in order to balance out some error for division.
    p = P(k);

    if (err < tol) || (relerr < tol )
        break;
    end
end

numit = k - 1 ;
if k >= maxit 
    disp('number of maximum iterations exceeded')
else
    fprintf('Five digit accurate approximaion of fix point computed in %d iterations. \n',k);   
end

P = P';
toc
end
