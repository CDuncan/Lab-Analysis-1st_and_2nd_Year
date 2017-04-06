function [ output ] = InpError(a,ea,type)
% Error operations
% For a given set of values, input errors abs/pc with mins
switch type
    case 'pc'
    	output = a*ea;
    case 'abs_pc'
    	output = ea./a;
    case 'abs'
    	output = zeros(size(a))+ea;
    case 'min'
        r = a;
    	r(r < ea) = ea;
        output = r;
end
