function []=plot2K(CI_upper_year,CI_lower_year,CI_upOne,CI_lowOne,TV_year,rDates,n,T,stockname)

[TVOne_year,CI_lowerOne_year,CI_upperOne_year,datesOne] = getOneMonthTV(TV_year,CI_lower_year,CI_upper_year, rDates, n, T)


CI_upOne_year = 100*sqrt(252*CI_upOne(:,1));
CI_lowOne_year = 100*sqrt(252*CI_lowOne(:,1));

f = figure;
set(f,'units','normalized','outerposition',[0 0 1 1]);

a=plot(datesOne, CI_upperOne_year, 'blue');
hold on
b=plot(datesOne, CI_lowerOne_year, 'blue');
hold on
c=plot(datesOne, TVOne_year, 'red');
hold on
a=plot(datesOne, CI_upOne_year, 'black');
hold on
b=plot(datesOne, CI_lowOne_year, 'black');

%c.Color(4) = 0.8;

datetick('x','mmdd');
box off; grid on;
ylabel('Stock Annual Variance in Percentage')
xlabel('Days in Oct.2008');
title(strcat('Stock ',stockname, ' CI for Integrated Variance Based On Asymptotic and Bootstrap'));
legend('CIUpYear Based on Asymptotic ','CILowYear Based on Asymptotic ','TVOneYear','CIUpYear Based on Bootstrap','CILowYear Based on Bootstrap')
%print(f,'-dpng','-r200','figures/1F');
%close(f);