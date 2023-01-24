%---------------------------------------
%------------- REGULA FALSI ------------
%---------------------------------------

% A code to implement the Secant method to find roots of equations.
% Program : To approximate a root of the equation
% f(x) = 0 in the interval [a, b]. 
%---------------------------------
% The main function defined is Regula().
% To use this function run the commands: [numit,p,relerr,P] = Regula(appropriate inputs)            
% in the command window.
%---------------------------------



function [numit,p,relerr,P] = Regula(g,pzero,pone,tol,maxit)
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
eps = 10^-12;
P(1) = pzero;
P(2) = pone;
num = feval(g,P(2)) * (P(2) - P(1));
din = feval(g,P(2)) - feval(g,P(1));
P(3) = P(2) - (num/din);

for k = 3:maxit
    if (sign(feval(g,P(k-1))) * sign(feval(g,P(k))) > 0) %...................signum function used to handle an unforseen undervalue problem.
        P(k-1) = P(k-2);
    end

    numerator = feval(g,P(k)) * (P(k) - P(k-1));
    dinominator = feval(g,P(k)) - feval(g,P(k-1));
    P(k+1) = P(k) - (numerator/dinominator);

    err = abs(P(k+1) - P(k));
    relerr = err/(abs(P(k+1) + eps)); %......................................machine epsilon is added in order to balance out some error for division.
    p = P(k+1);

    if (err < tol) || (relerr < tol )
        break;
    end

    
end

numit = k + 1;
if k >= maxit 
    disp('number of maximum iterations exceeded')
else
    fprintf('Five digit accurate approximaion of fix point computed in %d iterations. \n',k);   
end

P = P';
toc
end
