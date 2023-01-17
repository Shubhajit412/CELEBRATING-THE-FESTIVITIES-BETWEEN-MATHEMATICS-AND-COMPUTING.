%---------------------------
%---- BISECTION METHOD -----
%---------------------------

% A code to implement the bisection method to find roots of polynomials.
% Program : To approximate a root of the equation
% f(x) = 0 in the interval [a, b]. 
%---------------------------------
% The main function defined is bisect().
% To use this function run the command:
% [root,err,f_root] = my_bisect(appropriate input variables)
% in the command window.
%---------------------------------



function [root,err,f_root] = Bisect(f,a,b,delta)
% Proceed with the method only if f (x) is continuous and 
% f(a) and f(b) have opposite signs.
% Inputs:  - f, the function input as a string fs.
%          - a and b, the left and right endpoints of the 'compact' interval.
%          - delta, the tolerance.
% Outputs: - c is the zero.
%          - yc = f(c).
%          - err, the error estimate for c.
tic;

ya = feval(f,a);
yb = feval(f,b);
maxit = 0; %......................................................maximum number of iterations.

if (ya * yb > 0)
    fprintf('f(a) and f(b) are not of the opposite sign.\n Please select the interval wisely!');
    return;
end

 
max_bdd = 1 + round((log(b-a)-log(delta))/log(2));
fprintf('This method will require at most %d iterations to produce %e accurate computed solution.\n',max_bdd,delta );

for k = 1:max_bdd
    root = (a + b)/2;
    f_root = feval(f,root);
    if f_root == 0
       a = root;
       b = root;
    elseif yb * f_root > 0
       b = root;
       yb = f_root; 
    elseif ya * f_root > 0
       a = root;
       ya = f_root;
    end

    if b - a < delta 
       maxit = k;
    break,
    end
end

fprintf('Desired root is obtained in %d iterations. \n',maxit);   
root = (a + b)/2;
err = abs(b - a);
f_root = feval(f,root);

toc
end
