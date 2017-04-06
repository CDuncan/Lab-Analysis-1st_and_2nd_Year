function [XLim,YLim] = LimSet(X,intervalX,Y,intervalY)
% Sets bounds

% Min
XMin		= min(X);
XMinRound	= floor(XMin);
XTest		= XMinRound;
while XTest<XMin;
	XTest	= XTest + intervalX;
end
XMin		= XTest-intervalX;


% Max
XMax		= max(X);
XMaxRound	= ceil(XMax);
XTest		= XMaxRound;
while XTest>XMax
	XTest	= XTest - intervalX;
end
XMax		= XTest+intervalX;


switch nargin
	case 4
		[YLim,Placeholder] = LimSet(Y,intervalY);
	case 2
        	YLim = [0,0];
end

XLim = [XMin,XMax];
end
