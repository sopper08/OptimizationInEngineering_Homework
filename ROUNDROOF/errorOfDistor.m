function [ Eerr ] = errorOfDistor( d,theta,theta_c,W,H,H_top,x_Lc,x_Rc )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
[x,y] = dtoXY( d,W,H_top );
[x_L,x_M,x_R] = roundSurface(d,theta,theta_c,W,H,H_top);
%% Find linear equ (x_L,-H) deg:theta-90; (x_M,-H) to (x,y); (x_Lc,-H) to (x,y); (x_Rc,-H) to (x,y)
% y = ax + b
% a,b: (x_L,-H) deg:theta-90
% a1,b1: (x_M,-H) to (x,y)
if theta>90
    a  = tan(degtorad(theta-90));
    b  = -H-a*x_L;
    a1 = tan(degtorad(theta));
    b1 = -H-a1*x_M;
elseif theta<90
    a = tan(degtorad(theta+90));
    b = -H-a*x_R;
    a1 = tan(degtorad(theta));
    b1 = -H-a1*x_M;
else
    a1 = 0;
    b1 = -H;
end
% a2,b2: (x_Lc,-H) to (x,y)
a2 = atan((y-(-H))/(x-x_Lc));
b2 = -H-a2*x_Lc;
% a3,b3: (x_Rc,-H) to (x,y)
a3 = atan((y-(-H))/(x-x_Rc));
b3 = -H-a3*x_Rc;
%% Find (x_Mc1,y_Mc1), (x_Lc1,y_Lc1), (x_Rc1,y_Rc1)
% (x_Mc1,y_Mc1)
if theta~=90
    A = [-a,1;-a1,1];B = [b;b1];s = A\B;
    x_Mc1 = s(1); y_Mc1 = s(2);
    % (x_Lc1,y_Lc1)
    A = [-a,1;-a2,1];B = [b;b2];s = A\B;
    x_Lc1 = s(1); y_Lc1 = s(2);
    % (x_Rc1,y_Rc1)
    A = [-a,1;-a3,1];B = [b;b3];s = A\B;
    x_Rc1 = s(1); y_Rc1 = s(2);
else
    x_Mc1 = x   ; y_Mc1 = -H;
    x_Lc1 = x_Lc; y_Lc1 = -H;
    x_Rc1 = x_Rc; y_Rc1 = -H;
end
%% Find (N_x_Lc1,N_y_Lc1), (N_x_Rc1,N_y_Rc1)
k1=-0.0716;k2=0.8249;k3=-3.6994; 
L = sqrt((x_Mc1-x_L)^2+(y_Mc1-(-H))^2);
% (N_x_Lc1,N_y_Lc1)
dL = sqrt((x_Lc1-x_Mc1)^2+(y_Lc1-y_Mc1)^2)/L;
ddL = -k1*dL^3+k2*dL^5+k3*dL^7;
N_x_Lc1 = x_Lc1 + ddL*L*cos(degtorad(theta-90));
N_y_Lc1 = y_Lc1 + ddL*L*sin(degtorad(theta-90));
N_x_Lc = ((y-N_y_Lc1)/(x-N_x_Lc1)*x-H-y)/((y-N_y_Lc1)/(x-N_x_Lc1));
e_L = sqrt((x_Lc-N_x_Lc)^2);
% (N_x_Rc1,N_y_Rc1)
dR = sqrt((x_Rc1-x_Mc1)^2+(y_Rc1-y_Mc1)^2)/L;
ddR = k1*dR^3+k2*dR^5+k3*dR^7;
N_x_Rc1 = x_Rc1 + ddR*L*cos(degtorad(theta-90));
N_y_Rc1 = y_Rc1 + ddR*L*sin(degtorad(theta-90));
N_x_Rc = ((y-N_y_Rc1)/(x-N_x_Rc1)*x-H-y)/((y-N_y_Rc1)/(x-N_x_Rc1));
e_R = sqrt((x_Rc-N_x_Rc)^2);
Eerr = e_L+e_R;
% disp(['L_p   : ',num2str(x_L)])
% disp(['L_cp  : ',num2str(x_Lc)])
% disp(['N_L_cp: ',num2str(N_x_Lc)])
% disp(['M_p   : ',num2str(x_M)])
% disp(['N_R_cp: ',num2str(N_x_Rc)])
% disp(['R_cp  : ',num2str(x_Rc)])
% disp(['R_p   : ',num2str(x_R)])
end

