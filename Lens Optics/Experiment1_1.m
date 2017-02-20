DataCorrection;
load Data_1.mat;
load Data_3.mat;

% Data Set Combination
%Set 3
NewLens_Pos_rec		= Data_3(1).Reading - OffsetLens;
NewImage_Pos_rec	= Data_3(2).Reading + OffsetScreen;
%Set 1
OldLens_Pos_rec		= Data_1(1).Reading - OffsetLens;
OldImage_Pos_rec	= Data_1(2).Reading + OffsetScreen;
%Combo
CombiLens_Pos_rec	= [OldLens_Pos_rec;NewLens_Pos_rec];
CombiLens_Pos		= SIConv(CombiLens_Pos_rec,'milli');
CombiLens_Pos_fit	= repmat(CombiLens_Pos,1,7);
CombiImage_Pos_rec	= [OldImage_Pos_rec;NewImage_Pos_rec];
CombiImage_Pos		= SIConv(CombiImage_Pos_rec,'milli');
CombiImage_Disp		= CombiImage_Pos - CombiLens_Pos_fit;
CombiImage_Disp_m	= mean(CombiImage_Disp,2);

% Data Reuse
Image_Dispx		= CombiImage_Disp_m;
Lens_Posx		= CombiLens_Pos;
Image_Disp		= [Image_Dispx;Lens_Posx];
Lens_Pos		= [Lens_Posx;Image_Dispx];
invImage_Disp		= 1./Image_Disp;
invLens_Pos		= 1./Lens_Pos;


% Error
eLens_Pos		= SIConv(eOffLens_Cave_rec,'milli');
einvLens_Pos		= CombiError(1,0,Lens_Pos,eLens_Pos,'/');
eImage_Disp		= SIConv(eOffScreen_rec,'milli');
einvImage_Disp		= CombiError(1,0,Image_Disp,eImage_Disp,'/');


% Graph
errorsquare(invLens_Pos,einvLens_Pos,invImage_Disp,einvImage_Disp,10);
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
% Fit
tabledfit(invLens_Pos,einvLens_Pos,invImage_Disp,einvImage_Disp);
