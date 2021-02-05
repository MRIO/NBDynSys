function R = reservoir(N)
% N is the number of neurons in the RNN (reservoir)

T = 50000; % number of time steps
stim_t = 3000;
trans  = 1000;
exp_th  = 0;
sig_I   = 1;
sig_th  = 1;
sig_w   = sqrt(6.2); % sqrt(6.2) to reproduce Dauce, Cessac.

% use known seed to have reproducible outputs: 
seed = randi(100,1); % randi -> non negative integer
rng(seed)

I = zeros(T,N); % allocate and assign matrix for the stimulus
static_input = randn(1,N)*sig_I; % a static input vector
I(stim_t+1:end,:) = repmat(static_input, T-stim_t , 1);

% weights; N(mean = 0, sig = sig_w)
W = randn(N)*sig_w;
W = W;

% biases  (mean = 0, std = sig_th)
Th = randn(1,N)*sig_th + exp_th;

% initialize activity vector
a = zeros(T,N);

a(1,:) = rand(1,N);


% [=================================================================]
%  sigmoid function definition
% [=================================================================]

% sig=@(x)(1+tanh(x))/2;
sig = @(x) 1./(1+exp(-x));

% [=================================================================]
%  compute the network for t steps
% [=================================================================]

for t = 1:T-1
	a(t+1,:) = sig( (a(t,:)*W + I(t,:) - Th) );
end

% [=================================================================]
%  PLOTS
% [=================================================================]

 figure(1)
 	subplot(2,2,1)
	imagesc(a')
	title('activity')
	xlabel('time step') ; ylabel('neuron')
	colorbar

	subplot(2,2,2)
	plot(mean(a'))
	line([stim_t stim_t], [min(a(:)) max(a(:))],'color', 'r')
	title('mean activity time series')
	xlabel('time'); ylabel('mean net activity')

	subplot(2,2,3)
	imagesc(W)
	title('Connectivity // Matrix')
	colorbar
	
	subplot(2,2,4)
	plot(mean(a(1:T-1,:)'), mean(a(2:T,:)'),'.k','markersize',.05)
	hold on
	plot(mean(a(T-stim_t:end-1,:)'), mean(a(T-stim_t+1:T,:)'),'.r','markersize',.05)
	title('first return map')
	xlabel('mean net activity a(t)')
	xlabel('mean net activity a(t+1)')
	legend({'spont'; 'stim'})

	figure
	plot3(mean(a(1:T-2,:)'), mean(a(2:T-1,:)'),mean(a(3:T,:)'), '.k','markersize',.05)
	

	R.seed = seed;
