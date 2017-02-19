%-----------------------
% Exp 4
%-----------------------
DataCorrection;
load Data_4.mat;

% Data Input
Lens_Pos_rec		= Data_4(1).Reading - OffsetLens;
Lens_Pos		= SIConv(Lens_Pos_rec,'milli');
Lens_Pos_fit		= [Lens_Pos,Lens_Pos,Lens_Pos,Lens_Pos,Lens_Pos];

Concave_Pos_rec		= Data_4(3).Reading - OffsetConc;
Concave_Pos		= SIConv(Concave_Pos_rec,'milli');

Image_Pos1_rec		= Data_4(2).Reading + OffsetScreen;
Image_Pos1		= SIConv(Image_Pos1_rec,'milli');

Image_Pos2_rec		= Data_4(4).Reading + OffsetScreen;
Image_Pos2		= SIConv(Image_Pos2_rec,'milli');

% Calculations
Lens2Conc		= Concave_Pos - Lens_Pos_fit;
Lens2Conc_m		= mean(Lens2Conc,2);
Lens2Image1		= Image_Pos1 - Lens_Pos_fit;
Lens2Image1_m		= mean(Lens2Image1,2);
Conc2Image2		= Image_Pos2 - Concave_Pos;
Conc2Image2_m		= mean(Conc2Image2,2);

invf			= (1./(Lens2Image1_m - Lens2Conc_m)) + (1./(Conc2Image2_m));
f			= 1./invf;

% Error Calculations
eLens2Image1		= CombiError(0,SIConv(eOffScreen_rec,'milli'),0,SIConv(eOffLens_Cave_rec,'milli'),'+');
eConc2Image2		= eLens2Image1;
eLens2Conc		= CombiError(0,SIConv(eOffLens_Cave_rec,'milli'),0,SIConv(eOffLens_Cave_rec,'milli'),'+');
ef			= ((eConc2Image2.^2)./((Conc2Image2_m.^4).*(1./Conc2Image2_m + 1./(Lens2Conc_m - Lens2Image1_m)).^4) + (eLens2Conc.^2)./(((Lens2Conc_m - Lens2Image1_m).^4).*(1./Conc2Image2_m + 1./(Lens2Conc_m - Lens2Image1_m)).^4)+(eLens2Image1.^2)./(((Lens2Conc_m - Lens2Image1_m).^4).*(1./Conc2Image2_m + 1./((Lens2Conc_m - Lens2Image1_m)).^4))).^(1/2);

disp([f,ef])
