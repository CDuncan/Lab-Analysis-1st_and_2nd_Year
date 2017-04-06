function [ WM,eWM ] = WeightedMean(a,ea)
% Weighted Mean
%% Calculating Useful Variables
X = a./(ea.^2); % A over Square Error
Y = 1./(ea.^2); % 1 over Square Error

%% Sums
    %% Weighted Mean
    WM = sum(X,2)./sum(Y,2); % Sum along rows of X over sum along rows of Y 
    
    %% Error on Weighted Mean
    eWM = sqrt(1./sum(Y,2)); % 1 over sum along rows of Y 

end