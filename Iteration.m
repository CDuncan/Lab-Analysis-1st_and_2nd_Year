%----------------------------------------------------
% Callum Duncan 2017-01-29
% University of Manchester
%----------------------------------------------------
% Calcuates L value, Error, Chi Squared
% Finds how close an acceptable fit is
% Gives L value, Error, Chi, Iterations for found fit
%----------------------------------------------------
% Hopefully USA still exists when you read this SWEATSTINY



%-----------------------
% Options
%-----------------------    
% Iterations             T,  I,  V, Pa, Pt,  Q
Mod         = ModConst(  0,  0,  0,  0,  0,  0);
% Data Set
load('Raw 2.mat');

%-----------------------
% Constants
%-----------------------
M           = SIConv(28.0134,'milli');
R           = 8.3144598;

%-----------------------
% Experimental Readings
%-----------------------
% Temperature
T_rec       = 21.1;
T           = SIConv(T_rec,'celcius');
eT          = 5;
% Current
I           = SIConv(I_rec,'milli');
eI_free     = InpError(I,0.003,'pc');
eI          = InpError(eI_free,0.003,'min');
% Voltage
V           = V_rec;
eV_free     = InpError(V,0.001,'pc');
eV          = InpError(eV_free,0.01,'min');
% Pressure
P_atmos_rec = 1016.5;
P_atmos 	= SIConv(P_atmos_rec,'hecto');
eP_atmos_rec= 1;
eP_atmos 	= SIConv(eP_atmos_rec,'hecto');
%
P_tube 		= SIConv(P_tube_rec,'hecto');
eP_tube_rec	= 0.03;
eP_tube 	= SIConv(eP_tube_rec,'hecto');
% Flow
Q_rec_sec   = SIConv(Q_rec,'/minute');
Q           = SIConv(Q_rec_sec,'litre');
eQ_free     = InpError(Q,0.03,'pc');
eQ          = InpError(eQ_free,0.01/60000,'min');


%-----------------------
% Derived Values
%-----------------------
% Power
IV          = I.*V;
eIV         = CombiError(I,eI,V,eV,'*');
eIV(1,1)    = 0;
% Combined Pressure
P           = P_tube + P_atmos;
eP          = CombiError(P_tube,eP_tube,P_atmos,eP_atmos,'+');
% Pressure Flow
PQ          = P.*Q;
ePQ         = CombiError(P,eP,Q,eQ,'*');
PQ_wm       = WMean(PQ,ePQ);
ePQ_wm      = eWMean(ePQ);


%-----------------------
% Outputs
%-----------------------
Table       = TabledChi(IV,eIV,PQ_wm,ePQ_wm);
L_base      = [(R.*T./(M.*(Table{1,2}))),((eT.^2.*R.^2)/((Table{1,2}).^2.*M.^2) + ((Table{1,3}).^2.*R.^2.*T.^2)/((Table{1,2}).^4.*M.^2)).^(1/2)];
L           = SIConv(L_base,'milli');
L_ini       = L;
SDs         = ((L(1,1)-200)./L(1,2));
SDs_ini     = SDs;


%-----------------------
% Iteration
%-----------------------    
i=0;

while and((abs(SDs)>3),~(sum(Mod)-6==0))
    eT 		= eT 		*Mod(1);
	eI 		= eI 		*Mod(2);
	eV 		= eV 		*Mod(3);
	eP_atmos= eP_atmos 	*Mod(4);
	eP_tube	= eP_tube 	*Mod(5);
	eQ 		= eQ 		*Mod(6);
% Derived Values
	eIV 	= CombiError(I,eI,V,eV,'*');
	eIV(1,1)= 0;
	eP 		= CombiError(P_tube,eP_tube,P_atmos,eP_atmos,'+');
	ePQ		= CombiError(P,eP,Q,eQ,'*');
	PQ_wm	= WMean(PQ,ePQ);
	ePQ_wm	= eWMean(ePQ);
% Outputs
	Table 	= TabledChi(IV,eIV,PQ_wm,ePQ_wm);
	L_base	= [(R.*T./(M.*(Table{1,2}))),((eT.^2.*R.^2)/((Table{1,2}).^2.*M.^2) + ((Table{1,3}).^2.*R.^2.*T.^2)/((Table{1,2}).^4.*M.^2)).^(1/2)];
	L 		= SIConv(L_base,'milli');
	SDs 	= (L(1,1)-200)./L(1,2);
% Iteration Counter
    i 		= i+1;
end
if ~(sum(Mod)-6==0)  
    fprintf('\nCycles = %.0f   Factor = %.2f \n\n', i , 1.001.^i)
end
fprintf('L = %.1f±%.0f kJ/kg  %.1f SDs \n', L(1,1) , L(1,2), (L(1,1)-200)./L(1,2))
fprintf('Chisq %f < %f < %f \n',1-(8/(numel(I)-2)).^0.5, (Table{1,6})./(numel(I)-2) ,1+(8/(numel(I)-2)).^0.5)