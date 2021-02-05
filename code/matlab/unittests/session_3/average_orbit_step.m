function mu = average_orbit_step(x0, a)
  % * Function 3/4
  % :param x0: Initial value in |R^2
  % :param a: Vector containing Henon map parameters [a b]
  % :returns: Mean orbit step as defined in the document
 
  my_orbit = nd_orbit_after_transients(x0, a);
  my_distance = my_orbit(2:end, :) - my_orbit(1:end-1, :);
  my_ds = cellfun(@norm, num2cell(my_distance, 2));
  mu = mean(my_ds);
end
