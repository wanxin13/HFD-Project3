function []=plot2D(CI_upperOne,CI_lowerOne,TVOne,datesOne,stockname)

CI_upperOne = 100*CI_upperOne(:,1);
CI_lowerOne = 100*CI_lowerOne(:,1);
TVOne = 100*TVOne(:,1);

f = figure;
set(f,'units','normalized','outerposition',[0 0 1 1]);

a=plot(datesOne, CI_upperOne, 'black');
hold on
b=plot(datesOne, CI_lowerOne, 'blue');
hold on
c=plot(datesOne, TVOne, 'red');

c.Color(4) = 0.8;

datetick('x','yyyy-mm-dd');
box off; grid on;
ylabel('Stock Daily Variance in Percentage')
xlabel('Days in Oct.2008');
title(strcat('Stock ',stockname, ' CI for Integrated Variance in Oct.2008'));
legend('CI_upperOne','CI_lowerOne','TVOne')
%print(f,'-dpng','-r200','figures/1F');
%close(f);