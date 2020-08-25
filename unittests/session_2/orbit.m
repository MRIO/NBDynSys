function orbit = orbit(fnct, x0, it) 
  orbit = zeros(it, 1);

  % Set initial value
  orbit(1) = x0;

  % Main loop
  for it = 2:it
    orbit(it) = fnct(orbit(it-1));
  end
  orbit;
end
  

