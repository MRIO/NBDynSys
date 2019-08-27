%% Main function to generate tests
function tests = run_tests()
tests = functiontests(localfunctions);
end

function test_orbit_initial_set(test_case)
  test_func = @(x) -1/2*x;
  test_init = 1;
  test_itr = 1;
  test_output = orbit(test_func, test_init, test_itr);
  verifyEqual(test_case, test_output(1), 1);
end

function test_orbit_length(test_case)
  test_func = @(x) -1/2*x;
  test_init = 1;
  test_itr = 10;
  test_output = orbit(test_func, test_init, test_itr);
  verifyEqual(test_case, numel(test_output), test_itr);
end

function test_orbit_entirely(test_case)
  test_func = @(x) x+1;
  test_init = 1;
  test_itr = 10;
  test_output = orbit(test_func, test_init, test_itr);
  verifyEqual(test_case, all(test_output == (1:10)'), logical(1));
end

% OI
function test_cobweb_plot_identity_line(test_case)
  test_func = @(x) 0.4.*x.*(1-x);
  test_start = 0.4;
  test_itr = 10;
  fun_handle = cobweb(test_func, test_start, test_itr);
  out_axes = get(fun_handle, 'Children');
  out_axis = out_axes(2);
  lines = get(out_axis, 'Children');
  is_correct = zeros(numel(lines), 1);
  for i=1:numel(is_correct)
    my_object = lines(i);
    if strcmp(my_object.Type, 'line')
      x_data_id = get(lines(i), 'XData');
      y_data_id = get(lines(i), 'YData');
      is_correct(i) = all(x_data_id == y_data_id);
    else
      is_correct(i) = 0;
    end
  end
  verifyEqual(test_case, any(is_correct), logical(1));
end

% OI
function test_cobweb_plot_x_vs_fx(test_case)
  test_func = @(x) 0.4.*x.*(1-x);
  test_start = 0.4;
  test_itr = 10;
  fun_handle = cobweb(test_func, test_start, test_itr);
  out_axes = get(fun_handle, 'Children');
  out_axis = out_axes(2);
  lines = get(out_axis, 'Children');
  is_correct = zeros(numel(lines), 1);
  for i=1:numel(is_correct)
    my_object = lines(i);
    if strcmp(my_object.Type, 'line')
      x_data_fn = get(lines(i), 'XData');
      y_data_fn = get(lines(i), 'YData');
      is_correct(i) = all(test_func(x_data_fn) == y_data_fn);
    else
      is_correct(i) = 0;
    end
  end
  verifyEqual(test_case, any(is_correct), logical(1));
end

% OI
function test_cobweb_plot_k_vs_fx(test_case)
  test_func = @(x) 0.4.*x.*(1-x);
  test_start = 0.4;
  test_itr = 10;
  fun_handle = cobweb(test_func, test_start, test_itr);
  out_axes = get(fun_handle, 'Children');
  out_axis = out_axes(1);
  lines = get(out_axis, 'Children');
  x_data = get(lines(1), 'XData');
  y_data = get(lines(1), 'YData');
  is_x_right = x_data == [9, 10];
  is_y_right = all(abs(y_data - [1.34e-04 5.369e-05]) < 0.01);
  verifyEqual(test_case, all([is_x_right is_y_right]), logical(1));
end


