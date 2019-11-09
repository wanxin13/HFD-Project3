function [CI_upper_year,CI_lower_year,IV_year]=plot3F(rc,IV,RV,n,T)

% Initialize output
CI_lower_year = zeros(T, 1);
CI_upper_year = zeros(T, 1);
V = zeros(T, 1);

%Calculate CI
for d = 0: T-1
    for i = 1:n
        V(d+1,1)= V(d+1,1)+ (rc(d*n+i,1))^4;
    end
    V(d+1,1)= V(d+1,1)*252/(6*(RV(d+1,1)));
    CI_lower_year(d+1,1) = sqrt(252*RV(d+1,1))-1.96*sqrt(V(d+1,1));
    CI_upper_year(d+1,1) = sqrt(252*RV(d+1,1))+1.96*sqrt(V(d+1,1));
end

CI_upper_year = 100*CI_upper_year(:,1);
CI_lower_year = 100*CI_lower_year(:,1);
IV_year = 100*sqrt(252*IV(:,1));


f = figure;
set(f,'units','normalized','outerposition',[0 0 1 1]);

a=plot([1:1:T], CI_upper_year, 'black');
hold on
b=plot([1:1:T], CI_lower_year, 'blue');
hold on
c=plot([1:1:T], IV_year, 'red');

%b.Color(4) = 0.5;
c.Color(4) = 0.5;

%datetick('x','yyyy');
box off; grid on;
ylabel('Annualized Variance in Percentage')
xlabel('Days');
title(strcat(' CI for Integrated Variance'));
legend('CI_upper_year','CI_lower_year','IV_year')
%print(f,'-dpng','-r200','figures/1F');
%close(f);