function [eOW eH eW eD en eLipW eCaseW eLBFacePos ePos_Rail eSRail] = eCorrectionMeasurements()

eOW          = 0.01;        % O-Ring Width
eH           = 0.02;        % Lens Height
eW           = 0.01;        % Lens Rim Width
eD           = 0.01;        % Lens Depth
en           = 0.01;        % Refractive Index
eLipW        = 0.01;        % Lens Case Lip Width
eCaseW       = 0.5;         % Lens Case Width
eLBFacePos   = 1;           % Light Box Face Position
ePos_Rail    = 0.5;         % Rail Position
eSRail       = 0.5;        % Screen Rail to Image
end