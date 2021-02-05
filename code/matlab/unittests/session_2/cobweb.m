function fighandle = cobweb(fct, i0, iterations, varargin)	
  % Prepare fighandle by handling varargin
  if not(isempty(varargin))
    if ishandle(varargin{1})
      fighandle = varargin{1};
    end
  else
    fighandle = figure;
  end

  computed_orbit = orbit(fct, i0, iterations);
 
  ax(1) = subplot(1,2,1);
  	% plot the selected function
  	sup = linspace(-10,10,5000);
  	line(sup, fct(sup),'linewidth',3, 'color', 'r');
  	line(sup, sup,'linewidth',1,'linestyle', '--','color', 'k');
  	line(i0, 0, 'marker', 'o');
  	line([i0 i0], [0 computed_orbit(1)]);
  	line(i0, computed_orbit(2));
 
  	% axes
  	line([0 0], [-10 10]  ,'linestyle', ':');
  	line([-100 100], [0 0],'linestyle', ':');
 
  	%labels
  	xlabel('x');
  	ylabel('f(x)');
 
  	%limits
  	xlim([-1.3 1.3]);
  	ylim([-1.3 1.3]);
 
  ax(2) = subplot(1,2,2);
  	xlim([1 iterations]);
  	xlabel('iterations (k)');
  	ylabel('f^k(x)');
 
 
  
 
 
  % plot iterations
  cobwebline_iteration = @(x) line([x x], [x fct(x)]);
  cobwebline_identity = @(x) line([x fct(x) ], [fct(x) fct(x)]);
 
  
 
  
  for it = 1:iterations-1
 
  	axes(ax(1))
  	cobwebline_iteration(computed_orbit(it));
  	cobwebline_identity(computed_orbit(it));
  	text(-1.1,1.2-it*.1,[ num2str(it) ' - ' num2str(computed_orbit(it)) ' , ' num2str(computed_orbit(it+1))]);
  	% xlim([-max(computed_orbit(1:it)) max(computed_orbit(1:it))])
  	% ylim([-max(computed_orbit(1:it)) max(computed_orbit(1:it))])
 
  	axes(ax(2));
  	line([it it+1], [computed_orbit(it) computed_orbit(it+1)]);
  	
  	%drawnow
  	%pause(.2)
 
  
  end
end
