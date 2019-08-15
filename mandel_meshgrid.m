
function Z = mandel_meshgrid(xran, yran)

n_iter = 100;
res = 50;

x =  linspace (xran(1),xran(2),res);
y =  linspace (yran(1),yran(2),res);

[xx yy] = meshgrid(x,y);

Z0 = zeros(res);

C = xx +yy*i;

z = @(z,c) z.^2 + c;

Z(:,:,1) = arrayfun(z, Z0, C);

for t = 2:n_iter
	Z(:,:,t) = arrayfun(z, Z(:,:,t-1) , C );
	disp(num2str(t))
end


imagesc(abs(Z(:,:,n_iter)))
