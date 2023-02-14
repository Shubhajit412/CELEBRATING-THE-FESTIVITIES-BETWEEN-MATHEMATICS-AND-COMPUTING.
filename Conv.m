%---------------------------------------
%------- ORDER OF CONVERGENCE ----------
%---------------------------------------

% A code to verify the order of convergence of an iterative sequence (case specific).
% Program : To get the order of convergence of the given recursive sequence.
% Sequence : x_n+1 = (x_n( x_n^2 + 3a))/(3x_n^2 + a).
% Convegence : sqrt(a).
% Pre-requisite program : NIL 
%---------------------------------
% To use this function just run the program.
%---------------------------------

function [P, y] = Conv()

n_max = 20;
x_0 = 0.1;
a = 4;

    function x_n1 = seq(x_n)
        x_n1 = x_n * (x_n^2 + 3 * a) / (3 * x_n^2 + a);
    end

P = zeros(length(n_max));
P(1) = x_0;

for i = 2:n_max
    P(i) = seq(P(i-1));
end

y=[];
y=[y,1 / abs(3 * P(1)^2 + a)];

for i = 2:n_max-1
    y = [y,1 / abs(3 * P(i)^2 + a)];
    err = abs(y(i) - y(i - 1));
    abs_err = err / (eps + abs(y(i)));
end
y = y';
end