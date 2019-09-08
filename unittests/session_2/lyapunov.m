function l_coeff = lyapunov() 
  as = 3:0.001:4;
  my_fixedpoints = arrayfun(@fixedpoints, as, 'UniformOutput', false);
  l_coeff = zeros(numel(my_fixedpoints), 1);
  for i=1:numel(my_fixedpoints)
    converged_orbit = my_fixedpoints{i};
    l_coeff(i) = mean(log(abs(as(i) - 2*as(i)*converged_orbit)));
  end
  plot(as, l_coeff)
end
  

