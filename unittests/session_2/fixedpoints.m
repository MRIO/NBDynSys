function fixed_point_set = fixedpoints(a) 
  generating_map = @(x) a.*x.*(1-x);
  n_iter = 1000;
  x0 = rand();
  n_steps_until_stable = 90;
  my_orbit = orbit(generating_map, x0, n_iter);
  fixed_point_set = my_orbit(n_steps_until_stable:end);
end
  

