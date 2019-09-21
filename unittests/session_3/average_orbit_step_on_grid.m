function [fighandle, s] = average_orbit_step_on_grid(xsteps, ysteps, varargin)
  % * Figure 4/4
  % :param xsteps: Values for x contained in the grid
  % :param ysteps: Values for y contained in the grid
  % :param varargin: Variable argument to handle figure handle
  % :returns: [The matrix containing grid-applied mean step distances, figure handle]

  if not(isempty(varargin))
    if ishandle(varargin{1})
      fighandle = varargin{1};
    end
  else
    fighandle = figure;
  end

  
  [xs, ys] = meshgrid(xsteps, ysteps);
  ys = ys*1i;
  s = arrayfun(@(x, y) average_orbit_step([x y], [0.3]), xs, ys);
  colormap('hot');
  imagesc(s);
  colorbar;
  xlabel('a')
  ylabel('b')
  title('Divergence score on Mandelbrot map')
end
