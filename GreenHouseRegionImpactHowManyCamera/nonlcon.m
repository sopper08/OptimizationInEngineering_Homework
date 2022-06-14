function [c, ceq] = nonlcon(x)
%% Design variable
m = x(1);
n = x(2);
h = x(3);
%% Design parameters
k1 = -0.0716;
k2 = 0.8249;
k3 = -3.6994;
k4 = 11.34;
L = 20000;
W =  12000;
Hmin = 3200;
Hmax = 3800;
Eerr = 0.2;
%% Cep
ceq = [];
%% G
%  --- G1 ---
c(1) = L - k4*h*m;
c(2) = W - k4*h*n;

r = sqrt((L/m).^2+(W/n).^2)/2/(sqrt(2)*k4*h)/2
xd = L/(2*m)*(1+k1*r.^2+k2*r.^4+k3*r.^6)
x_delta = abs(xd-L/(2*m))
yd = W/(2*n)*(1+k1*r.^2+k2*r.^4+k3*r.^6)
y_delta = abs(yd-W/(2*n))
delta = sqrt(x_delta^2+y_delta^2)
c(3) = delta - Eerr;