function fighandle = lyapunov(as, varargin) 
  % :param as: Array of range of parameters
  % :param varargin: Variable argument to handle figure handle
  % :returns: Figure handle containing the figure of a plot of the Lyapunov exponent vs the parameter of the logistic map

  if not(isempty(varargin))
    if ishandle(varargin{1})
      fighandle = varargin{1};
    end
  else
    fighandle = figure;
  end


  my_orbit = arrayfun(@orbit_after_transients, as, 'UniformOutput', false);
  l_coeff = zeros(numel(my_orbit), 1);
  for i=1:numel(my_orbit)
    converged_orbit = my_orbit{i};
    l_coeff(i) = mean(log(abs(as(i) - 2*as(i)*converged_orbit)));
  end
  ax = subplot(2, 1, 2);
  plot(as, l_coeff)
end
  

