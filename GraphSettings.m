% Graph Settings

% General
ax = gca;
ax.Box = 'off';
ax.TickDir = 'out';
ax.TickLength = [0.01 0.035];

% X-Axis
ax.XGrid = 'on';
ax.XAxisLocation = 'bottom';
ax.XMinorGrid = 'on';
ax.XMinorTick = 'on';
ax.XLabel.String = 'X Label'
ax.XLabel.FontSize = 11
ax.XLabel.FontWeight = 'bold'
%~ax.XTick = A:B:C;
%~ax.XLim = [D E];


% Y-Axis
ax.YGrid = 'on';
ax.YAxisLocation = 'origin';
ax.YMinorGrid = 'on';
ax.YMinorTick = 'on';
ax.YLabel.String = 'Y Label'
ax.XLabel.FontSize = 11
ax.YLabel.FontWeight = 'bold'
%~ax.YTick = A:B:C;
%~ax.YLim = [D E];
