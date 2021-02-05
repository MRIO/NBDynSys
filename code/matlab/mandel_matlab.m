function M= mandel

if nargin ==0
s = 1200; % The width and height of the resulting image
xmin=-1.5;
xmax=1.5;
ymin=-1.5;
ymax=1.5;
end


xrange = linspace(xmin, xmax, s);
yrange = linspace(ymin, ymax, s);

maxcount = 100;


% cmap determines the colouring of the resulting image
cmap = jet(maxcount*2);
cmap(end, :) = 0;

clear i; % Make sure that i refers to the imaginary number sqrt(-1)
rm = 1/maxcount;

% Generate the Mandelbrot fractal
frame = 1;
% for e1 = linspace(2,8,120)
for e1 = 2
im = zeros(s);

	for v = 1:s
	  for u = 1:s
	    c = xrange(u) + yrange(v)*i;
	    z = 0;
	    count = 0;
	    while (count < maxcount) & (abs(z) < 2)
	      z = z^e1+c;
	      count=count+1;
	    end
	    im(v, u) = count*(1+rm); % measure of the escape velocity
	  end
	end
	imagesc(im);
	M(frame) = getframe;
	frame = frame+1;

end


% Plot the image
% colormap(cmap);
imagesc(im);
xlim = linspace(xmin,xmax,length(get(gca, 'xticklabel')));
ylim = linspace(xmin,xmax,length(get(gca, 'xticklabel')));
xlim = xlim(1:end);
ylim = ylim(1:end);
set(gca,'xticklabel', xlim)
set(gca,'yticklabel', ylim)











