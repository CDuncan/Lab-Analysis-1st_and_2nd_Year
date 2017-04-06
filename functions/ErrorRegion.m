function ErrorRegion(X,eX,Y,eY)
% For errors in both x and y a rectangle is drawn containing the region of possible values given one SD 

%% Setup Graph Settings
SetGraph
hold on;

	%% Patches Plotting
    for A = 1:length(X)
        pX  = X(A)+[eX(A), -eX(A), -eX(A),  eX(A)];
        pY  = Y(A)+[eY(A),  eY(A), -eY(A), -eY(A)];
        Box = patch(pX,pY,'or','FaceAlpha',0.3);
    end
    
    %% Point Plotting
    scatter(X,Y,'b.');

end
