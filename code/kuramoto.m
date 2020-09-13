function theta_t = kuramoto(varargin)
% inputs:
% N - number of oscillators (try 30)
% K - coupling constant     (try 50)
% 
% parameter value pairs
% 
% ('dt', 1e-3) 	
% ('simtime',1) % in seconds
% ('omega_mean', 10) 
% ('plotme', 1) 
% ('noise', 0) 
% ('connectivity', []) 


% [=================================================================]
%  parse inputs
% [=================================================================]

	p = inputParser;
	p.addRequired('N')  % number of oscillators
	p.addRequired('K')  % coupling parameter

	p.addParamValue('dt', 1e-3) 	
	p.addParamValue('simtime',1) % in seconds
	p.addParamValue('omega_mean', 10) % in Hz 
	p.addParamValue('plotme', 1) 
	p.addParamValue('noise', 0) % to implement
	p.addParamValue('connectivity', []) % to implement
	p.addParamValue('omega_std', 1)

	p.parse(varargin{:});

	N = p.Results.N;
	K = p.Results.K;
	connectivity = p.Results.connectivity;
	dt = p.Results.dt;
	simtime = p.Results.simtime;
	omega_mean = p.Results.omega_mean;
	plotme = p.Results.plotme;
	noise = p.Results.noise;
	omega_std = p.Results.omega_std;

% [=================================================================]
%  randomize oscillator intrinsic frequencies
% [=================================================================]

omega_i = (randn(N,1)*omega_std+omega_mean)*2*pi; 


% [=================================================================]
%  randomize initial condition
% [=================================================================]
%initial condition (initial phase)
theta_t(:,1) = rand(N,1)*2*pi;

% [=================================================================]
%  simulate
% [=================================================================]
for t = 2:simtime/dt

	phasedifferences = bsxfun(@minus, theta_t(:,t-1)',theta_t(:,t-1));
	
	summed_sin_diffs = K*mean(sin(phasedifferences),2);

	theta_t(:,t) = theta_t(:,t-1) + dt*( omega_i + summed_sin_diffs + rand);

end

% [=================================================================]
%  plots
% [=================================================================]

if plotme
	subplot(2,2,1)
	plot(linspace(0,simtime, simtime*dt^-1), mod(theta_t,2*pi)')
	ylabel('phase (theta)')
	subplot(2,2,3)
	plot(linspace(0,simtime, simtime*dt^-1), sin(theta_t'))
	ylabel('sin(theta)')
	xlabel('seconds')

	subplot(2,2,[2 4])
	axis([-1 1 -1 1])
	axis off
	
	for t = 1:simtime/dt
		cla
		line([0 0], [-1 1] ,'linestyle', '--' )
		line([-1 1], [0 0] ,'linestyle', '--' )

		line([zeros(1,N) cos(theta_t(:,t))'], [zeros(1,N) sin(theta_t(:,t))'] ,'marker', 'o', 'linestyle', 'none' )
		
		% plot here the CIRCULAR MEAN
		% the amplitude of the vector is the 'kuramoto parameter'

		drawnow
	end
end



