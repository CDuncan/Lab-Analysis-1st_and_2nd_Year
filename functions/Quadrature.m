function [ output ] = Quadrature(A,B,C,D,E)
%Combines values in quadrature F^2 = A^2 + B^2 + C^2 + D^2 + E^2

Flag = 0;
switch nargin
	case 5
		Fsq	= A.^2 + B.^2 + C.^2 + D.^2 + E.^2;
	case 4
		Fsq	= A.^2 + B.^2 + C.^2 + D.^2;
	case 3
		Fsq	= A.^2 + B.^2 + C.^2;
	case 2
		Fsq	= A.^2 + B.^2;
	otherwise
		Flag	= 1;
end

switch Flag
	case 0
		output = Fsq.^0.5;
	case 1
		disp('Needs 2 to 5 inputs');
end
