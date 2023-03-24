%-----------------------------------------
%------- COMPOSITE SIMPSON'S RULE ------
%-----------------------------------------
% A code to implement the Composite Simpson's Rule to find definite integral of a function.
% Program : To approximate the definite integral of a function. 
%---------------------------------
% The main function defined is Simpsn().
% To use this function run the commands: Simpsn(appropriate inputs)
% in the command window.
%---------------------------------

function [f_val]= Simpsn(a, b, f, n)
h = (b - a) / n;
term_A = (h / 3) * (f(a) + f(b));
%-----------

sum = 0;
for i = 1:(n/2)-1
    sum = sum + f(a + (2 * i * h));
end
term_B = ((2 * h) / 3) * sum;
%-----------

bum = 0;
for i = 1:(n/2)
    bum = bum + f(a + (((2 * i) - 1) * h));
end
term_C = ((4 * h) / 3) * sum;
%-----------

f_val = term_A + term_B + term_C;
end

function [err] = Eroro(former, later)
    err = abs(former - later);
end