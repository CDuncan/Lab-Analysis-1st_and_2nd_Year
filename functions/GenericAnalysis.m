close all
%% Symbols
    %% Variables
    syms A B C 
    
    %% Equation
    X = A + B;                      eX = EPropagate(X);
    Y = A - C;                      eY = EPropagate(Y);
    
%% Data Handling
    %% Importing
    load Data.mat
    [A,eA] = Zeroing(Data(1).Reading); % Range of readings as a column (Specific for each experiment)
    [B,eB] = Zeroing(Data(2).Reading); % Row of repeat readings for each value of A
    [C,eC] = Zeroing(Data(3).Reading); % Row of repeat readings for each value of A

    %% Averaging Repeats
    [B,eB] = WeightedMean(B,eB);
    [C,eC] = WeightedMean(C,eC);
    
    %% Calculating Values
    X = eval(X);                        eX = eval(eX);
    Y = eval(Y);                        eY = eval(eY);

%% Graphing
    %% Fitting
    ErrorRegion(X,eX,Y,eY);
    Structure = LinFit(X,eX,Y,eY);
    