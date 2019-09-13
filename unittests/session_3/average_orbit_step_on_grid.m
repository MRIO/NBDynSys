function fhandle = average_orbit_step_on_grid(xsteps, ysteps)
  % * Figure 4/4
  % :param xsteps: Values for x contained in the grid
  % :param ysteps: Values for y contained in the grid
  % :returns: A figure handle for a plot of the stability of the Henon map
  
  [xs, ys] = meshgrid(-2.5:0.01:2.5, -2.5:0.01:2.5);
  divs = arrayfun(@(x, y) divergence_ratio([x, y], [1.28 -0.3]), xs, ys);
  colormap('hot');
  imagesc(divs);
  colorbar;
  xlabel('a')
  ylabel('b')
  title('Divergence score on Henon map')
end
