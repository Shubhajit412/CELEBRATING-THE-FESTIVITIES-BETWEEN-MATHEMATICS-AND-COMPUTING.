%---------------------------------------
%---- PIECEWISE POLY INTERPOLATION -----
%---------------------------------------

% A code to conduct piecewise 'linear' polynomial interpolation.
% Program : To approximate a function using piecewise poly interpolation.
% Pre-requisite program : Lagrange_basis.m, Lagrange_Interp.m
% GitHub Repo(for pre-requisite codes) : https://github.com/Shubhajit412/NUMERICAL-ANALYSIS-AND-SCIENTIFIC-COMPUTING
%---------------------------------
% To use this function run the commands: LinearPieceInterp in the command window.
%---------------------------------

tic;

%f = @(x) exp(x);          %..........function (A) to be tested.
%f =  @(x) 1 ./ (1 + x.^2);   %..........function (B) to be tested.
%f = @(x) sin(x);          %..........function (C) to be tested.

n = 5;          %...........degree of the Lagrange polynomial to be used. 
 
%------------------------------------
%------ for equi-distant nodes ------
%------------------------------------
a = -1.0;
b = 1.0;
neval = 200;
x_nodes = linspace(-1.0,1.0,neval);
delta = (b - a) / (neval - 1);

%------------------------------------
%------- for evaluation nodes -------
%------------------------------------
for k = 0:1000
    x_eval(k+1) = -1 + ((2 * k) / 1000);
end

%------------------------------------
%------------------------------------
for i = 1:10:190
    for l = 1:1001
        if x_eval(l) < x_nodes(i + 10)
            iter = 1;
            for j = i:i+10           %.......here, we change the number of points to be considered if n changes.
                nodes(iter) = x_nodes(j);
                fdata(iter) = f(x_nodes(j));
                iter = iter + 1;
            end
        else
            break
        end
    end
 
    interp = Lagrange_Interp(fdata, nodes, x_eval(l));
end

error = max(abs(interp - f(x_eval)));

fprintf('The require error = %d . \n', error);
toc


