function [CI_low,CI_up,bsample]=getBTV( J,n,T,rc,a,kn)


TV_hat = zeros(T,a,J); % save the estimated values for each boostrap repetition
% for each bootstrap repetition
for j = 1:J
    % obtain a bootstrap sample
    bsample = getTBSample(rc,n,a,T,kn);
    % compute theta hat
    TV_hat(:,:,j) = get2TV(bsample, n, T,a);% whatever you need to compute, like RV or RB or Rrho
end
% compute the quantiles of theta_hat to find the confidence interval for theta
for i =1:T
    for j =1:a
        CI_low(i,j,1) = quantile(TV_hat(i,j,:), 0.025);
        CI_up(i,j,1) = quantile(TV_hat(i,j,:), 0.975);
    end
end