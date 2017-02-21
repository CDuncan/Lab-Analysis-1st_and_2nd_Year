DataCorrection;
load Data_1.mat;
load Data_3.mat;

% Data Input (Readings from Experiment 1 and 3 are compatible)
%-------------------------------------------------------------   
% Object Distance (Distance from light to lens 'u')
OldLens_Pos_rec		= Data_1(1).Reading - OffsetLens; 		% Accouting offset of lens from recorded position
NewLens_Pos_rec		= Data_3(1).Reading - OffsetLens;
CombiLens_Pos_rec	= [OldLens_Pos_rec;NewLens_Pos_rec];  		% Combing data sets
CombiLens_Pos		= SIConv(CombiLens_Pos_rec,'milli');
ObjectDistance		= CombiLens_Pos;				% Renaming to clarify for later use
ObjectDistance_fit	= repmat(ObjectDistance,1,7);			% Duplicating data along matrix to allow later operations

% Image Distance (Distance from lens to screen 'v')
OldScreen_Pos_rec	= Data_1(2).Reading + OffsetScreen;		% Accouting offset of screen from recorded position
NewScreen_Pos_rec	= Data_3(2).Reading + OffsetScreen;
CombiScreen_Pos_rec	= [OldScreen_Pos_rec;NewScreen_Pos_rec];	% Combing data sets
CombiScreen_Pos		= SIConv(CombiScreen_Pos_rec,'milli');
CombiScreen_Disp	= CombiScreen_Pos - ObjectDistance_fit;		% Changing from position along rail to displacement from lens
CombiScreen_Disp_m	= mean(CombiScreen_Disp,2);			% Taking mean of repeat readings
ImageDistance		= CombiScreen_Disp_m;				% Renaming to clarify for later use

% Data Reuse from reversability of Light
ObjectDistance		= [CombiLens_Pos;CombiScreen_Disp_m];		% Adding opposite reading to end of data
ImageDistance		= [CombiScreen_Disp_m;CombiLens_Pos];
invImageDistance	= 1./ImageDistance;				% Relationship is between inverse values
invObjectDistance	= 1./ObjectDistance;


% Error
%-------------------------------------------------------------   
eObjectDistance		= SIConv(eOffLens_Cave_rec,'milli');
einvObjectDistance	= CombiError(1,0,ObjectDistance,eObjectDistance,'/');
eImageDistance		= SIConv(eOffScreen_rec,'milli');
einvImageDistance	= CombiError(1,0,ImageDistance,eImageDistance,'/');


% Graph
%-------------------------------------------------------------   
errorsquare(invObjectDistance,einvObjectDistance,invImageDistance,einvImageDistance,10);
% Settings
ax		= gca;
ax.Box		= 'off';
ax.TickDir	= 'out';
ax.TickLength	= [0.01 0.035];
%
ax.XGrid	= 'on';
ax.XMinorGrid	= 'on';
ax.XTick	= 0:1:100;
ax.XMinorTick	= 'on';

%
ax.YGrid	= 'on';
ax.YMinorGrid	= 'on';
ax.YTick	= 0:1:100;
ax.YMinorTick	= 'on';
%
[XLim,YLim] = LimSet(invObjectDistance,0.5,invImageDistance,0.5);
ax.XLim = XLim;
ax.YLim = YLim;


% Fit
tabledfit(invObjectDistance,einvObjectDistance,invImageDistance,einvImageDistance);
