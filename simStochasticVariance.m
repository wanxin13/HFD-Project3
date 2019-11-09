function c = simStochasticVariance(n, T, n_euler, rho, mu_c, sigma_c, c0, seed)
% simStochasticVariance simulates values from a stochastic variance process
%
% INPUTS:
%       n:
%       T:
% n_euler:
%     rho:
%    mu_c:
% sigma_c:
%      c0:
%    seed:
%
% OUTPUT:
%  c:
%

% Set seed so that results are replicable
rng(seed, 'twister');

% initialize return value
c = [c0; zeros(n_euler*T,1)];           % the initial value is also returned

% generate random draws from normal distribution
Z = normrnd(0, 1, [ n_euler*T, 1])

%loop
for j = 2 : (n_euler*T+1)
   c(j,1) = c(j-1, 1) + rho * (mu_c - c(j-1,1))*(1/n_euler) + sigma_c * sqrt(c(j-1,1))*sqrt(1/n_euler) * Z(j-1, 1);
       if c(j,1)< mu_c/2
          c(j,1)=mu_c/2;
       end
end