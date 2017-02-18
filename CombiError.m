function [ output ] = CombiError(A,eA,B,eB,type)
%Combines percentage errors to give a pc error

switch nargin
	case 3
		output = CombiError(0,eA,0,eB,type)
end

switch type
	case {'*' '/'}
		eA_pc	= eA./A;
		eB_pc	= eB./B;
		int		= ( eA_pc.^2 + eB_pc.^2 ).^0.5;
		output	= (a.*b).*int;
	case {'+' '-'}
		output	= (eA.^2 + eB.^2).^0.5;
end
