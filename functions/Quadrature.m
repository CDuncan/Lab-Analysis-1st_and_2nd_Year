function [ output ] = Quadrature(A,B,C,D,E)
%Combines values in quadrature F^2 = A^2 + B^2 + C^2 + D^2 + E^2

switch nargin
	case 5
		Fsq	= A.^2 + B.^2 + C.^2 + D.^2 + E.^2;
	case 4
		Fsq	= A.^2 + B.^2 + C.^2 + D.^2;
	case 3
		Fsq	= A.^2 + B.^2 + C.^2;
	case 2
		Fsq	= A.^2 + B.^2;
end

switch nargin
	case {0, 1}
		diff = 2 - nargin;
		error = sprintf('Needs %.0f more inputs',diff);
		disp(error);
	case {2, 3, 4, 5}
		output = Fsq.^0.5;
	otherwise
		diff = nargin - 5;
		error = sprintf('Needs %.0f less inputs',diff);
		disp(error);
end
