function tabledfit(X,eX,Y,eY)
% Plots a linear

TabCh		= TabledChi(X,eX,Y,eY);
f		= fittype('a*x+b');
a		= TabCh.m(1);
b		= TabCh.c(1);
TabledFit	= cfit(f,a,b);
FittedLine	= plot(TabledFit);
String		= sprintf('%.4fx + %.4f',a,b);
legend([FittedLine], String);
disp(String)
end
