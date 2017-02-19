%-----------------------
% Exp 2
%-----------------------
DataCorrection;
load Data_2.mat;

% Data Input
% Range = D
Range_rec		= Data_2(1).Reading + OffsetScreen;
Range			= SIConv(Range_rec,'milli').';
Range_fit		= repmat(Range,1,5);

% Lens_Pos = u
Lens_Pos1_rec		= Data_2(2).Reading - OffsetLens;
Lens_Pos1		= SIConv(Lens_Pos1_rec,'milli');

Lens_Pos2_rec		= Data_2(3).Reading.' - OffsetLens;
Lens_Pos2		= SIConv(Lens_Pos2_rec,'milli');

% Lens2Image = v1 = D - u1
Lens2Image1		= Range_fit - Lens_Pos1;

% LensDisp = d = v1 - u1 
LensDisp		= Lens2Image1 - Lens_Pos1;
LensDisp_m		= mean(LensDisp,2);

% Final Value
f			= (Range.^2 - LensDisp_m.^2)./(4*Range);

% Error
eRange			= SIConv(eOffScreen_rec,'milli');
eLens_Pos		= SIConv(eOffLens_Cave_rec,'milli');
eLens2Image1		= CombiError(0,eRange,0,eLens_Pos,'+');
eLensDisp		= CombiError(0,eLens2Image1,0,eLens_Pos,'+');
ef	= ((eRange.^2).*((Range.^2 - LensDisp_m.^2)./(4.*Range.^2) - 1/2).^2 + ((LensDisp_m.^2).*eLensDisp.^2)./(4.*Range.^2)).^(1/2);

disp([f,ef])
