function[x_L,x_M,x_R] = roundSurface_un(d,theta,theta_c,W,H,H_top)
[x,y] = dtoXY_un(d,W,H_top);
if theta-theta_c/2==90
    x_L = x;
else
    x_L = (tan(degtorad(theta-theta_c/2)).*x-H-y)./tan(degtorad(theta-theta_c/2));
end
if theta+theta_c/2==90
    x_R = x;
else
    x_R = (tan(degtorad(theta+theta_c/2)).*x-H-y)./tan(degtorad(theta+theta_c/2));
end
if theta==90;
    x_M = x;
else
    x_M = (tan(degtorad(theta)).*x-H-y)./tan(degtorad(theta));
end
end
