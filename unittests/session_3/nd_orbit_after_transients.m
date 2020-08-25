function output_orbit = nd_orbit_after_transients(x0, a) 
  % *Function 2/4
  % :param x0: Initial value of the map defined in this function
  % :param a: Parameter of the Henon map, being [a b] in the stanard expression
  % :returns: An array containing the orbit of the Henon map without transients

  generating_map = @(x) [1 - a(1)*x(1)^2 + x(2); a(2)*x(1)];
  n_iter = 100;
  n_steps_until_stable = 10;
  my_orbit = nd_orbit(generating_map, x0, n_iter);
  output_orbit = my_orbit(n_steps_until_stable:end, :);
end
  

