%---------------------------------------
%---------- INTERPOLATION --------------
%---------------------------------------

% A code to provide the interpolating polynomial to 
% interpolate f with Lagrange polynomials.
% Program : To interpolate f.
% Pre-requisite program : NIL 
%---------------------------------
% The main function defined is Interpol().
% To use this function run the commands: Interpol(appropriate inputs)
% in the command window.
%---------------------------------

function [n,P] = Interpol(x_val,f_val)
% Input :  - fX, a vector of function values at (n+1) nodes.
%          - X, a vector of size (n+1) storing the values of nodes x_k (k=0,1,2,..n)
% Output : - n, degree of the interpolating polynomial.
%          - P, the interpolating polynomial.
tic;
syms x;

k = size(x_val);
n1 = k(2);
K = x - x_val; %..........here jth entry of K corresponds to x-X(j).

for j = 1:n1
    X1 = K;
    X2 = x_val;

    X1(j)=[];
    X2(j)=[];

    Num = prod(X1);           %.......numerator for lagrange polynomial.
    Den = prod(x_val(j)-X2);  %........ denominator for lagrange polynomial.
    L(j) = simplify(Num/Den); %..........jth Lagrange polynomial.
end

P = simplify(sum(f_val.*L)); %............the interpolating polynomial.
n = polynomialDegree(P,x);

toc
end