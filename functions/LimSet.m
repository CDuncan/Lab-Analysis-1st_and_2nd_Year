function LimSet(X,intervalX,Y,intervalY)
% Sets bounds

switch nargin
	case 4
		[YMin,YMax] = LimSet(Y,intervalY);
end

% Min
XMin		= min(X);
XMinRound	= floor(XMin);
XTest		= XMinRound;
while XTest<XMin;
XTest		= XTest + intervalX;
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


ax.XLim = [XMin,XMax];
ax.YLim = [YMin,YMax];
end
