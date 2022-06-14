clear;clc;
%% Analysis
A=[];
b=[];
Aeq=[];
beq=[];
lb=[1,1,3200];
ub=[inf,inf,3800];
x0=[2,2,3400];

options = optimoptions('fmincon','Display','iter','Algorithm','sqp');

[x, fval] = fmincon(@objFunc,x0,A,b,Aeq,beq,lb,ub,@nonlcon,options)