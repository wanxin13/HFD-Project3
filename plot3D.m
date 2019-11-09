function []=plot3D(RV,IV,T)

RV_year = 100*sqrt(252*RV(:,1));
IV_year = 100*sqrt(252*IV(:,1));


f = figure;
set(f,'units','normalized','outerposition',[0 0 1 1]);

a=plot([1:1:T], RV_year, 'blue');
hold on
b=plot([1:1:T], IV_year, 'red');

%b.Color(4) = 0.3;

%datetick('x','yyyy');
box off; grid on;
ylabel('Annual RV and IV in percentage')
xlabel('days');
legend('RV_year','IV_year')
title(strcat(' RV and IV Comparison'));
%print(f,'-dpng','-r200','figures/1F');
%close(f);