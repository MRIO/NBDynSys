%% Main function to generate tests
function tests = run_tests()
tests = functiontests(localfunctions);
end

function test_quadratic_map_converged(test_case)
  x0 = 0.1;
  a = 0.2;
  output_orbit = nd_orbit_after_transients(x0, a);
  verifyEqual(test_case, abs(output_orbit(1) - output_orbit(end)) < 0.01, true);
end

function test_quadratic_map_reals(test_case)
  x0 = 0.1;
  a = 0.2;
  output_orbit = nd_orbit_after_transients(x0, a);
  verifyEqual(test_case, abs(output_orbit(end) - 0.2764) < 0.01, true);
end

function test_quadratic_map_pure_imaginary(test_case)
  x0 = 0.1j;
  a = 0.2j;
  output_orbit = nd_orbit_after_transients(x0, a);
  verifyEqual(test_case, abs(output_orbit(end) - (-0.0339 + 0.1873j)) < 0.01, true);
end

function test_quadratic_map_complex(test_case)
  x0 = 0.1+0.1j;
  a = 0.1+0.2j;
  output_orbit = nd_orbit_after_transients(x0, a);
  verifyEqual(test_case, abs(output_orbit(end) - (0.0528 + 0.2236j)) < 0.01, true);
end

function test_julia_image_plot(test_case)
  [figh, s] = juliaset(-1:0.1:1, -1:0.1:1, -0.4+0.6j);
  set(figh, 'visible', 'off');
  q = get(figh, 'Children');
  verifyEqual(test_case, get(q(2), 'YScale'), 'linear');
end

function test_julia_set_sum(test_case)
  [figh, s] = juliaset(-1:0.1:1, -1:0.1:1, -0.4+0.6j);
  set(figh, 'visible', 'off');
  verifyEqual(test_case, sum(sum(s < 1)), 38);
end

function test_julia_set(test_case)
  [figh, s] = juliaset(-1:0.5:1, -2:0.5:2, -0.4+0.6j);
  set(figh, 'visible', 'off');
  s_true = [false false false false false true  false false false;
            false false false false false true  false false false;
            false false false false false false false false false;
            false false false true  false false false false false; 
            false false false true  false false false false false]';
  verifyEqual(test_case, all(all((s < 1) == s_true)), true);
end

function test_mandelbrot_set_sum(test_case)
  [figh, s] = mandelbrot(-1:0.1:1, -1:0.1:1, 0+0j);
  set(figh, 'visible', 'off');
  verifyEqual(test_case, sum(sum(s < 1)), 140);
end

function test_mandelbrot_set(test_case)
  [figh, s] = mandelbrot(-1:0.5:1, -2:0.5:2, 0+0j);
  set(figh, 'visible', 'off');
  s_true = [false false false false true  false false false false;
            false false false true  true  true  false false false;
            false false true  true  true  true  true  false false; 
            false false false false false false false false false; 
            false false false false false false false false false]';
  verifyEqual(test_case, all(all((s < 10) == s_true)), true);
end


