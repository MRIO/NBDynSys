function [] = bifurcationdiagram() 
  as = 0:0.01:4;
  my_fixedpoints = arrayfun(@fixedpoints, as, 'UniformOutput', false);
  for i=1:numel(my_fixedpoints)
    i
    for j=1:numel(my_fixedpoints{i})
      hold on
      scatter(as(i), my_fixedpoints{i}(j), 1, 'k');
      if j > 5
        break
    end
  end
end
  

