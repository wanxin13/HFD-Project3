function []=plot2C(CI_upper,CI_lower,TV,rDates,n,T,stockname)

CI_upper = 100*CI_upper(:,1);
CI_lower = 100*CI_lower(:,1);
TV = 100*TV(:,1);

for d = 0:T-1
    dates( d+1,1)= rDates(n*d+1,1)
end

f = figure;
set(f,'units','normalized','outerposition',[0 0 1 1]);

a=plot(dates, CI_upper, 'black');
hold on
b=plot(dates, CI_lower, 'blue');
hold on
c=plot(dates, TV, 'red');

c.Color(4) = 0.8;

datetick('x','yyyy');
box off; grid on;
ylabel('Stock Daily Variance in Percentage')
xlabel('Time');
title(strcat('Stock ',stockname, ' CI for Integrated Variance'));
legend('CI_upper','CI_lower','TV')
%print(f,'-dpng','-r200','figures/1F');
%close(f);