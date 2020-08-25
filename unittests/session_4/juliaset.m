function [fighandle, s] = juliaset(xsteps, ysteps, c, varargin)
  % :param xsteps: Values for x contained in the grid
  % :param ysteps: Values for y contained in the grid
  % :param c: Parameter to be used for the quadratic map
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
  s = arrayfun(@(x, y) average_orbit_step(x + y*i, c), xs, ys);
  colormap('hot');
  imagesc(s < 1);
  colorbar;
  xlabel('a')
  ylabel('b')
  title('Divergence score on Julia map')
end
