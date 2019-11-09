function []=plot2J(CI_up,CI_low,TV,rDates,n,T,stockname)

CI_up_year = 100*sqrt(252*CI_up(:,1));
CI_low_year = 100*sqrt(252*CI_low(:,1));
TV_year = 100*sqrt(252*TV(:,1));

for d = 0:T-1
    dates( d+1,1)= rDates(n*d+1,1)
end

f = figure;
set(f,'units','normalized','outerposition',[0 0 1 1]);

a=plot(dates, CI_up_year, 'black');
hold on
b=plot(dates, CI_low_year, 'blue');
hold on
c=plot(dates, TV_year, 'red');

c.Color(4) = 0.8;

datetick('x','yyyy');
box off; grid on;
ylabel('Stock Anuual Variance in Percentage')
xlabel('Time');
title(strcat('Stock ',stockname, ' Bootstrap CI for Integrated Variance'));
legend('CI_up_year','CI_low_year','TV_year')
%print(f,'-dpng','-r200','figures/1F');
%close(f);