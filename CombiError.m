function [ output ] = CombiError(A,eA,B,eB,type)
%Takes errors from two variables to give combined error of new variable

switch nargin
	case 3
		output = CombiError(0,eA,0,eB,type)
end

switch type
	case {'*' '/'}
		eA_pc	= eA./A;
		eB_pc	= eB./B;
		C		= ( eA_pc.^2 + eB_pc.^2 ).^0.5;
		output	= (A.*B).*C;
	case {'+' '-'}
		output	= (eA.^2 + eB.^2).^0.5;
end
