function HVError2(X,eX,Y,eY,Xrange)
%----------------------------------------------
% Callum Duncan 2017-01-31
% University of Manchester
%----------------------------------------------
% Takes 2 Reading, Error array pairs
% Plots X and Y error bars
%-----------------------------------------------
terrorbar(X,Y,eY,0.003,'units');
hold;

XMod    = X(Xrange:1:length(X));
YMod    = Y(Xrange:1:length(X));
eYMod   = eY(Xrange:1:length(X));
herrorbar(XMod,YMod,eYMod,'b');

%Calculate and plot fit
fit         = polyfit(X,Y,1);
disp(fit)
%Find x intercept as an integer
xint_fp     = -(fit(2)/fit(1));
x_lim        = floor(xint_fp);
plot(X,[fit(1)*X + fit(2)],'-r','LineWidth',0.05);
plot([x_lim,0],[fit(1)*[x_lim,0] + fit(2)],'-r','LineWidth',0.05);
