%-----------------------
% Exp 1, Graph 1
%----------------------- 
DataCorrection;
load Data_1.mat;
load Data_3.mat;

% Data Set Combination
%Set 3
NewLens_Pos_rec  	= Data_3(1).Reading.' - OffsetLens;
NewLens_Pos         = SIConv(NewLens_Pos_rec,'milli');
NewImage_Pos_rec    = Data_3(2).Reading + OffsetScreen;
NewImage_Pos        = SIConv(NewImage_Pos_rec,'milli');
%Set 1
OldLens_Pos_rec     = Data_1(1).Reading - OffsetLens;
OldLens_Pos         = SIConv(OldLens_Pos_rec,'milli');
OldImage_Pos_rec    = Data_1(2).Reading + OffsetScreen;
OldImage_Pos        = SIConv(OldImage_Pos_rec,'milli');
%Combo
CombiLens_Pos       = [OldLens_Pos;NewLens_Pos];
CombiLens_Pos_fit   = [CombiLens_Pos, CombiLens_Pos, CombiLens_Pos, CombiLens_Pos, CombiLens_Pos, CombiLens_Pos, CombiLens_Pos];
CombiImage_Pos      = [OldImage_Pos;NewImage_Pos];
CombiImage_Disp     = CombiImage_Pos - CombiLens_Pos_fit;
CombiImage_Disp_m   = mean(CombiImage_Disp.').';

% Data Reuse
invImage_Disp       = 1./CombiImage_Disp_m;
invLens_Pos         = 1./CombiLens_Pos;
invImage_Dispx      = invImage_Disp;
invLens_Posx        = invLens_Pos;
invImage_Disp       = [invImage_Dispx;invLens_Posx];
invLens_Pos         = [invLens_Posx;invImage_Dispx];

% Error
eLens_Pos       = SIConv(eOffLens_Cave_rec,'milli');
einvLens_Pos    = eLens_Pos.*(invLens_Pos.^2);
eImage          = SIConv(eOffScreen_rec,'milli');
einvImage       = eImage.*(invImage_Disp.^2);


% Graph
HVError2(invLens_Pos,einvLens_Pos,invImage_Disp,einvImage,1)


% Graph Settings
ax = gca;
ax.Box = 'off';
ax.TickDir = 'out';
ax.TickLength = [0.01 0.035];
%
ax.XGrid = 'on';
ax.XMinorGrid = 'on';
ax.XTick = 0:1:100;
ax.XMinorTick = 'on';

%
ax.YGrid = 'on';
ax.YMinorGrid = 'on';
ax.YTick = 0:1:100;
ax.YMinorTick = 'on';
