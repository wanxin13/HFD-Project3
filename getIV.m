function IV = getIV(c, n_euler, T)
% getRV computes the actual integrated variance of a day, day-by-day

% Initialize output
IV = zeros(T, 1);

%Calculate IV
for d = 0: T-1
    for i = 1:n_euler
        IV(d+1,1)= IV(d+1,1)+ c(d*n_euler+i,1);
    end
    IV(d+1,1) = IV(d+1,1)/n_euler;
end
    