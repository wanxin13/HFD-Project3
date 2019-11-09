function []=plot3C(IV,T)
%figure(3);

IV_year = 100*sqrt(252*IV(:,1));

S=[1:1:T];
plot(S,IV_year)
title('Actual Annualized Integrated Variance')
xlabel('days')
ylabel('Annulized IV')