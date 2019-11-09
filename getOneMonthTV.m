function [TVOne,CI_lowerOne,CI_upperOne,datesOne] = getOneMonthTV(TV,CI_lower,CI_upper, rDates, n, T)
% getOneMonthTV computes the truncated variance estimator for the integrated
%       variance in one particular month
%
% INPUT:
%  rc: vector of doubles, diffusive returns
%  n: intenger, number of returns in a day
%  T: integer, number of days
%
% OUTPUT:
%  TVOne: vector of doubles, truncated variance in one month
%

% Initialize output
i=1;
for d = 0:T-1
    dates( d+1,1)= rDates(n*d+1,1)
end

%Pick TVOne
for d = 0:T-1
    m = month(datetime(dates(d+1,1),'ConvertFrom','datenum'));
    y = year(datetime(dates(d+1,1),'ConvertFrom','datenum'));
    if y == 2008& m == 10
        TVOne(i,1)=TV(d+1,1);
        CI_lowerOne(i,1)=CI_lower(d+1,1);
        CI_upperOne(i,1)=CI_upper(d+1,1);
        datesOne(i,1)=dates(d+1,1);
        i=i+1;
    end
end




