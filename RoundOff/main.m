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

%% Uncertainty analysis
disp('Uncertainty analysis now!');
global sample
sample = 1000000;
x_mounting = x(1:3);
theta_mounting = x(4:6);
for i = 1:3
    theta_mounting_Norm(:,i) = normrnd(theta_mounting(i),5,[sample,1]);
end
H_Norm = normrnd(H,10,[sample,n]);
H_top_Norm = normrnd(H_top,5,[sample,n]);

x_un(:,1:3) = repmat( x_mounting,sample,1);
x_un(:,4:6) = theta_mounting_Norm;
% x_un

Pfail = conToAnalysisUncertainty( x_un, H_Norm, H_top_Norm )

disp('The following is Uncertainty analysis results!');
% [x, fval] = fmincon(@objFunc,x0,A,b,Aeq,beq,lb,ub,@nonlcon,options)