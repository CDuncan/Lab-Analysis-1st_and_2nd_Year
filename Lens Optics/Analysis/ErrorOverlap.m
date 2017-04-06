clearvars;

%%
Prelim
LensMakers

%%
Exp11
Exp12

%%
Exp2

%%
Exp3

%%
close all; clearvars -except FPre FLM F11 F3 F12 F2 eFPre eFLM eF11 eF3 eF12 eF2
F = [FPre FLM F11 F3 F12 F2].';
eF = 2*[eFPre eFLM eF11 eF3 eF12 eF2].';
eF_pc = round((eF./F)*100,4);
F = round(F,2);     eF = round(eF,2);

%%
ax = gca;
ax.YLim = [90,105];
hold;
pc = (eF_pc.^0.5)*8; %Opacity variable
for i = 6:-1:1
    X = [0 1+i 1+i 0];
    Y = F(i)+[-eF(i),-eF(i),eF(i),eF(i)];
    patch(X,Y,'or','FaceAlpha',[1/(8*(eF_pc(i)^0.5))])
end
scatter([(1:6)+1]/2,F);
Bounds = [F-eF,F+eF];
RowNames = {'Prelim';'LensMaker';'invUV';'Ratio';'Magnif';'Displace'};
Output = table(F,eF,eF_pc,Bounds(:,1),Bounds(:,2),'RowNames',RowNames);
disp(Output)

