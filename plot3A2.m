function []=plot3A2(P,n,T)
figure(7);
S=[0:n*T]
plot(S./n,exp(P))
title('Simulated Prices')
xlabel('days')
ylabel('Prices in Dollars')