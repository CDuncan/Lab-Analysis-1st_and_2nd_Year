function [ output ] = CombiError(A,eA,B,eB,type)
%Takes errors from two variables to give combined error of new variable

switch nargin
	case 3
		output = CombiError(0,A,0,eA,B);
	otherwise
		eA_pc	= eA./A;
		eB_pc	= eB./B;
		switch type
			case '*'
				C       = Quadrature(eA_pc, eB_pc);;
				output	= (A.*B).*C;
			case '/'
				C       = Quadrature(eA_pc, eB_pc);
				output	= (A./B).*C;
			case {'+' '-'}
				output	= Quadrature(eA, eB);
			end
end
