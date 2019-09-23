%% Main function to generate tests
function tests = run_tests()
tests = functiontests(localfunctions);
end

function test_nd_orbit_1d(test_case)
  my_map = @(x)1.5.*x.*(1-x);
  x0 = 0.5;
  it = 3;
  orbit = nd_orbit(my_map, x0, it);
  verifyEqual(test_case, all(orbit - [0.5 0.3750 0.3516]' < 1e-2), logical(1));
end

function test_nd_orbit_2d(test_case)
  my_map = @(x)[1.5.*x(1).*(1-x(1)) 2.*x(2).*(1-x(1))];
  x0 = [0.5 0.5];
  it = 3;
  orbit = nd_orbit(my_map, x0, it);
  true_ans = [0.5 0.5; 0.3750 0.5; 0.3516 0.6250];
  verifyEqual(test_case, all(all(orbit - true_ans < 1e-2)), logical(1));
end

function test_nd_orbit_after_transients_correct_map(test_case)
  x0 = [0.5 0.5];
  a = [1.28 -0.3];
  output_orbit = nd_orbit_after_transients(x0, a);
  verifyEqual(test_case, all(output_orbit(end, :) - [0.51 -0.15] < 0.01), logical(1));
end

function test_nd_orbit_after_transients_removes_transients(test_case)
  x0 = [0.5 0.5];
  a = [1.28 -0.3];
  output_orbit = nd_orbit_after_transients(x0, a);
  verifyEqual(test_case, all(output_orbit(2, :) - output_orbit(1, :) < 0.01), logical(1));
end

function test_average_orbit_step_converging_point(test_case)
  x0 = [0 0];
  a = [1.28 -0.3];
  mu = average_orbit_step(x0, a);
  verifyEqual(test_case, abs(mu - 0.2178) < 0.01, logical(1));
end

function test_average_orbit_step_diverging_point(test_case)
  x0 = [5 5];
  a = [1.28 -0.3];
  mu = average_orbit_step(x0, a);
  verifyEqual(test_case, isnan(mu), logical(1));
end

function test_figure(test_case)
  [fig_handle, s_test] = average_orbit_step_on_grid(-1:1:1, -1:1:1);
  s_test
  set(fig_handle, 'visible', 'off'); % Assure it doesn't hang around after test
  s_test
  s_true = [0 1.0715 0; 0.9261 1.0642 1.0427; 1.0658 0 1.1761];
  is_correct_number_nans = sum(sum(isnan(s_test))) == 3;
  s_test(1, 1) = 0;
  s_test(1, 3) = 0;
  s_test(3, 2) = 0;
  verifyEqual(test_case, (all(all(abs(s_true - s_test) < 0.01))) && is_correct_number_nans, logical(1));
end
