function [fighandle, s] = mandelbrot(xsteps, ysteps, varargin)
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
  s = arrayfun(@(x, y) average_orbit_step(0+0i, x + y*i), xs, ys);
  colormap('hot');
  imagesc(s < 1);
  colorbar;
  xlabel('a')
  ylabel('b')
  title('Divergence score on Mandelbrot map')
end
