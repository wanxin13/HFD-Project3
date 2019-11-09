function []=plot1Erc(rc,rd,n,T,stockname)

[g,xi]=ksdensity(rc,'Kernel','epanechnikov','Bandwidth',0.001)
    
f = figure;
set(f,'units','normalized','outerposition',[0 0 1 1]);
plot(xi, g, 'blue');
%datetick('x','yyyy');
box off; grid on;
%ylabel('Density')
%xlabel('Diffusive Returns');
%title(strcat('Stock ',stockname, ' Diffusive Returns Distribution'));
%print(f,'-dpng','-r200','figures/1Erc_VZ');
%close(f);
hold on;
j = 1;
for i =1: n*T
    if rd(i,1) ~= 0
        rdd(j,1) = rd(i,1);
        j = j+1;
    end
end
[g,xi]=ksdensity(rdd,'Kernel','epanechnikov','Bandwidth',0.001)
    
%f = figure;
%set(f,'units','normalized','outerposition',[0 0 1 1]);
plot(xi, g, 'red');
%datetick('x','yyyy');
box off; grid on;
ylabel('Density')
xlabel('Diffusive and Jump Returns');
title(strcat('Stock ',stockname, ' Diffusive and Jump Returns Distribution'));
legend('Diffusive Returns','Jump Returns')
%print(f,'-dpng','-r200','figures/1Erd_VZ');
%close(f);
