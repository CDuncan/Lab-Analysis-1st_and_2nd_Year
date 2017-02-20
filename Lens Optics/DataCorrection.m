%-----------------------
% Data Correction
%-----------------------    
%Right Rail to Lens
LensHolderWidth     = 25.6;
LensHolderBrim      = 4.01;
ORing               = 3.49;
LensWidthMid        = 10.63;
LensWidthBot        = 3.23;
OffsetLens          = LensHolderWidth - LensHolderBrim - ORing - LensWidthBot./2;
%Right Rail to Concave
ConcWidthMid        = 4.51;
ConcWidthBot        = 12.63;
OffsetConc          = LensHolderWidth - LensHolderBrim - ORing - ConcWidthMid./2;
%Left Rail to Screen
OffsetScreen        = 19;

%Errors
eVernier_rec        = 0.01;
eRuler_rec          = 0.5;
ePos_rec            = 0.5;

eOffLens_Cave_rec   = (3*eVernier_rec^2 + (0.5*eVernier_rec)^2 + ePos_rec^2)^0.5;
eOffScreen_rec      = CombiError(eRuler_rec,ePos_rec,'+')

clearvars -except OffsetLens OffsetConc OffsetScreen eOffLens_Cave_rec eOffScreen_rec;
