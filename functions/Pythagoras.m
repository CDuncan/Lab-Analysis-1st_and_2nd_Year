function [ output ] = Pythagoras(A,BorHypot,ABorAH)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
switch ABorAH
    case 'AB'
    	output = (A^2 + BorHypot^2)^0.5;
    case 'AH'
    	output = (BorHypot^2 - A^2)^0.5;
end

end

