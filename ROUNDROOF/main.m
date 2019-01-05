clear;clc;
%% Analysis
A=[];
b=[];
Aeq=[];
beq=[];
%% Design parameter
% x = [ d1,d2,d3,...,dn,theta1,theta2,....,thetan ]
global n W H H_top theta_c
n = 3;
W = 680;
H = 300;
H_top = 100;
theta_c = 50;

d = linspace(0,W,n+2);
theta = 91 * ones(1,n);
x0=[d(2:n+1),theta];
lb = [zeros(1,n),20*ones(1,n)];
ub = [W*ones(1,n),160*ones(1,n)];

options = optimoptions('fmincon','Display','iter','Algorithm','interior-point');
options.MaxFunctionEvaluations = 100000;
[x, fval] = fmincon(@objFunc,x0,A,b,Aeq,beq,lb,ub,@nonlcon,options)