function fighandle = bifurcationdiagram(as, varargin)	
  % :param as: Array of range of parameters
  % :param vararg: Variable argument to handle figure handle
  % :returns: Figure handle containing the figure of a bifurcation diagram of the logistic map

  if not(isempty(varargin))
    if ishandle(varargin{1})
      fighandle = varargin{1};
    end
  else
    fighandle = figure;
  end

  ax = subplot(2, 1, 1);
  my_fixedpoints = arrayfun(@fixedpoints, as, 'UniformOutput', false);
  for i=1:numel(my_fixedpoints)
    for j=1:numel(my_fixedpoints{i})
      hold on
      scatter(as(i), my_fixedpoints{i}(j), 1, 'k');
      if j > 5
        break
    end
  end
  hold off
end
  

