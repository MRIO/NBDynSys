function [] = bifurcationdiagram() 
  as = 0:0.05:5;
  my_fixedpoints = arrayfun(@fixedpoints, as, 'UniformOutput', false);
  for i=1:numel(my_fixedpoints)
    i
    for j=1:numel(my_fixedpoints{i})
      hold on
      scatter(as(i), my_fixedpoints{i}(j), 1, 'k');
    end
  end
end
  

