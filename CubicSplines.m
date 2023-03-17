%---------------------------------------
%-------- NATURAL CUBIC SPLINE ---------
%---------------------------------------

% A code to construct Natural Cubic Spline polynomials for interpolation.
% Program : To approximate a function using Natural Cubic Splines.
% Pre-requisite program : NIL
% GitHub Repo(for pre-requisite codes) : https://github.com/Shubhajit412/NUMERICAL-ANALYSIS-AND-SCIENTIFIC-COMPUTING
%---------------------------------
% First give an appropriate values of m (prefferably m = 1000)in the command window.
% To use this function run the commands: CubicSplines in the command window.
%---------------------------------

tic;

n = 199;

%f = @(x) exp(x);          %..........function (A) to be tested.
%f =  @(x) 1 ./ (1 + x.^2);   %..........function (B) to be tested.
f = @(x) sin(x);          %..........function (C) to be tested.

%------------------------------------
%------ for equi-distant nodes ------
%------------------------------------
a = -1.0;
b = 1.0;
neval = 200;

x_nodes = linspace(-1.0,1.0,neval);
delta = (b - a) / (neval - 1);

f_vals = f(x_nodes);

%------------------------------------
%------- for evaluation nodes -------
%------------------------------------
for k = 0:1000
    x_eval(k+1) = -1 + ((2 * k) / 1000);
end

 %------------------------------------
 %------------------------------------
for i = 1:199
    a(i) = f_vals(i+1);
end
a_0 = f(x_nodes(1));

 %------------------------------------
 %-------------- STEP 1 --------------
 %------------------------------------

 for i = 1:199
     h_0 = x_nodes(2) - x_nodes(1);
     h(i) = x_nodes(i+1) - x_nodes(i);
 end

 %------------------------------------
 %-------------- STEP 2 --------------
 %------------------------------------

 for i = 2:198
     alpha(1) = ((3 / h(1)) * (a(2) - a(1))) - ((3 / h_0) * (a(1) - a_0));          
     alpha(i) = ((3 / h(i)) * (a(i+1) - a(i))) - ((3 / h(i-1)) * (a(i) - a(i-1)));
 end

 l_0 = 1;
 mu_0 = 0;
 z_0 = 0;

 %------------------------------------
 %-------------- STEP 3 --------------
 %------------------------------------

 for i = 2:198
     l(1) = 2 * (x_nodes(3) - x_nodes(1)) - (h_0 * mu_0);
     mu(1) = h(1) / l(1);
     z(1) = (alpha(1) - (h_0 * z_0)) / l(1);

     l(i) = 2 * (x_nodes(i+2) - x_nodes(i)) - (h(i-1) * mu(i-1));
     mu(i) = h(i) / l(i);
     z(i) = (alpha(i) - (h(i-1) * z(i-1))) / l(i);
 end

 l(200) = 1;
 z(200) = 0;
 c(200) = 0;
 c(199) = 0;

 for j = 198:-1:1
    c(j) = z(j) - mu(j) * c(j+1);
    c_0 = z_0 - mu_0 * c(1);

    b(j) = ((a(j+1) - a(j)) / h(j)) - (h(j) * (c(j+1) + 2*c(j))/3);
    b_0 = ((a(1) - a_0) / h_0) - (h_0 * (c(1) + 2*c_0)/3);

    d(j) = (c(j+1) - c(j))/(3*h(j));
    d_0 = (c(1) - c_0)/(3*h_0);
 end

 %------------------------------------
 %------------ FINAL STEP ------------
 %------------------------------------

 for i = 2:200
     for j = 1:m
         vals(j) = f(x_eval(j));
         if x_eval(j) < x_nodes(i)
            if i == 2
                apx(j) = a_0 + b_0 * (x_eval(j) - x_nodes(1)) + c_0 * (x_eval(j) - x_nodes(1))^2 + d_0 * (x_eval(j) - x_nodes(1))^3;
            else
                apx(j) = a(i-2) + b(i-2) * (x_eval(j) - x_nodes(i-1)) + c(i-2) * (x_eval(j) - x_nodes(i-1))^2 + d(i-2) * (x_eval(j) - x_nodes(i-1))^3;
            end
         end
     end
 end

error = max(abs(vals - apx));

fprintf('The require error = %d . \n', error);
toc

     
