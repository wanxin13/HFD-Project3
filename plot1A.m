function []=plot1A(tau,n,stockname)

startDate = datenum('0935','HHMM')
endDate = datenum('1600','HHMM')
xData = linspace(startDate,endDate,77)

f = figure;
set(f,'units','normalized','outerposition',[0 0 1 1]);
plot(xData, tau, 'blue');
datetick('x','HHMM');
box off; grid on;
ylabel('Factor Value')
xlabel('Time');
title(strcat('Stock ',stockname, ' time-of-day factor'));
%print(f,'-dpng','-r200','figures/1A');
%close(f);