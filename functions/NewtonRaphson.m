function [ x ] = NewtonRaphson( x0,Fx )
%Performs Newton Raphson on a function
%   Input starting x and the function written as a string
warning('off','all');


f	= sym(Fx);
df	= diff(f);
x	= x0+1;

while abs(x-x0)	~= 0
	x0	= x;
	x	= x0 - eval(f)/eval(df);
end

warning('on','all');
disp(sprintf('\n x ~ %f \n',x))
end
