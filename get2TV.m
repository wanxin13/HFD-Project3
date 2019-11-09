function TV = get2TV(rc, n, T,a)
% getTV computes the realized truncated estimator for the integrated
%       variance of a day, day-by-day
%
% INPUT:
%  rc: vector of doubles, diffusive returns
%  n: intenger, number of returns in a day
%  T: integer, number of days
%
% OUTPUT:
%  TV: vector of doubles, truncated variance for each day
%

% Initialize output
TV = zeros(T, a);

%Calculate TV
for j = 1:a
  for d = 0: T-1
    for i = 1:n
        TV(d+1,j)= TV(d+1,j)+ (abs(rc(d*n+i,j)))^2;
    end
  end
end