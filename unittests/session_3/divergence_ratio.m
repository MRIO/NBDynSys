function div = divergence_ratio(x0, a)
    my_orbit = nd_orbit_after_transients(x0, a);
    my_distance = my_orbit(2:end) - my_orbit(1:end-1);
    my_ds = cellfun(@norm, num2cell(my_distance));
    div = mean(my_ds);
end
