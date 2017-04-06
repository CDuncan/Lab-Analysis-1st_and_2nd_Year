
close all
%% Equation
syms U1 U2 eU1 eU2
D = U1+U2;
d = U2-U1;
f = (D^2 - d^2)/(4*D);  ef = ErrorPropagation(f,[U1 U2; eU1 eU2]);

%% Import Data
load Data_Displacement.mat
%[SPos,eSPos]   = ScreenCorrection([Data_Displacement(1).Reading]); 
[U1,eU1]        = ConvexCorrection([Data_Displacement(2).Reading]); %Postions relative to light box
[U2,eU2]        = ConvexCorrection([Data_Displacement(3).Reading]); 

%% Calculate
f = eval(f);    ef = eval(ef);
f = f(:);       ef = ef(:);
F2 = WMean(f,ef);   eF2 = eWMean(ef);

%% Evaluate
Chisq = 0;
for i = 1:length(f)
R = ((F2-f(i))./ef(i)).^2;
Chisq = Chisq + R;
end
ReducedChisq = Chisq/length(f);
RChiSqBounds = [1-(8/length(f))^0.5,1+(8/length(f))^0.5];

disp([F2,eF2;NaN,ReducedChisq;RChiSqBounds])