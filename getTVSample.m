function TVSample = getTVSample(bsample, n, T,J)
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
TVSample = zeros(T, 1,J);

%Calculate TV
for j = 1:J
    for d = 0: T-1
        for i = 1:n
            TVSample(d+1,1,j)= TVSample(d+1,1,j)+ (abs(bsample(d*n+i,1,j)))^2;
        end
    end
end