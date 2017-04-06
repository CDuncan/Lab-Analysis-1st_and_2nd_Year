close all
%% Equation
syms U D eU eD
f = U - (U.^2)./D;    ef = ErrorPropagation(f,[U D; eU eD]);

%% Import Data
load Data_ScreenFocus.mat
[LeftPrincipal,RightPrincipal,ePrincipal]        = ConvexCorrectionPP([Data_ScreenFocus(1).Reading]); %Postions relative to light box
[SPos,eSPos] = ScreenCorrection([Data_ScreenFocus(2).Reading]);
TwoPrince =  RightPrincipal - LeftPrincipal;
SPos = SPos - mean(TwoPrince);
%% Value Calculation 

D_Row       = WMeanRow(SPos,eSPos);     eD_Row      = eWMeanRow(eSPos);
V_Row       = D_Row - LeftPrincipal;    eV_Row      = Quadrature(eD_Row,ePrincipal);    

    %% Data Reuse
    U   = [LeftPrincipal;V_Row];                eU  = [ePrincipal;eV_Row];
    D   = [D_Row;D_Row];                        eD  = [eD_Row;eD_Row];
    
%% Calculate
f = eval(f);        ef = eval(ef);
f = f(:).';         ef = ef(:).';
F3 = WMean(f,ef);   eF3 = eWMean(ef);

%% Evaluate
Chisq = 0;
for i = 1:length(f)
R = ((F3-f(i))./eF3).^2;
Chisq = Chisq + R;
end
ReducedChisq = Chisq/length(f);
RChiSqBounds = [1-(8/length(f))^0.5,1+(8/length(f))^0.5];


%% Graphing
GraphSettings(U,0.1,D,0.5);
errorsquare(U,eU,D,eD,'default');

ft = fittype('(x.^2)./(x+b)');
line = fit(U,D,ft);
fitting = plot(line);
fline = abs(coeffvalues(line));
efline = std(f);
String = sprintf('x^2 / (x - %3f)',fline);
legend(fitting, String);

Chisq = 0;
DoF = length(f)-1;
for i = 1:length(f)
R = ((fline-f(i))./efline).^2;
Chisq = Chisq + R;
end
ReducedChisq = Chisq/DoF;
RChiSqBounds = [1-(8/DoF)^0.5,1+(8/DoF)^0.5];

disp([fline,efline,NaN;RChiSqBounds(1),ReducedChisq,RChiSqBounds(2)])