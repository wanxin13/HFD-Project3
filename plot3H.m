function []=plot3H(P,n,T)
figure(7);
S=[1:n*T]
plot(S./n,exp(P))
title('Simulated Prices')
xlabel('Days')
ylabel('Prices in Dollars')