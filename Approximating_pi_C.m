%-----------------------------
%-- ARCTAN EXPANSION METHOD --
%-----------------------------
% The main function is Approximating_pi_C() which basically apprimates the
% value of pi, when given an appropriate input variable and also returns
% the relative error made while approxiamting pi.
%-----------------------------
% To use this function run the command:
% [calculted_pi, relative_error] = Approximating_pi_C(any proper integer value)
% in the command window.
%-----------------------------

function [calculated_pi, calculated_error] = Approximating_pi_C(n)
% Input: number of points to consider.
% Output: the approximated pi.
summands = n;

    function N = ARCTAN(n)
% Input: the current summand number, n.
% Output: numerator in the Madhava-Gregory-Leibniz Series summation term.
N = ((-1)^n) * (1)^((2 * n) + 1);
end

function err = relative_error(m)
% Input: the calculated value of pi.
% Output: the relative error of the approximation.

x_m = m;
nume = abs(pi - x_m);
dino = abs(pi);
err = nume/dino;
end

sum = 0;

for n = 0:summands - 1
numerator = ARCTAN(n);
denominator = (2 * n) + 1;
sum = sum + (numerator/denominator);
end

calculated_pi = 4 * (sum);
calculated_error = relative_error(calculated_pi);
end