syms h H V eh eH eV
f = 1/((1+(h/H))/V);
ef = ErrorPropagation(f,[h H V; eh eH eV]);
m = -h/H;
em = ErrorPropagation(m,[h H V; eh eH eV]);


load Data_ScreenFocus.mat
[LPos,ePrincipal] = ConvexCorrection([Data_ScreenFocus(1).Reading]); %Postions relative to light box
[SPos,eSPos] = ScreenCorrection([Data_ScreenFocus(2).Reading]);

%% Value Calculation 
    %% Object Distance
    U_Row       = LPos;                     eU_Row      = ePrincipal;
    
    %% Image Distance 
    SPos_Row   = WMeanRow(SPos,eSPos);      eSPos_Row   = eWMeanRow(eSPos);
    V_Row          = SPos_Row - U_Row;         eV_Row   = Quadrature(eSPos_Row,eU_Row);    

    %% Image Size
    Size_Image   = Data_ScreenFocus(3).Reading;         eSize_Image   = InpError(Size_Image,2.82,'abs');
    h_Row        = WMeanRow(Size_Image,eSize_Image);    eh_Row        = eWMeanRow(eSize_Image);
    
    %% Object Size
    Size_Object     = 19;                                   eSize_Object  = 0.5;
    H_Row           = InpError(h_Row,Size_Object,'abs');    eH_Row        = InpError(H_Row,eSize_Object,'abs');
 
    %% NaN Purge
    eV_Row(isnan(H_Row)) = [];   V_Row(isnan(H_Row)) = [];
    eh_Row(isnan(H_Row)) = [];   h_Row(isnan(H_Row)) = [];
    eH_Row(isnan(H_Row)) = [];   H_Row(isnan(H_Row)) = [];
%% Calculation
V = V_Row;  eV = eV_Row;    
h = h_Row;  eh = eh_Row;     
H = H_Row;  eH = eH_Row;    

%% Graphing
m = eval(m);
em = eval(em);

GraphSettings(V,0.1,m,0.5);
errorsquare(V,eV,m,em,'default');
LinDataFit(V,eV,m,em);
[a,b,alpha,p,chiopt,Cab,Calphap] = wtls_line(V,m,eV,em,0);
F12 = -1/a;
eF12 = F12*(-sqrt(Cab(1))/a);
DoF = length(m)-2;
ReducedChisq = chiopt/DoF;
RChiSqBounds = [1-(8/DoF)^0.5,1+(8/DoF)^0.5];
disp([F12,eF12,NaN;RChiSqBounds(1),ReducedChisq,RChiSqBounds(2)]);

ax = gca;
%ax.XLim = [ax.XLim(1), 0.3275];
ax.YLim = [ax.YLim(1), -1];
ax.XAxisLocation 	= 'top';