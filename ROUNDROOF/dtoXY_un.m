function [ x,y ] = dtoXY( d,W,H_top )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
x_c = W/2;
y_c = (H_top-x_c.^2./H_top)/2;
r = H_top - y_c;
x = d;
y = sqrt(r.^2-(x-x_c).^2)+y_c;
end

