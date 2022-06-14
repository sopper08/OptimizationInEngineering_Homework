function f = objFunc( x )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
%% Design parameter
% x = [ d1,d2,d3,...,dn,theta1,theta2,....,thetan ]
global n W H H_top theta_c
for i = 1:n
    [x_L(i),x_R(i)] = roundSurface(x(i),x(n+i),theta_c,W,H,H_top);
end
temp_x_L = [0,x_L,W];
temp_x_R = [0,x_R,W];
for i = 2:n+1
    x_Lc(i-1) = (temp_x_L(i)+temp_x_R(i-1))/2;
    if x_Lc(i-1) <=0
        x_Lc(i-1) = 0;
    end
    x_Rc(i-1) = (temp_x_R(i)+temp_x_L(i+1))/2;
    if x_Rc(i-1) >= W
        x_Rc(i-1) = W;
    end
end
% [ Eerr ] = errorOfDistor( x,y,theta,theta_c,W,H,H_top,x_Lc,x_Rc )
for i = 1:n
    E(i) = errorOfDistor( x(i),x(n+i),theta_c,W,H,H_top,x_Lc(i),x_Rc(i) );
end
f = 0;
for i = 1:n
    f = f + E(i);
end
f = f/(2*n);

