function [ output ] = InpError(A,eA,eType)
% Error operations
% For a given set of values, input errors abs/pc with mins

switch type
	case 'abs'
		output = zeros(size(A))+eA;
	case 'pc'
		output = A*eA;
	case 'abs_to_pc'
		output = eA./A;
	case 'min'
		B = A;
		B(B < eA) = eA;
		output = B;
end
