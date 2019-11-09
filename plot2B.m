function []=plot2B(TV,RV,rDates,n,T,stockname)

TV_year = zeros(T, 1);
TV_year = 100*sqrt(TV(:,1)*252);

RV_year = zeros(T, 1);
RV_year = 100*sqrt(RV(:,1)*252);


for d = 0:T-1
    dates( d+1,1)= rDates(n*d+1,1)
end

f = figure;
set(f,'units','normalized','outerposition',[0 0 1 1]);

a=plot(dates, TV_year, 'blue');
hold on
b=plot(dates, RV_year, 'red');

b.Color(4) = 0.3;

datetick('x','yyyy');
box off; grid on;
ylabel('Stock TV and RV in percentage')
xlabel('Time');
legend('TV_year','RV_year')
title(strcat('Stock ',stockname, ' TV and RV Comparison'));
%print(f,'-dpng','-r200','figures/2B');
%close(f);