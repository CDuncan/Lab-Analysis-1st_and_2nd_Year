%-----------------------
% Exp 3
%-----------------------
DataCorrection;
load Data_1.mat;
load Data_3.mat;

% Data Input
NewLens_Pos_rec		= Data_3(1).Reading.' - OffsetLens;
NewLens_Pos		= SIConv(NewLens_Pos_rec,'milli');
NewImage_Pos_rec	= Data_3(2).Reading + OffsetScreen;
NewImage_Pos		= SIConv(NewImage_Pos_rec,'milli');

% Data Reuse
OldLens_Pos_rec		= Data_1(1).Reading - OffsetLens;
OldLens_Pos		= SIConv(OldLens_Pos_rec,'milli');
OldImage_Pos_rec	= Data_1(2).Reading + OffsetScreen;
OldImage_Pos		= SIConv(OldImage_Pos_rec,'milli');

CombiLens_Pos		= [OldLens_Pos;NewLens_Pos];
CombiImage_Pos		= [OldImage_Pos;NewImage_Pos];
CombiImage_Pos_m	= mean(CombiImage_Pos,2);

% Data Reuse*2 (cheeky)
CombiLens_Posx		= [CombiLens_Pos;(CombiImage_Pos_m-CombiLens_Pos)];
CombiImage_Pos_mx	= CombiImage_Pos_m;
CombiLens_Pos		= [CombiLens_Posx];
CombiImage_Pos_m	= [CombiImage_Pos_mx;CombiImage_Pos_mx];

eLens_Pos		= SIConv(OffsetLens,'milli')*[CombiLens_Pos./CombiLens_Pos];
eImage			= SIConv(OffsetScreen,'milli')*[CombiLens_Pos./CombiLens_Pos];

% Graph
%SPECIAL PLOT
%scatter(CombiLens_Pos,CombiImage_Pos_m)
HVError2(CombiLens_Pos,eLens_Pos,CombiImage_Pos_m,eImage,1)


% Graph Settings
ax			= gca;
ax.Box			= 'off';
ax.TickDir		= 'out';
ax.TickLength		= [0.01 0.035];
%
ax.XGrid		= 'on';
ax.XMinorGrid		= 'on';
ax.XMinorTick		= 'on';
ax.XLim			= [0.1 0.5];
%
ax.YGrid		= 'on';
ax.YMinorGrid		= 'on';
ax.YMinorTick		= 'on';
ax.YLim			= [floor(min(CombiLens_Pos)) ceil(max(CombiLens_Pos))];
