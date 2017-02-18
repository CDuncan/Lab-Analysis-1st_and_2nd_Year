function [ output ] = eWMean(eA)
%Error for a weigted mean

B	= eA.^2;	% Square Error
C	= sum(1./B);	% Sum of Inverse Square Error
D 	= 1./C;		% Inverse Sum of Inverse Square Errors
output	= D.^0.5;
end
