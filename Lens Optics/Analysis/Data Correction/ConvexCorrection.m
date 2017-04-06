function [Pos_LensAdj,ePos_LensAdj] = ConvexCorrection(Pos_Lens)
%% Calculate Lens Properties
% O-Ring Width, Lens Height, Lens Rim Width, Lens Depth, Refractive Index
syms OW H W D n
R = ((D - W)/4) + ((H^2) /( 4*(D - W))); %Radius of Lens Curvature
%PrincipalPlane
invf = (n-1)*(2/R - W*(n-1)/(n*R^2)); %1/f
PrincipalPlane  = D*(n-1)/(R*n*invf);
%% Lens Centre Position Correction
r = OW/2;
AB = R+r;
BC = H/2 - r;
CA = Pythagoras(BC,AB,'AH');

EA = CA - (R - (D-W)/2);

Lip_to_Centre = r + EA + W/2;

syms LipW CaseW
% Lip Width, Lens Case Width
Centre_Lens_Position_Correction = CaseW - LipW - Lip_to_Centre; 
%% Lens Position Offset Correction
syms LBFacePos
dPosition = LBFacePos + Centre_Lens_Position_Correction; % Offsets found as the extra length due to the error
%% Lens Position Adjust
syms LensPosition
LensPosition_Adjusted = LensPosition - dPosition;

%% Error Calculation
    %% Centre
syms eOW eH eW eD eLipW eCaseW eLBFacePos eLensPosition
Variables = [OW H W D LipW CaseW LBFacePos LensPosition; eOW eH eW eD eLipW eCaseW eLBFacePos eLensPosition];
ePositionsq = 0;
for i = 1:length(Variables)
    eParticipation = (diff(LensPosition_Adjusted,Variables(1,i))*Variables(2,i))^2;
    ePositionsq = ePositionsq+eParticipation;
end
eLensPosition_Adjusted = sqrt(ePositionsq);
    %% Principal Plane
ePrincipalPlanesq = 0;
for i = 1:length(Variables)
    eParticipation = (diff(PrincipalPlane,Variables(1,i))*Variables(2,i))^2;
    ePrincipalPlanesq = ePrincipalPlanesq+eParticipation;
end
ePrincipalPlane = sqrt(ePrincipalPlanesq);

%% Evaluation
    %% Input Data
    [OW H W D n LipW CaseW LBFacePos SRail] = CorrectionMeasurements;   
    LensPosition = Pos_Lens;
    [eOW eH eW eD en eLipW eCaseW eLBFacePos ePos_Rail eSRail] = eCorrectionMeasurements;
    eLensPosition = InpError(Pos_Lens,ePos_Rail,'abs');
    
        %% Lens Correction
        Pos_LensAdj        = eval(LensPosition_Adjusted);
        ePos_LensAdj       = eval(eLensPosition_Adjusted);
        %% Principal Plane
        Pos_PPlane         = eval(PrincipalPlane);
        ePos_PPlane        = eval(ePrincipalPlane);