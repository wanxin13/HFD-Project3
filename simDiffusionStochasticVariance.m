function X = simDiffusionStochasticVariance(n, T, n_euler, X0, c, seed)
% simDiffusionStochasticVariance simulates the log-prices when the
%                                variance is stochastic
%
% INPUTS:
%       n:
%       T:
% n_euler:
%       c:
%    seed:
%
% OUTPUT:
%  X:
%

% Set seed so that results are replicable
rng(seed, 'twister');

% initialize return value
X = [X0; zeros(n_euler*T, 1)];

% Generate draws from the standard normal distribution
% For efficiency you must get all draws from the normal at once
Z = normrnd(0, 1, [ n_euler*T, 1]);

%simulate variance process

%Loop
for j = 2 : (n_euler*T+1)
    X(j,1) = X(j-1, 1) + sqrt(1/n_euler)*sqrt(c(j-1,1)) * Z(j-1, 1);
end
