function [ c, ceq ] = nonlcon( x )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
%% Design parameter
% x = [ d1,d2,d3,...,dn,theta1,theta2,....,thetan ]
global n W H H_top theta_c
for i = 1:n
    [x_L(i),x_M(i),x_R(i)] = roundSurface(x(i),x(n+i),theta_c,W,H,H_top);
end
temp_x_L = [0,x_L,W];
temp_x_R = [0,x_R,W];
for i = 1:n+1
    c(i) = temp_x_L(i+1) - temp_x_R(i);
end
d = x(1:n);
iter = 1;
for i = (n+2):(2*n)
    c(i) = x_M(iter)-x_M(iter+1);
    iter = iter + 1;
end
iter = 1;
for i = (2*n+1):(3*n-1)
    c(i) = d(iter)-d(iter+1);
    iter = iter + 1;
end
ceq = [];

