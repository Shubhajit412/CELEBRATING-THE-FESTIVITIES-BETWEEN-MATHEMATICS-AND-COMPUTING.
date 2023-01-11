%-----------------------------
%-- RIEMANN INTEGRAL METHOD --
%-----------------------------
% The main function is Approximating_pi_B() which basically apprimates the
% value of pi, when given an appropriate input variable and also returns
% the relative error made while approxiamting pi.
%-----------------------------
% To use this function run the command:
% [calculted_pi, relative_error] = Approximating_pi_B(any proper integer value)
% in the command window.
%-----------------------------

function [calculated_pi, calculated_error] = Approximating_pi_B(n)
% Input: number of points to consider.
% Output: the approximated pi.
rectangles = n;
delta = (1 - 0)/rectangles;

function N = SERIES(x)
% Input: x co-ordinate.
% Output: the y co-ordinate of that (x, y) belongs in Gamma.
N = sqrt(1 - (x^2));
end

function err = relative_error(m)
% Input: the calculated value of pi.
% Output: the relative error of the approximation.

x_m = m;
nume = abs(pi - x_m);
dino = abs(pi);
err = nume/dino;
end

x = 0;
sum = 0;

while x < 1
f_x = SERIES(x);
sum = sum + (f_x * delta);
x = x + delta;
end

calculated_pi = 4 * (sum);
calculated_error = relative_error(calculated_pi);
end