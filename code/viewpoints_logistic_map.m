% [=================================================================]
%  demo for viewpoints of logistic map
% [=================================================================]
% date: 09/2017
% author: Mario Negrello - m@negrello.org
% 

% [=================================================================]
%  % script parameters
% [=================================================================]
iter = 100;
trans = 40;
res = 401;
paramspace = linspace(0,4,res);
x_range = linspace(0,1,100);
graylevel = .75;
savevideo = 1;
if savevideo; v = VideoWriter('logmap'); set(v,'Quality',95,'FrameRate',5); open(v); end


% [=================================================================]
%  prep fig and axis
% [=================================================================]

figure('color', [1 1 1], 'position', [1           5        1440         800		])
% first two iterates
ax(1) = axes('position', [0.0360    0.6675    0.2189    0.2861]); 
% slope
ax(2) = axes('position', [0.0360    0.5062    0.2244    0.1200]);
sl1= line;
sl2= line;
p = patch([x_range(1) x_range(1) x_range(end) x_range(end)], [-1 1 1 -1], [.7 1 .7],'edgecolor','none')
% time series
ax(3) = axes('position', [0.7375    0.0887    0.2211    0.8387]);
% bifurcation diagram
ax(4) = axes('position', [0.2979    0.0912    0.4229    0.8513]); hairline = line; 
% cobweb
ax(5) =axes('position', [0.0360    0.0887    0.2300    0.3628])

%make a red gradient colormap
nocol = 5;
hcmap = [linspace(0,1,nocol)' zeros(nocol,1) zeros(nocol,1) ];



% [=================================================================]
%  main loop
% [=================================================================]
i = 1;
for a = paramspace

	% [=================================================================]
	%  inline definitions
	% [=================================================================]
	fct  = @(x) a .* x .* (1 - x);
	fct2 = @(x) fct(fct(x));
	fct3 = @(x) fct(fct(fct(x)));
	fct4 = @(x) fct(fct(fct(fct(x))));

	cobwebline_iteration_gray = @(x) line([x x], [x fct(x)],'color',ones(1,3)*graylevel);
	cobwebline_identity_gray = @(x) line([x fct(x) ], [fct(x) fct(x)],'color', ones(1,3)*graylevel);

	cobwebline_iteration = @(x) line([x x], [x fct(x)],'color','k');
	cobwebline_identity = @(x) line([x fct(x) ], [fct(x) fct(x)],'color', 'k');



	% [=================================================================]
	%  % first two iterates and intersects
	% [=================================================================]
	axes(ax(1))
	cla
	line(x_range, fct(x_range),'color',  hcmap(4,:),'linewidth',3)
	line(x_range, fct2(x_range),'color', hcmap(5,:),'linewidth',3)
	% line(x_range, fct3(x_range),'color', hcmap(5,:),'linewidth',3)
	% line(x_range, fct4(x_range),'color', hcmap(5,:),'linewidth',3)
	line(x_range, x_range,'color',hcmap(1,:),'color','g')
	line((a-1)/a, fct((a-1)/a),'marker','x','color', 'b', 'markersize',15)
	axis([0 1 0 1])

	title({['function and two first iterates for'] ;[ 'a = ' num2str(a)]})

	% [=================================================================]
	%  % slopes 
	% [=================================================================]
	axes(ax(2))
	da = (paramspace(end)-paramspace(1))/res;
	set(sl1,'xdata', x_range(1:end-1)+da/2, 'ydata', diff(fct(x_range))/da,'color',  hcmap(4,:),'linewidth',3)
	set(sl2,'xdata', x_range(1:end-1)+da/2, 'ydata', diff(fct2(x_range))/da,'color', hcmap(5,:),'linewidth',3)
	
	alpha(.3)
	title('slope of mapping functions')


	axis([0 1 -4 4])
	grid on

	orbit(1) = rand;

	if a>=4.2
		orbit(1) = (a-1)/a - .1;
	else
		orbit(1) = .1;
	end

	for it = 2:iter
		orbit(it) = fct(orbit(it-1));
	end

	% [=================================================================]
	%  time series
	% [=================================================================]
	axes(ax(3))
	cla
	line(1:trans, orbit(1:trans),'color',ones(1,3)*graylevel,'marker', 'o')
	line(trans+1:iter, orbit(trans+1:iter),'color','k','marker', 'o')
	title('time series')
	xlabel('iterations (n)')
	axis([1 iter 0 1])



	% [=================================================================]
	%  	% bifucation diagram
	% [=================================================================]
	axes(ax(4))
	axis([paramspace(1) paramspace(end) 0 1])
	
	line(a * ones(1,trans), orbit(1:trans),'linestyle','none', 'marker', '.','color', ones(1,3)*graylevel,'markersize',.2)
	line(a * ones(1,iter-trans+1), orbit(trans:end),'linestyle','none', 'marker', '.','color', 'k','markersize',.2)
	title('bifurcation diagram (hairline @ a)')
	xlabel('a')
	ylabel('f(x)')

	% update the hairline x position
	set(hairline,'xdata', [a a], 'ydata', [0 1],'color', 'g') 


	% [=================================================================]
	%  % cobweb plot
	% [=================================================================]
	axes(ax(5))
	cla
	line(x_range, fct(x_range),'color',  hcmap(2,:),'linewidth',3)
	line(x_range, fct2(x_range),'color', hcmap(3,:),'linewidth',3)
	% line(x_range, fct3(x_range),'color', hcmap(4,:),'linewidth',3)
	% line(x_range, fct4(x_range),'color', hcmap(5,:),'linewidth',3)
	line(x_range, x_range,'color',hcmap(1,:),'color','g')
	line(orbit(1), 0, 'marker', 'o','color', 'r')
	line([orbit(1) orbit(1)], [0 orbit(2)], 'color', 'k')

	arrayfun(cobwebline_iteration_gray, orbit(1:trans))
	arrayfun(cobwebline_identity_gray, orbit(1:trans))

	arrayfun(cobwebline_iteration, orbit(trans+1:iter))
	arrayfun(cobwebline_identity, orbit(trans+1:iter))
	ylabel('F^{n+1}(x)')
	xlabel('F^{n}(x)')
	title({'cobweb plot / first return map'})
	

	
	if savevideo
		m = getframe(gcf);
		writeVideo(v,m);

		i = i+1;
	else
		drawnow
	end

end

if savevideo
	close(v)
end

if 1
		figure
		% The structure of the logistic map

		f = @(a,x) a.*x.*(1-x); % the logistic map

		fprime = @(a,x) a.*(1-x) - a.*x; % it’s derivative

		xbar = @(a) (a - 1)./ a; % the fixed point as a function of a

		id = @(a,x) x; % the identity plane (note it is independent of a, but we take it in anyways)

		% the grid range of the function (to pass to arrayfun)

		[aa xx] = meshgrid([0:.01:4], [0:.01:1]);
		asup = [0:.1:4];

		mesh(aa,xx,arrayfun(f, aa,xx))

		hold on

		mesh(aa,xx,arrayfun(id, aa,xx), 'edgecolor', 'g')

		scatter3(asup, xbar(asup), xbar(asup),100, fprime(asup, xbar(asup)),'filled')

		set(gca,'clim', [-2 2])

		axis([0 4 0 1 0 1])
		`z§



end