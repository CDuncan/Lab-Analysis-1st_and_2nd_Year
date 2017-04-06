function [ eF ] = EPropagate(Function)
% F = F(x,y,z)
% Input function, output evaluatable equation

%% Defining Variables
Vars = symvar(Function);

    %% Adding Errors to Syms
	for i = 1:length(Vars)
        evalin('base',['syms e' char(Vars(i))])
    end     
    
%% Calculation
eFsq = 0;
for i = 1:length(Vars)
    eParticipation = (diff(Function,Vars(i)).*['e' char(Vars(i))]).^2;
    eFsq = eFsq+eParticipation;
end
eF = sqrt(eFsq);
