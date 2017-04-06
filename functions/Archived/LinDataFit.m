function LinDataFit(X,eX,Y,eY)
[a,b]	= wtls_line(X,Y,eX,eY,0);
f	= fittype('a*x+b');
String	= sprintf('%.4fx + %.4f',a,b);
LoBF	= cfit(f,a,b);
linfit	= plot(LoBF);
legend(linfit, String);
disp(String)
end
