function [Structure] = LinFit(X,eX,Y,eY)

%% WTLS Fitting
[a,b,alpha,p,chiopt,Cab,Calphap] = wtls_line(X,Y,eX,eY,0);

        %% Fit Evaluation
            %% Constants
            Gradient = a;                   eGradient = sqrt(Cab(1));
            YIntcpt  = b;                   eYIntcpt  = sqrt(Cab(2));
            
            %% Goodness
            DoF = length(invU)-2;
            ReducedChisq = chiopt/DoF;
            RChiSqBounds = [1-(8/DoF)^0.5,1+(8/DoF)^0.5];
            
        %% Data Export
        field1 = 'Gradient';                value1 = [Gradient,eGradient];
        field2 = 'Intercept';               value2 = [YIntcpt,eYIntcpt];
        field3 = 'Reduced Chi Squared';     value3 = [ReducedChisq,NaN];
        field4 = 'RChi Squared Bounds';     value4 = [RChiSqBounds];
        
        Structure = struct(field1,value1,field2,value2,field3,value3,field4,value4);

%% Graph Fit            
f = fittype('a*x+b');
String = sprintf('%.4fx + %.4f',a,b);
LoBF = cfit(f,a,b);
linfit = plot(LoBF);
legend(linfit, String);


end