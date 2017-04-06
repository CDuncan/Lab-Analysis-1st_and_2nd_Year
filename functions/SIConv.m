function [ output ] = SIConv(x,type1,type2,type3,type4)
% Converts to SI units
% Checks the type of unit and converts to SI unit

%-------------------------------
% Controls amount of operations
%-------------------------------
switch nargin
    case 5
    val = SIConv(x,type4);
    val = SIConv(val,type3);
    val = SIConv(val,type2);
    case 4
    val = SIConv(x,type3);
    val = SIConv(val,type2);
    case 3
    val = SIConv(x,type2);
    case 2
    val = x;
end


%-------------------------------
% Changes prefix to base
%-------------------------------
switch type1
    case 'giga';
        output = val*(10^9);
    case 'mega';
        output = val*(10^9);
    case 'kilo';
        output = val*(10^3);
    case 'hecto';
        output = val*(10^2);
    case 'centi';
        output = val*(10^-2);
    case 'milli';
        output = val*(10^-3);
    case 'micro';
        output = val*(10^-6);
    case 'nano';
        output = val*(10^-9);
        
%-------------------------------
% Non SI units to SI units
%-------------------------------
    case 'celcius';
        output = val+(273.15);
    case 'litre';
    	output = val*(10^-3);
    case 'atmos'
        output = val*(101325);
    case 'eVolt';
        output = val*(1.602*10^-19);
    case 'minute';
        output = val*(60);
    case 'hour';
        output = val*(60^2);
    case '/minute';
        output = val*(60^-1);
    case '/hour';
        output = val*(60^-2);        
        
end