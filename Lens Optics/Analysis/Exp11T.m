close all
%% Equation
syms U V eU eV  
invU = 1/U;             einvU = ErrorPropagation(invU,[U;eU]);
invV = 1/V;             einvV = ErrorPropagation(invV,[V;eV]);
f = 1/(invU + invV);    ef    = ErrorPropagation(f,[U V; eU eV]);

%% Import Data
load Data_ScreenFocus.mat
[LeftPrincipal,RightPrincipal,ePrincipal] = ConvexCorrectionPP(Data_ScreenFocus(1).Reading); %Postions relative to light box
[SPos,eSPos] = ScreenCorrection([Data_ScreenFocus(2).Reading]);

%% Value Calculation 
SPos_Row   = WMeanRow(SPos,eSPos);          eSPos_Row   = eWMeanRow(eSPos);
V_Row      = SPos_Row - RightPrincipal;     eV_Row      = Quadrature(eSPos_Row,ePrincipal);    

    %% Data Reuse
    U   = [LeftPrincipal;V_Row];             eU  = [ePrincipal;eV_Row];
    V   = [V_Row;LeftPrincipal];             eV  = [eV_Row;ePrincipal];

%% Graphing
    %% Value Calculation
    invU = eval(invU);      einvU = eval(einvU);
    invV = eval(invV);      einvV = eval(einvV);
    
    %%
    GraphSettings(invU,0.005,invV,0.005);
    errorsquare(invU,einvU,invV,einvV,'default');
    LinDataFit(invU,einvU,invV,einvV);
    [a,b,alpha,p,chiopt,Cab,Calphap] = wtls_line(invU,invV,einvU,einvV,0);
    F11 = 1/b;
    eF11 = F11*(sqrt(Cab(2))/b);
    DoF = length(invU)-2;
    ReducedChisq = chiopt/DoF;
    RChiSqBounds = [1-(8/DoF)^0.5,1+(8/DoF)^0.5];
    disp([F11,eF11,NaN;RChiSqBounds(1),ReducedChisq,RChiSqBounds(2)]);