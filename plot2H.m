function [CI_upper_year,CI_lower_year,TV_year]=plot2H(rc,TV,rDates,n,T,stockname)

% Initialize output
CI_lower_year = zeros(T, 1);
CI_upper_year = zeros(T, 1);
V = zeros(T, 1);

%Calculate CI
for d = 0: T-1
    for i = 1:n
        V(d+1,1)= V(d+1,1)+ (rc(d*n+i,1))^4;
    end
    V(d+1,1)= V(d+1,1)*252*(1/6)*(1/TV(d+1,1));
    CI_lower_year(d+1,1) = sqrt(252*TV(d+1,1))-1.96*sqrt(V(d+1,1));
    CI_upper_year(d+1,1) = sqrt(252*TV(d+1,1))+1.96*sqrt(V(d+1,1));
end

CI_upper_year = 100*CI_upper_year(:,1);
CI_lower_year = 100*CI_lower_year(:,1);
TV_year = 100*sqrt(252*TV(:,1));

for d = 0:T-1
    dates( d+1,1)= rDates(n*d+1,1)
end

f = figure;
set(f,'units','normalized','outerposition',[0 0 1 1]);

a=plot(dates, CI_upper_year, 'black');
hold on
b=plot(dates, CI_lower_year, 'blue');
hold on
c=plot(dates, TV_year, 'red');

%b.Color(4) = 0.5;
c.Color(4) = 0.5;

datetick('x','yyyy');
box off; grid on;
ylabel('Stock Annualized Variance in Percentage')
xlabel('Time');
title(strcat('Stock ',stockname, ' CI for Integrated Variance'));
legend('CI_upper_year','CI_lower_year','TV_year')
%print(f,'-dpng','-r200','figures/1F');
%close(f);