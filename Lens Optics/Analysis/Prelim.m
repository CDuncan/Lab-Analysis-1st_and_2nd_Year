%% Equation
syms U V eU eV  
f = 1./(1/U + 1/V);
ef = ErrorPropagation(f,[U V; eU eV]);
%% Import Data
U   = 8000;     eU = 500;
V   = 104.9;    eV = 4;
OW          = 3.49;     % O-Ring Width
H           = 51.5;     % Lens Height
W           = 3.23;     % Lens Rim Width
D           = 10.63;    % Lens Depth
n           = 1.489;    % Refractive Index
LipW        = 4.01;     % Lens Case Lip Width
CaseW       = 25.6;     % Lens Case Width
LBFacePos   = 151;      % Light Box Face Position
SRail       = 19;       % Screen Rail to Image

%% Calculation
CD          = (D-W)/2;    % Curve Depth   
VOvershoot  = 17-(CD+OW);
V           = V - VOvershoot;
FPre        = eval(f);
eFPre       = eval(ef);