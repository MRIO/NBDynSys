function kuramotoSheet(varargin)
% inputs:
% 	networksize, [N M]
% 	scaling for coupling - K
% 
% parameter value pairs
% 
% 
% ('radius', 4)
% ('dt', 1e-3) 	
% ('simtime',1) % in seconds
% ('omega_mean', 10) 
% ('plotme', 1) 
% ('noise', 0) 
% ('connectivity', []) 
% connectivity  = 'inverse dist';
% connectivity  = 'euclidean';
% connectivity = 'inverse dist';
% connectivity = 'chebychev';
 % 
 % kuramotoSheet([50 50],105)
 % 
 % author: m@negrello.org
 % all rights to kuramoto and mathworks, all wrongs are mine ;D


% [=================================================================]
%  parse inputs
% [=================================================================]

	p = inputParser;
	p.addRequired('networksize')  
	p.addRequired('scaling')  

	p.addParamValue('radius', 16)
	p.addParamValue('dt', 1e-2) 	
	p.addParamValue('simtime',1) % in seconds
	p.addParamValue('omega_mean', 10) % in Hz 
	p.addParamValue('plotme', 1) 
	p.addParamValue('noise', 0) 
	p.addParamValue('connectivity', 'all to all')  % adjacency matrix

	p.parse(varargin{:});

	netsize = p.Results.networksize;
	scaling = p.Results.scaling;
	radius  = p.Results.radius;
	connectivity = p.Results.connectivity;
	dt = p.Results.dt;
	simtime = p.Results.simtime;
	omega_mean = p.Results.omega_mean;
	plotme = p.Results.plotme;
	noise = p.Results.noise;
	
	N = netsize(1);
	M = netsize(2);

% [=================================================================]
%  randomize oscillator intrinsic frequencies
% [=================================================================]

omega_std = 1;
omega_i = (randn(N*M,1)*omega_std+omega_mean)*2*pi; 

% [=================================================================]
%  connectivity
% [=================================================================]



 


switch connectivity
	case 'all to all'
		connectivity = ones(N*M) - eye(N*M);

	case 'chebychev'
        
        [X Y] = meshgrid([1:N],[1:M]);
        X = X(:); Y = Y(:); 

        % # compute adjacency matrix
		connectivity = squareform( pdist([X Y], 'chebychev') <= radius );

	case 'euclidean'

		[X Y] = meshgrid([1:N],[1:M]);
        X = X(:); Y = Y(:); 

        % # compute adjacency matrix
		connectivity = squareform( pdist([X Y], 'euclidean') <= radius );


	case 'inverse dist'
		depth   = [1:N];
        breadth = [1:M];
        
        [X Y] = meshgrid(depth,breadth);
        X = X(:); Y = Y(:); 

        % # compute adjacency matrix
		connectivity = 1./squareform( pdist([X Y], 'euclidean') );



	case 'random'
		% W = (ones(N*M)-eye(N*M) ) .* rand(N*M);
	
	otherwise 
		% we use the matrix passed as a parameter
		connectivity = connectivity

end

% ensure that there are no self connections
connectivity(find(eye(M*N))) = 0;


% [=================================================================]
%  randomize initial condition
% [=================================================================]
%initial condition (initial phase)
theta_t(:,1) = rand(N*M,1)*2*pi;

% [=================================================================]
%  simulate
% [=================================================================]

for t = 2:simtime/dt

	phasedifferences = bsxfun(@minus, theta_t(:,t-1)',theta_t(:,t-1));

	phasedifferences_W = connectivity.*phasedifferences;
	
	summed_sin_diffs = scaling*mean(sin(phasedifferences_W),2);

	theta_t(:,t) = theta_t(:,t-1) + dt*( omega_i + summed_sin_diffs  );

	if plotme
		figure(1000)
			% imagesc(reshape(theta_t(:,t),N,M))
			imagesc(reshape(mod(theta_t(:,t),2*pi),N,M))
			caxis([0 2*pi])
			colorbar
			drawnow
			
	end

end


% [=================================================================]
%  plots
% [=================================================================]

if plotme
	repeat = input(['repeat? ; 0 - no, 1 - yes \n'  ])
	figure(1000)
	clf

	subplot(2,2,1)
	plot(linspace(0,simtime, simtime*dt^-1), mod(theta_t,2*pi)')
	ylabel('phase (theta)')
	subplot(2,2,3)
	plot(linspace(0,simtime, simtime*dt^-1), sin(theta_t'))
	ylabel('sin(theta)')
	xlabel('seconds')

	subplot(2,2,[2 4])
	
	repeat = 1;
	while repeat
		for t = 1:simtime/dt
			% cla
			% line([0 0], [-1 1] ,'linestyle', '--' )
			% line([-1 1], [0 0] ,'linestyle', '--' )

			% line([zeros(1,N) cos(theta_t(:,t))'], [zeros(1,N) sin(theta_t(:,t))'] ,'marker', 'o', 'linestyle', 'none' )
			

			imagesc(reshape(mod(theta_t(:,t),2*pi),N,M))
			caxis([0 2*pi])
			colorbar
			drawnow
			pause(.05)
			

		end
		repeat = input(['repeat? ; 0 - no, 1 - yes \n'  ])
	end


end



