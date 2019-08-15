function orbit = cobweb(fct, i0, iterations)
% function orbit = cobweb(fct, i0, iterations)
% fct:			 an anonymous function on one variable (the map)
% i0:	 		 is the initial condition
% iterations:	 is the number of iterations to compute
% 
% (r) cobweb demo for matlab: mnegrello@gmail.com
% 
% logistic map:
% fct = @(x) a.*x.*(1-x), for different a values.
% 
% some other functions for the iterated maps
% fct = @(x) 2.*x.^2 -5 .* x;
% fct = @(x) (x.^3 -x)./2;
% fct = @(x) (x.^2/2);
% fct = @(x) (x.^2);
% fct = @(x) -x;

	% initial value condition
	orbit(1) = i0;

	% calculate the future
	for it = 2:iterations
		orbit(it) = fct(orbit(it-1));
	end

	% prepare plot
	figure(1000), 
	holdon = 0;
	if holdon 
	else
		clf
	end
	ax(1) = subplot(1,2,1);
		% plot the selected function
		sup = linspace(-10,10,5000);
		line(sup, fct(sup),'linewidth',3, 'color', 'r')
		line(sup, sup,'linewidth',1,'linestyle', '--','color', 'k')
		line(i0, 0, 'marker', 'o')
		line([i0 i0], [0 orbit(1)])
		line(i0, orbit(2))

		% axes
		line([0 0], [-10 10]  ,'linestyle', ':')
		line([-100 100], [0 0],'linestyle', ':')

		%labels
		xlabel('x')
		ylabel('f(x)')

		%limits
		xlim([-1.3 1.3])
		ylim([-1.3 1.3])

	ax(2) = subplot(1,2,2);
		xlim([1 iterations])
		xlabel('iterations (k)')
		ylabel('f^k(x)')


	


	% plot iterations
	cobwebline_iteration = @(x) line([x x], [x fct(x)]);
	cobwebline_identity = @(x) line([x fct(x) ], [fct(x) fct(x)]);

	

	
	for it = 1:iterations-1

		axes(ax(1))
		cobwebline_iteration(orbit(it))
		cobwebline_identity(orbit(it))
		text(-1.1,1.2-it*.1,[ num2str(it) ' - ' num2str(orbit(it)) ' , ' num2str(orbit(it+1))])
		% xlim([-max(orbit(1:it)) max(orbit(1:it))])
		% ylim([-max(orbit(1:it)) max(orbit(1:it))])

		axes(ax(2))
		line([it it+1], [orbit(it) orbit(it+1)])
		
		drawnow
		pause(.2)

	
	end


		