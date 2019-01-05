clc;clear;
 k1=-0.0716;k2=0.8249;k3=-3.6994;
x = linspace(0,1);
y = k1*x.^3+k2*x.^5+k3*x.^7 ;
plot(x,y)
% x = linspace(0,500);
% y1 = -5.6713*x+1574.5;
% y2 = 0.1763*x-326.9463;
% y3 = 1.3191*x-405.5285;
% y4 = -1.2405*x+320.2495;
% plot(x,y1)
% hold on
% plot(x,y2)
% hold on
% plot(x,y3)
% hold on
% plot(x,y4)
% hold on