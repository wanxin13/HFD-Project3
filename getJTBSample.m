function bsample = getJTBSample(rc,n,a,kn,J,T)
    bsample = zeros(n*T,a,J); % to store the bootstrap sample
    M = floor(n/kn); % number of subintervals
    B(1:M,1) = n; 
    C(1:T,1) = 1;
    D = [0:kn:(M-1)*kn];
    E(1:kn,1) = 1;
    offset(:,a,J) = kron(kron([0:1:T-1]',B) + kron(C,D'),E);
	id_rc = unidrnd(kn,n*T,a,J) + offset;
	for i =1 :J 
            bsample(:,1,i) = rc(id_rc(:,1,i),1);
    end
    
