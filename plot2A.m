function []=plot2A(TV,rDates,n,T,stockname)

TV_year = zeros(T, 1);
TV_year = 100*sqrt(TV(:,1)*252);

for d = 0:T-1
    dates( d+1,1)= rDates(n*d+1,1)
end

f = figure;
set(f,'units','normalized','outerposition',[0 0 1 1]);
plot(dates, TV_year, 'blue');
datetick('x','yyyy');
box off; grid on;
ylabel('Stock TV in percentage')
xlabel('Time');

title(strcat('Stock ',stockname, ' Annualized TV'));
%print(f,'-dpng','-r200','figures/2B');
%close(f);