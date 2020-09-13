% This script includes symbolic analysis of the higher iterates of the logistic map.
clear; 
clf;
clc;

syms x % NOTE: we are working with symbolic functions 

a = 4; % the parameter of the logistic map
n_of_iterates = 6; % number of iterates of f to display


f = @(x) a*x*(1-x); % the logistic map with parameter a

xa = linspace(0,1,500);
plot(xa,xa) % plot an identity line
hold on

% note: we are working
% to substitute values of x for function f we must set x to a value and than perform the substitution using the function 'subs'
x = xa;
plot(xa, subs(f))

syms x
g = f(x);
for ii = 2:6;

	disp('[================================================]')
	disp(['iterate (n):' num2str(ii)])
	syms x % Clear previous values of x-- this has to be done every time we conduct a substitution operation

	g = f(g);
	x = xa;
	plot(xa, subs(g))
	axis([0 1 0 1])

	syms x % 
	disp('determining fixed point locations by solving')
	disp('the polynomial x^* = f^n(x^*)')

	% obtain coefficients for fixed point polynomial for root finding below;
	% note: fliplr is necessary because 'coeffs' returns polynomial from lowest to highest order, 
	% but 'roots' take the coefficients in reverse order.  ¯\_(ツ)_/¯.
	c = fliplr(coeffs(expand(g-x))); 

	disp('x coordinate of fixed points are the roots of the polynomial:')
	r = roots(c);
	disp(['number of roots:' num2str(length(c)) ])
	
	warning off % to avoid being reminded that some roots may have imaginary components
	x = r;
	plot(r, subs(g),'go') 
	d = diff(g);
	for fp = r'
		x = fp;

		% plot the color of the fixed point as a function of it's stability
		if abs(eval(subs(d))) > 1
			plot(fp, subs(g),'ro')
		elseif abs(subs(d)) <1
			plot(fp, subs(g),'go')
		else
			plot(fp, subs(g),'bo')
		end
	end
	warning on 
	
	disp('press a key to move on')	
	pause
end




