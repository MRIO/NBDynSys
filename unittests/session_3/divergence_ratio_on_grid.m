function [] = divergence_ratio_on_grid()
    [xs, ys] = meshgrid(-2.5:0.01:2.5, -2.5:0.01:2.5);
    divs = arrayfun(@(x, y) divergence_ratio([x, y], [1.28 -0.3]), xs, ys);
    colormap('hot');
    imagesc(divs);
    colorbar;
    xlabel('a')
    ylabel('b')
    title('Divergence score on Henon map')
end
