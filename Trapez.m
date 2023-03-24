%-----------------------------------------
%------- COMPOSITE TRAPEZOIDAL RULE ------
%-----------------------------------------
% A code to implement the Composite Trapezoidal Rule to find definite integral of a function.
% Program : To approximate the definite integral of a function. 
%---------------------------------
% The main function defined is Trapez().
% To use this function run the commands: Trapez(appropriate inputs)
% in the command window.
%---------------------------------


function [f_val]= Trapez(a, b, f, n)
h = (b - a) / n;
term_A = (h / 2) * (f(a) + f(b));

sum = 0;
for i = 1:n-1
    sum = sum + f(a + (i * h));
end
term_B = h * sum;

f_val = term_A + term_B;
end

function [err] = Eroro(former, later)
    err = abs(former - later);
end