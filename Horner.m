%---------------------------------------
%----------- HORNER'S METHOD -----------
%---------------------------------------

% A code to implement the Horner's method to find roots of equations.
% Program : To approximate a root of a given polynomial. 
%---------------------------------
% The main function defined is Horner().
% To use this function run the commands: [P,Q] = Horner(appropriate inputs)
% in the command window.
% Note : The user must input the "coeff" array in accordance with the input
% variable 'n'. 
%---------------------------------

function [P,Q] = Horner(n, x_0)
% Input :  - n, degree of the polynomial.
%          - coeff, the coefficients of P(x).
%          - x_0, evaluation point.
% Output : - P, the value of P(x_0).
%          - Q, the value of P'(x_0). 

coeff = input("Enter the coefficients in vector : ");
tic;

P = coeff(1);
Q = coeff(1);

for k = 2:n
    P = x_0 * P + coeff(k);
    Q = x_0 * Q + P;
end

P = x_0 * P + coeff(n+1);
toc
end