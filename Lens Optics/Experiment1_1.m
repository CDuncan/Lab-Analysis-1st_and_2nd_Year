DataCorrection;
load Data_1.mat;
load Data_3.mat;

% Data Input (Readings from Experiment 1 and 3 are compatible)
%-----------------------    
% Object Distance (Distance from light to lens 'u')
NewLens_Pos_rec		= Data_3(1).Reading - OffsetLens; 		% Accouting offset of lens from recorded position
OldLens_Pos_rec		= Data_1(1).Reading - OffsetLens;
CombiLens_Pos_rec	= [OldLens_Pos_rec;NewLens_Pos_rec];  		% Combing data sets
CombiLens_Pos		= SIConv(CombiLens_Pos_rec,'milli');
CombiLens_Pos_fit	= repmat(CombiLens_Pos,1,7);			% Duplicating data along matrix to allow later operations
ObjectDistance		= CombiLens_Pos_fit;				% Renaming to clarify for later use

% Image Distance (Distance from lens to screen 'v')
NewScreen_Pos_rec	= Data_3(2).Reading + OffsetScreen;		% Accouting offset of screen from recorded position
OldScreen_Pos_rec	= Data_1(2).Reading + OffsetScreen;
CombiScreen_Pos_rec	= [OldScreen_Pos_rec;NewScreen_Pos_rec];	% Combing data sets
CombiScreen_Pos		= SIConv(CombiScreen_Pos_rec,'milli');
CombiScreen_Disp	= CombiScreen_Pos - CombiLens_Pos_fit;		% Changing from position along rail to displacement from lens
CombiScreen_Disp_m	= mean(CombiScreen_Disp,2);			% Taking mean of repeat readings
ImageDistance		= CombiScreen_Disp_m;				% Renaming to clarify for later use

% Data Reuse from reversability of Light
ObjectDistance		= [CombiLens_Pos_fit;CombiScreen_Disp_m];	% Adding opposite reading to end of data
ImageDistance		= [CombiScreen_Disp_m;CombiLens_Pos_fit];
invImage_Disp		= 1./Image_Disp;				% Relationship is between inverse values
invLens_Pos		= 1./Lens_Pos;


% Error
%-----------------------    
eLens_Pos		= SIConv(eOffLens_Cave_rec,'milli');
einvLens_Pos		= CombiError(1,0,Lens_Pos,eLens_Pos,'/');
eImage_Disp		= SIConv(eOffScreen_rec,'milli');
einvImage_Disp		= CombiError(1,0,Image_Disp,eImage_Disp,'/');


% Graph
%-----------------------    
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
