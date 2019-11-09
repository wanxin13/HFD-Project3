% main.m
% This script when run should compute all values and make all plots
% required by the project.
% To do so, you must fill the functions in the functions/ folder,
% and create scripts in the scripts/ folder to make the required
% plots.

% Add folders to path
addpath('./functions/','./scripts/');

% Add plot defaults
plotDefaults;

%% Exercise1
% %Input Values
N = 78
T = 2769
n = N-1
alpha = 5

% % Compute values
[dates,X] = loadStockData('C:\Users\wc145\ECON672\Projects\Data\HD5min.csv',0)
[rDates, r] = getReturns(dates, X, N, T)
[tau,b] = getTimeOfDay(r,n,T)
cut = getThreshold(r, n, T, tau, alpha)
[rc,rd,c] = SeparateJumps(r,rDates, n, T, cut)
% 
% [dates2,X2] = loadStockData('C:\Users\wc145\ECON672\Projects\Data\VZ5min.csv',0)
% [rDates2, r2] = getReturns(dates2, X2, N, T)
% tau2 = getTimeOfDay(r2,n,T)
% cut2 = getThreshold(r2, n, T, tau2, alpha)
% [rc2,rd2,c2] = SeparateJumps(r2,rDates, n, T, cut2)
% % Make plots
%plot1A(tau2,n,'VZ')
% %plot1Brc(rc,rDates,'HD')
% %plot1Brd(rd,rDates,'HD')
%plot1Erc(rc,rd,n,T,'HD')
%plot1Erd(rd,n,T,'HD')
%% Exercise2
% % Input values
% a = 2;
% kn = 7;
% J = 1000;
% % % Compute values
TV = getTV(rc, n, T)
RV = getRV(r, n, T)
% [CI_lower,CI_upper] = getCI(TV,rc, n, T)
% [TVOne,CI_lowerOne,CI_upperOne,datesOne] = getOneMonthTV(TV,CI_lower,CI_upper,rDates, n, T)
% 
% TV2 = getTV(rc2, n, T)
% RV2 = getRV(r2, n, T)
% [CI_lower2,CI_upper2] = getCI(TV2,rc2, n, T)
% [TVOne2,CI_lowerOne2,CI_upperOne2,datesOne2] = getOneMonthTV(TV2,CI_lower2,CI_upper2,rDates2, n, T)

%Bootstrap
%rc = [rc,rc2];
%[CI_low,CI_up,bsample]=getBTV(J,n,T,rc,a,kn)
%[TVOne,CI_lowOne,CI_upOne,datesOne] = getOneMonthTV(TV,CI_low,CI_up, rDates, n, T)

%[TVOne2,CI_lowOne2,CI_upOne2,datesOne2] = getOneMonthTV(TV2,CI_low(:,2),CI_up(:,2), rDates2, n, T)

% Make plots
%plot2A(TV,rDates,n,T,'HD')
%plot2B(TV,RV,rDates,n,T,'HD')
% plot2C(CI_upper,CI_lower,TV,rDates,n,T,'HD')
%plot2D(CI_upperOne,CI_lowerOne,TVOne,datesOne,'HD')
%[CI_upper_year,CI_lower_year,TV_year]=plot2H(rc,TV,rDates,n,T,'HD')
%[CI_upper_year2,CI_lower_year2,TV_year2]=plot2H(rc2,TV2,rDates2,n,T,'VZ')
%plot2J(CI_up,CI_low,TV,rDates,n,T,'HD')
% plot2K(CI_upper_year,CI_lower_year,CI_upOne,CI_lowOne,TV_year,rDates,n,T,'HD')
%plot2K(CI_upper_year2,CI_lower_year2,CI_upOne2,CI_lowOne2,TV_year2,rDates,n,T,'VZ')
%% Exercise3
% % Input values
% seed = 2018;
% n = 79;
% n1 = 78;
% T = 1.25*252;
% n_euler = 20*n;
% rho = 0.03;
% mu_c = 0.000121;
% sigma_c = 0.0005;
% c0 = mu_c;
% X0 = log(100);
% count = 0
% count_2 = 0;
% lamda = 1;
% sigma_jump = 25*sqrt(mu_c/n);
% % Compute values
% c = simStochasticVariance(n, T, n_euler, rho, mu_c, sigma_c, c0, seed);
% X_high= simDiffusionStochasticVariance(n, T, n_euler, X0, c, seed);
% %Lower Frequency X
% X_low = [ zeros( n*T+1,1)];
% for i = 1: n*T+1
%     X_low (i,1) = X_high ( (i-1)*(n_euler/n)+1,1);
% end
% 
% % Throw First Value
% for i = 1:n*T
%     X_low(i,1) = X_low(i+1,1);
% end
% X_low = X_low(1:end-1,:);
% for i = 1:n_euler*T
%     c(i,1) = c(i+1,1);
% end
% c = c(1:end-1,:);
% 
% IV = getIV(c, n_euler, T)
% 
% % get returns
% for d = 0:T-1
%     for i = 1:n1
%         r_2(d*n1+i,1) = X_low(d*n+i+1,1)-X_low(d*n+i,1);
%     end
% end
% RV_2 = getRV(r_2, n1, T);
% 
% [CI_upper_year,CI_lower_year,IV_year]=plot3F(r_2,IV,RV_2,n1,T)
% for i = 1:T
%     if IV_year(i,1)>=CI_lower_year(i,1) && IV_year(i,1)<=CI_upper_year(i,1)
%         count = count+1;
%     end
% end
% ratio = count/T;

% % Add jumps
% Y = simJumpProcess(n, T, lamda, sigma_jump, seed);
% Y = Y(1:end-1,:);
% X = X_low + Y;

% % get returns
% for d = 0:T-1
%     for i = 1:n1
%         r_3(d*n1+i,1) = X(d*n+i+1,1)-X(d*n+i,1);
%     end
% end
% RV_3 = getRV(r_3, n1, T);
% 
% [CI_upper_year_2,CI_lower_year_2,IV_year]=plot3F(r_3,IV,RV_3,n1,T)
% for i = 1:T
%     if IV_year(i,1)>=CI_lower_year_2(i,1) & IV_year(i,1)<=CI_upper_year_2(i,1)
%         count_2 = count_2+1;
%     end
% end
% ratio_2 = count_2/T
% % Make plots
%plot3A1(c,n_euler,T);
%plot3A2(X_low,n,T);
%plot3C(IV,T);
%plot3D(RV_2,IV,T)
%[CI_upper_year,CI_lower_year,RV_year]=plot3F(r_2,RV_2,n1,T)
%plot3H(X,n,T)