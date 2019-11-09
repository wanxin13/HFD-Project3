function []=plot1Brc(rc,rDates,stockname)


f = figure;
set(f,'units','normalized','outerposition',[0 0 1 1]);
plot(rDates, rc, 'blue');
datetick('x','yyyy');
box off; grid on;
ylabel('Stock diffusive returns for a day')
xlabel('Time');
title(strcat('Stock ',stockname, ' Diffusive Returns'));
%print(f,'-dpng','-r200','figures/1Brc_VZ');
%close(f);