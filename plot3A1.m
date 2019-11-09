function []=plot3A1(c,n_euler,T)
figure(5);
S=[0:n_euler*T]
plot(S./n_euler,c)
title('simStochasticVariance')
xlabel('days')
ylabel('volatility')