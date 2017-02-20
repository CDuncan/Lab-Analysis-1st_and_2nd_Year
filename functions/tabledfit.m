function tabledfit(X,eX,Y,eY)
% Plots a linear

TabCh		= TabledChi(X,eX,Y,eY);
f		= fittype('a*x+b');
A		= TabCh.m(1);
B		= TabCh.c(1);
TabledFit	= cfit(f,A,B);
plot(TabledFit);
String		= sprintf('%.4fx + %.4f',A,B);
disp(String)
end
