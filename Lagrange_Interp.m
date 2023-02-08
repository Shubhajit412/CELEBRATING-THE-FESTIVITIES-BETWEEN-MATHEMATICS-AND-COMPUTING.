%---------------------------------------
%------ INTERPOLATING FUNCTIONS --------
%---------------------------------------

% A code to interpolate functions f with Lagrange polynomials.
% Program : To interpolate f.
% Pre-requisite program : Lagrange_basis.m 
%---------------------------------
% The main function defined is Lagrange_Interp().
% To use this function run the commands: Lagrange_Interp(appropriate inputs)
% in the command window.
%---------------------------------

function [polyInterp] = Lagrange_Interp(fdata, x_nodes, eval_nodes) 
% Input :  - fdata, a vector of function values at (n+1) nodes.
%          - x_nodes, a vector of size (n+1) storing the values of nodes x_k (k=0,1,2,..n)
%          - eval_nodes, a vector of test points. 
% Output : - PX, polynomial approximation of f at the all evaluation points.

n = length(fdata) - 1;
polyInterp = zeros(size(eval_nodes));

for k = 0:n 
    yk = fdata(k + 1);
    L_k = Lagrange_basis(eval_nodes,x_nodes,k);
    polyInterp = polyInterp + (yk * L_k);
end
