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
eRuler_rec          = 1;
ePos_rec            = 0.75;

eOffLens_Cave_rec   = (2*(3.5*(eVernier_rec.^2) + ePos_rec.^2))^0.5;
eOffScreen_rec      = (2*(eRuler_rec.^2 + ePos_rec.^2))^0.5;

clearvars LensHolderWidth LensHolderBrim ORing LensWidthMid LensWidthBot ConcWidthMid ConcWidthBot eVernier_rec eRuler_rec ePos_rec