syms n TW W H f en eTW eW eH 


R = (TW - W)/4 + (H^2)/(4*(TW - W));            eR          = ErrorPropagation(R,[TW W H; eTW eW eH]);
f = 1/((n-1)*((2/R) - (TW*(n-1))/(n*R^2)));     ef          = ErrorPropagation(f,[n H TW; en eH eTW]);
PrincAx = (f*(n-1)*TW)/(R*n);                   ePrincAx    = ErrorPropagation(PrincAx,[n H TW; en eH eTW]);


H       = 51.5;
TW      = 10.63;  %Total Width
W       = 3.23;     %Edge Width
n       = 1.485; %1.489
en      = 0.01;
eTW     = 0.01;
eW      = 0.01;
eH      = 0.01;
FLM     = eval(f);
eFLM    = eval(ef);

if 1 == 0
PrincAx = eval(PrincAx);
ePrincAx = eval(ePrincAx);
R = eval(R);
eR = eval(R);
end