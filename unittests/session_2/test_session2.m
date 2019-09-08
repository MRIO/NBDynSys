%% Main function to generate tests
function tests = run_tests()
tests = functiontests(localfunctions);
end

function test_if_fixed_point(test_case)
  a = 1.5;
  my_fixed_point = fixedpoints(a);
  generating_map =  @(x) a.*x.*(1-x);
  verifyEqual(test_case, my_fixed_point(2), generating_map(my_fixed_point(1)));
end

function test_if_no_transients(test_case)
  a = 1.5;
  my_fixed_point = fixedpoints(a);
  verifyEqual(test_case, abs(my_fixed_point(end - 1) - my_fixed_point(end)) < 0.001, true)
end
