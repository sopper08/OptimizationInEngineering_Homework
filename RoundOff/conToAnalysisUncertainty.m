function Pfail = conToAnalysisUncertainty( x_un, H_Norm, H_top_Norm )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
%% Design parameter
% x = [ d1,d2,d3,...,dn,theta1,theta2,....,thetan ]
x = x_un(:,1:3);
theta = x_un(:,4:6);
global n W theta_c sample
w_un = W*ones([sample,n]);
theta_c_un = theta_c*ones([sample,n]);
for i = 1:3
    [x_L(:,i),x_M(:,i),x_R(:,i)] = roundSurface_un(x(:,i),theta(:,i),theta_c_un(:,i),w_un(:,i),H_Norm(:,i),H_top_Norm(:,i));
end
temp_x_L = [zeros([sample,1]),x_L,W*ones([sample,1])];
temp_x_R = [zeros([sample,1]),x_R,W*ones([sample,1])];
for i = 1:n+1
    c(:,i) = temp_x_L(:,i+1) - temp_x_R(:,i);
end
iter = 1;
for i = (n+2):(2*n)
    c(:,i) = x_M(:,iter)-x_M(:,iter+1);
    iter = iter + 1;
end
iter = 1;
for i = (2*n+1):(3*n-1)
    c(:,i) = x(:,iter)-x(:,iter+1);
    iter = iter + 1;
end
Pfail =  sum(c>0)/sample;
end

