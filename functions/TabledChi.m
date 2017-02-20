function [ output ] = TabledChi(x,ex,y,ey)
%UNTITLED11 Summary of this function goes here
%   Detailed explanation goes here
[a,b,alpha,p,chiopt,Cab,Calphap]= wtls_line(x,y,ex,ey,0);
output = table(categorical({'Basic';'Stable'}), [a;alpha], [Cab(1,1)^0.5;Calphap(1,1)^0.5], [b;p], [Cab(1,2)^0.5;Calphap(1,2)^0.5], [chiopt;chiopt], 'VariableNames',{'Plot' 'm' 'em' 'c' 'ec' 'chi'});
end