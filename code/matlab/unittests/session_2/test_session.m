%% Main function to generate tests
function tests = run_tests()
tests = functiontests(localfunctions);
end

function test_if_fixed_point(test_case)
  a = 1.5;
  my_fixed_point = orbit_after_transients(a);
  generating_map =  @(x) a.*x.*(1-x);
  verifyEqual(test_case, my_fixed_point(2), generating_map(my_fixed_point(1)));;
end

function test_if_no_transients(test_case)
  a = 1.5;
  my_fixed_point = orbit_after_transients(a);
  verifyEqual(test_case, abs(my_fixed_point(end - 1) - my_fixed_point(end)) < 0.001, true);
end

function test_bifurcation_enough_elements(test_case)
  as = 0:0.05:1;
  fun_handle = bifurcationdiagram(as);
  set(fun_handle, 'visible', 'off'); % Assure it doesn't hang around after test
  out_axes = get(fun_handle, 'Children'); 
  out_axis = out_axes(1);
  lines = get(out_axis, 'Children');
  verifyEqual(test_case, numel(lines) > 100, true);
end
  
function test_bifurcation_left_domain(test_case)
  as = 0:0.05:1;
  fun_handle = bifurcationdiagram(as);
  set(fun_handle, 'visible', 'off'); % Assure it doesn't hang around after test
  out_axes = get(fun_handle, 'Children'); 
  out_axis = out_axes(1);
  lines = get(out_axis, 'Children');
  verifyEqual(test_case, get(lines(1), 'YData') < 0.01, true);
end

function test_bifurcation_middle_domain(test_case)
  as = 1:0.5:2;
  fun_handle = bifurcationdiagram(as);
  set(fun_handle, 'visible', 'off'); % Assure it doesn't hang around after test
  out_axes = get(fun_handle, 'Children'); 
  out_axis = out_axes(1);
  lines = get(out_axis, 'Children');
  verifyEqual(test_case, get(lines(2), 'YData') - 1/2 < 0.01, true);
end

function test_bifurcation_right_domain(test_case)
  as = 3:0.1:3.5;
  fun_handle = bifurcationdiagram(as);
  set(fun_handle, 'visible', 'off'); % Assure it doesn't hang around after test
  out_axes = get(fun_handle, 'Children'); 
  out_axis = out_axes(1);
  lines = get(out_axis, 'Children');
  verifyEqual(test_case, abs(get(lines(1), 'YData') - get(lines(2), 'YData')) > 1/10, true);
end

function test_lyapunov(test_case)
  as = 0:0.1:4;
  fun_handle = lyapunov(as);
  set(fun_handle, 'visible', 'off'); % Assure it doesn't hang around after test
  out_axes = get(fun_handle, 'Children');
  out_axis = out_axes(1);
  lines = get(out_axis, 'Children');
  ys = get(lines, 'YData');
  verifyEqual(test_case, abs(ys(39) - 0.4309) < 0.1, true)
end

function test_both_graphs(test_case)
  as = 0:0.1:4;
  fun_handle = bifurcationdiagram(as);
  as = 0:0.005:4;
  fun_handle = lyapunov(as, fun_handle);
  set(fun_handle, 'visible', 'off'); % Assure it doesn't hang around after test
  verifyEqual(test_case, numel(get(fun_handle, 'Children')), 2);
end

