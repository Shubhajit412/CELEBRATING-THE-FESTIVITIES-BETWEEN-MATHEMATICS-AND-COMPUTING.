%---------------------------
%--- MONTE-CARLO METHOD ----
%---------------------------
% The main function is Approximating_pi_A() which basically apprimates the
% value of pi, when given an appropriate input variable and also returns
% the relative error made while approxiamting pi.
%---------------------------
% To use this function run the command:
% [calculted_pi, relative_error] = Approximating_pi_A(any proper integer value)
% in the command window.
%---------------------------

function [calculated_pi, calculated_error] = Approximating_pi_A(n)
% Input: number of points to consider.
% Output: the approximated pi.
circ =0;
points = n;

function N = NORM(x, y)
% Input: co-ordinates x and y.
% Output: the Euclidean Norm of (x, y).
a = max(x, y);
b = min(x, y);
c = (a/b)^2 + 1;
N = sqrt(c) * b;
end

function err = relative_error(m)
% Input: the calculated value of pi.
% Output: the relative error of the approximation.

x_m = m;
nume = abs(pi - x_m);
dino = abs(pi);
err = nume/dino;
end

for iter = 1:points
   rng shuffle
   x = rand;
   y = rand;

   if NORM(x, y) < 1
        circ = circ + 1;
   end
end

calculated_pi = 4 * (circ/points);
calculated_error = relative_error(calculated_pi);
end


