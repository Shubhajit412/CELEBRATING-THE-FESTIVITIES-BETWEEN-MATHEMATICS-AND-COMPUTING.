%--------------------------------------------
%---- RAMANUJAN's INFINITE SERIES METHOD ----
%--------------------------------------------
% The main function is Approximating_pi_D() which basically apprimates the
% value of pi, when given an appropriate input variable and also returns
% the relative error made while approxiamting pi.
%--------------------------------------------
% To use this function run the command:
% [calculted_pi, relative_error, time elapsed] = Approximating_pi_D(any proper integer value)
% in the command window.
%--------------------------------------------

function [calculated_pi, calculated_error, time_elapsed] = Approximating_pi_D(n)
% Input: number of points to consider.
% Output: the approximated pi.
tic;
summands = n;

function N = SERIES(n)
% Input: the current summand number, n.
% Output: summation the series involved in the Ramanuja-Gregory-Daviv Series.
numerator = (-1^(rem(n,2))) * factorial(6 * n) * (13591409 + (545140134 * n));
denominator = factorial(3 * n) * ((factorial(n))^3) * (640320)^((3 * n) + 3/2);
N = numerator/denominator;
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
sum = sum + SERIES(n);
end

calculated_pi = abs(1 / (12 * (sum)));
calculated_error = relative_error(calculated_pi);
time_elapsed = toc;
end