%-----------------------
% Exp 3
%-----------------------
DataCorrection;
load Data_1.mat;
load Data_3.mat;

% Data Input
NewLens_Pos_rec		= Data_3(1).Reading - OffsetLens;
NewImage_Pos_rec	= Data_3(2).Reading + OffsetScreen;
OldLens_Pos_rec		= Data_1(1).Reading - OffsetLens;
OldImage_Pos_rec	= Data_1(2).Reading + OffsetScreen;

%Combo
CombiLens_Pos_rec	= [OldLens_Pos_rec;NewLens_Pos_rec];
CombiLens_Pos		= SIConv(CombiLens_Pos_rec,'milli');
CombiLens_Pos_fit	= repmat(CombiLens_Pos,1,7);

CombiImage_Pos_rec	= [OldImage_Pos_rec;NewImage_Pos_rec];
CombiImage_Pos		= SIConv(CombiImage_Pos_rec,'milli');
CombiImage_Pos_m	= mean(CombiImage_Pos,2);
CombiImage_Disp		= CombiImage_Pos - CombiLens_Pos_fit;
CombiImage_Disp_m	= mean(CombiImage_Disp,2);

CombiLens_Pos		= [CombiLens_Pos;CombiImage_Disp_m];
CombiImage_Pos		= [CombiImage_Pos_m;CombiImage_Pos_m];

eLens_Pos		= SIConv(OffsetLens,'milli');
eLens_Pos_fit		= InpError(CombiLens_Pos,eLens_Pos,'abs');
eImage_Pos		= SIConv(OffsetScreen,'milli');
eImage_Pos_fit		= InpError(CombiImage_Pos,eImage_Pos,'abs');

% Graph
%SPECIAL PLOT
errorsquare(CombiLens_Pos,eLens_Pos_fit,CombiImage_Pos,eImage_fit)

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
