% Graph Settings

% General
ax			= gca;
ax.Box			= 'off';
ax.TickDir		= 'out';
ax.TickLength		= [0.01 0.035];

% X-Axis
ax.XGrid		= 'on';
ax.XAxisLocation 	= 'bottom';
ax.XMinorGrid		= 'on';
ax.XMinorTick		= 'on';
ax.XLabel.String	= 'X Label'
ax.XLabel.FontSize	= 11
ax.XLabel.FontWeight	= 'bold'
%~ax.XTick = A:B:C;
Xlow  = max([2*min(X)-max(X),floor(min(X))]);
Xhigh = min([2*max(X)-min(X),ciel(max(X))]);
ax.XLim = [Xlow Xhigh];


% Y-Axis
ax.YGrid		= 'on';
ax.YAxisLocation	= 'origin';
ax.YMinorGrid		= 'on';
ax.YMinorTick		= 'on';
ax.YLabel.String	= 'Y Label'
ax.XLabel.FontSize	= 11
ax.YLabel.FontWeight	= 'bold'
%~ax.YTick = A:B:C;
Ylow  = max([2*min(Y)-max(Y),floor(min(Y))]);
Yhigh = min([2*max(Y)-min(Y),ciel(max(Y))]);
ax.YLim = [Ylow Yhigh];
