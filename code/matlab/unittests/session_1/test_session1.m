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

function test_cobweb_plot_identity_line(test_case)
  test_func = @(x) 0.4.*x.*(1-x);
  test_start = 0.4;
  test_itr = 10;
  fun_handle = cobweb(test_func, test_start, test_itr);
  set(fun_handle, 'visible', 'off'); % Assure it doesn't hang around after test
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

function test_cobweb_plot_x_vs_fx(test_case)
  test_func = @(x) 0.4.*x.*(1-x);
  test_start = 0.4;
  test_itr = 10;
  fun_handle = cobweb(test_func, test_start, test_itr);
  set(fun_handle, 'visible', 'off'); % Assure it doesn't hang around after test
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

function test_cobweb_plot_horizontal_lines(test_case)
  test_func = @(x) 0.4.*x.*(1-x);
  test_start = 0.4;
  test_itr = 10;
  fun_handle = cobweb(test_func, test_start, test_itr);
  set(fun_handle, 'visible', 'off'); % Assure it doesn't hang around after test
  out_axes = get(fun_handle, 'Children');
  out_axis = out_axes(2);
  lines = get(out_axis, 'Children');
  is_correct = zeros(numel(lines), 1);
  for i=1:numel(is_correct)
    my_object = lines(i);
    if strcmp(my_object.Type, 'line')
      x_data = get(lines(i), 'XData');
      y_data = get(lines(i), 'YData');
      x_condition = all(sum(x_data' - [0.0021 0.0021]) < 0.001); % Are both ends of the h-line correct in dimension 1?
      y_condition = all(sum(y_data' - [0.0021 8.4007e-04]) < 0.001);
      if(x_condition && y_condition)
        is_correct(i) = 1;
      else
        is_correct = 0;
      end
    else
      is_correct(i) = 0;
    end
  end
  verifyEqual(test_case, any(is_correct), logical(1));
end

function test_cobweb_plot_vertical_lines(test_case)
  test_func = @(x) 0.4.*x.*(1-x);
  test_start = 0.4;
  test_itr = 10;
  fun_handle = cobweb(test_func, test_start, test_itr);
  set(fun_handle, 'visible', 'off'); % Assure it doesn't hang around after test
  out_axes = get(fun_handle, 'Children');
  out_axis = out_axes(2);
  lines = get(out_axis, 'Children');
  is_correct = zeros(numel(lines), 1);
  for i=1:numel(is_correct)
    my_object = lines(i);
    if strcmp(my_object.Type, 'line')
      x_data = get(lines(i), 'XData');
      y_data = get(lines(i), 'YData');
      x_condition = all(sum(x_data' - [8.4007e-04 8.4007e-04]) < 0.001); % Are both ends of the h-line correct in dimension 1?
      y_condition = all(sum(y_data' - [8.4007e-04 3.3575e-04]) < 0.001);
      if(x_condition && y_condition)
        is_correct(i) = 1;
      else
        is_correct = 0;
      end
    else
      is_correct(i) = 0;
    end
  end
  verifyEqual(test_case, any(is_correct), logical(1));
end

function test_cobweb_plot_k_vs_fx(test_case)
  test_func = @(x) 0.4.*x.*(1-x);
  test_start = 0.4;
  test_itr = 10;
  fun_handle = cobweb(test_func, test_start, test_itr);
  set(fun_handle, 'visible', 'off'); % Assure it doesn't hang around after test
  out_axes = get(fun_handle, 'Children');
  out_axis = out_axes(1);
  lines = get(out_axis, 'Children');
  x_data = get(lines(1), 'XData');
  y_data = get(lines(1), 'YData');
  is_x_right = x_data == [9, 10];
  is_y_right = all(abs(y_data - [1.34e-04 5.369e-05]) < 0.01);
  verifyEqual(test_case, all([is_x_right is_y_right]), logical(1));
end

function test_cobweb_non_destructive(test_case)
  first_func = @(x) 0.4.*x.*(1-x);
  first_start = 0.4;
  first_itr = 10;
  fun_handle = cobweb(first_func, first_start, first_itr);
  set(fun_handle, 'visible', 'off'); % Assure it doesn't hang around after test

  out_axes = get(fun_handle, 'Children');
  out_axis = out_axes(1);
  lines = get(out_axis, 'Children');
  n_first = numel(lines);

  second_func = @(x) 0.5.*x.*(1-x);
  second_start = -0.4;
  second_itr = 10;
  fun_handle = cobweb(second_func, second_start, second_itr, fun_handle);
  set(fun_handle, 'visible', 'off'); % Assure it doesn't hang around after test

  out_axes = get(fun_handle, 'Children');
  out_axis = out_axes(1);
  lines = get(out_axis, 'Children');
  n_second = numel(lines);

  verifyEqual(test_case, 2*n_first, n_second);
end

