%--------------------
%----- ITERATOR -----
%--------------------
% An Iterator for Trapez.m and Simpsn.m codes.
%--------------------

i = 1;
for n = 1000:1000:10000
    %conv(i) = Trapez(0,pi/2,f,n);
    conv(i) = Simpsn(0,1,f,n);
    i = i + 1;
end

%--------------------
%--------------------

er(1) = 0;
for j = 2:10;
   er(j) = Eroro(conv(j),conv(j - 1)); 
end

%--------------------
%--------------------

for k = 1:10
    fprintf('----------------------------------\n')
    fprintf('n = %d\n', 1000 * k);
    fprintf('The integral is : %f\n', conv(k));

    if k > 1
        fprintf('The error : %f\n', er(k));
    end
end   