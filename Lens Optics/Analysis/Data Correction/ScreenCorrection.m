function [Pos_ScreenAdj,ePos_ScreenAdj] = ScreenCorrection(Pos_Screen)
%% Screen Position Offset Correction
syms LBFacePos SRail
dPosition = LBFacePos - SRail; % Offsets found as the extra length due to the error
%% Lens Position Adjust
syms ScreenPosition
ScreenPosition_Adjusted = ScreenPosition - dPosition;

%% Error Calculation
syms eLBFacePos eSRail eScreenPosition
Variables = [LBFacePos SRail ScreenPosition; eLBFacePos eSRail eScreenPosition];
ePositionsq = 0;
for i = 1:length(Variables)
    eParticipation = (diff(ScreenPosition_Adjusted,Variables(1,i))*Variables(2,i))^2;
    ePositionsq = ePositionsq+eParticipation;
end
eScreenPosition_Adjusted = sqrt(ePositionsq);
%% Evaluation
    %% Input Data
    [OW H W D n LipW CaseW LBFacePos SRail] = CorrectionMeasurements;
    ScreenPosition = Pos_Screen;
    [eOW eH eW eD en eLipW eCaseW eLBFacePos ePos_Rail eSRail] = eCorrectionMeasurements;
    eScreenPosition = InpError(Pos_Screen,ePos_Rail,'abs');

    %% 
    Pos_ScreenAdj           = eval(ScreenPosition_Adjusted);
    ePos_ScreenAdj          = eval(eScreenPosition_Adjusted);
