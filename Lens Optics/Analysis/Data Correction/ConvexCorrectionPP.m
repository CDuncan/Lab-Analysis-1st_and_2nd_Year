function [LeftPrincipal,RightPrincipal,ePrincipal] = ConvexCorrectionPP(Pos_Lens)
%% Variables
syms D W H n OW CaseW LipW LBFacePos LensPosition
syms eD eW eH en eOW eCaseW eLipW eLBFacePos eLensPosition
%% Geometric Properties
    %% Lens Curvature Radius
    R   = ((D - W)/4) + ((H^2) /( 4*(D - W)));
    
    %% Lens Centre to Left Principal Plane
    invf            = (n-1)*(2/R - W*(n-1)/(n*R^2));
    LeftFaceToPP    = D*(n-1)/(R*n*invf);
    PrincipalPlane  = (D-W)/2 - LeftFaceToPP;
 
    
%% Lens Reading to Lens Centre
    %% Holder Lip to Lens Centre
    r = OW/2;
    AB = R+r;
    BC = H/2 - r;
    CA = Pythagoras(BC,AB,'AH');
    EA = CA - (R - (D-W)/2);
    
    Lip_to_Centre = r + EA + W/2;    
        
    %% Lens Reading to Lip to Centre
    Lens2Lip = CaseW - LipW;
    Centre_Lens_Position_Correction = Lens2Lip - Lip_to_Centre; 
    
    
%% Total Recorded Position Overshoot to Centre Lens
dPosition   = LBFacePos + Centre_Lens_Position_Correction; % Offsets found as the extra length due to the error

        
%% Lens Position Adjust
    %% To Centre
    LensPosition_Adjusted = LensPosition - dPosition;
    
    %% To Principal Plane
    LensPrincipal_Left    = LensPosition_Adjusted - PrincipalPlane;
    LensPrincipal_Right   = LensPosition_Adjusted + PrincipalPlane;
    
    
%% Defining Uncertainty
Variables       = [D W H n OW CaseW LipW LBFacePos LensPosition;eD eW eH en eOW eCaseW eLipW eLBFacePos eLensPosition];
eLensPrincipal  = ErrorPropagation(LensPrincipal_Left,Variables);
    
%% Data Injection
[OW H W D n LipW CaseW LBFacePos SRail]                     = CorrectionMeasurements;   
[eOW eH eW eD en eLipW eCaseW eLBFacePos ePos_Rail eSRail]  = eCorrectionMeasurements;
LensPosition = Pos_Lens;
eLensPosition = InpError(Pos_Lens,ePos_Rail,'abs');

%% Evaluation
LeftPrincipal   = eval(LensPrincipal_Left);
RightPrincipal  = eval(LensPrincipal_Right);
ePrincipal      = eval(eLensPrincipal);