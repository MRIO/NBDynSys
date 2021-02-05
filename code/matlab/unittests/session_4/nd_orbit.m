function orbit = nd_orbit(fnct, x0, it) 
  % * Function 1/4
  % NOTE in this function, please assure it works for x0 being both a scalar and an arbitrary-length vector
  % :param fnct: Mapping function mapping x0 to x1 taking a SINGLE parameter (can be multi-dimensional)
  % :param x0: Initial value
  % :param it: Number of iterations
  % :returns: The entire orbit, including the initial value
  orbit = zeros(it, numel(x0));

  % Set initial value
  orbit(1, :) = x0;

  % Main loop
  for it = 2:it
    orbit(it, :) = fnct(orbit(it-1, :));
  end
  orbit;
end
  

