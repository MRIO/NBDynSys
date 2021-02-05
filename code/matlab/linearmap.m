A = [i 0;-i 0];
X = [.2 .2]';

for t = 1:5;




function [U V] = linearmap(A,X)

x = [X Y]';

A = rand(2,2);

X = A*x;

U = X(1);
V = X(2);
