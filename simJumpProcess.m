function Y = simJumpProcess(n, T, lamda, sigma_jump, seed)
% simJumpProcess simulates values from a Compound Poisson process
%                with normally distributed jump sizes
%
% INPUT:
%       n: number of steps per day
%       T: number of days to simulate
%  lambda: jump intenisty (e.g.: 15/252)
%   sigma: volatility of the jump returns
%    seed: number to fix the random number generator
%
% OUTPUT:
%  Y: a n*T + 1 vector of values from a Compoun Poisson process
%

% Set seed so that results are replicable
rng(seed, 'twister');

% initialize return value
Y = zeros(n*T+1,1);

% Generate draw from the poisson
N = poissrnd( lamda*T);
% Generate draws from the uniform distribution
U = rand([ N,1]);
% Generate draws from the normal distribution
J = normrnd( 0, sigma_jump, [ N,1]);

%form discreted jump process
for i= 2: (n*T+1)
    for k= 1:N
        
        if U(k,1) <= ((i-1)/(n*T)) 
            Y(i,1)= Y(i,1) + J(k,1);
        end
        
    end
end