LensMakers
close all; clc; clearvars -except TW W r PrincAx;




TW    = TW*1000;        %Total Width
W     = W*1000;         %Edge Width
D     = (TW-W)/2;       %Depth   
r   = r*1000;           %Curve Radius
PrincAx = PrincAx*1000; %Bulge to Principal Axis    
[XP,YP,ZP] = sphere(200); XP = XP.*r; YP=YP.*r; ZP=ZP.*r;
surf(XP,YP,ZP);
 b = r-D; h = D;
%% Get radius 
R = sqrt(XP.^2+YP.^2) ;
XP1 = XP ; YP1 = YP ; ZP1 = ZP ;
XP1(ZP<r/2) = NaN ; YP1(ZP<r/2) = NaN ; ZP1(ZP<r/2) = NaN ; 
XP1(ZP<b) = NaN ; YP1(ZP<b) = NaN ; ZP1(ZP<b) = NaN ; 
ZP1 = ZP1 + (W/2) - min(ZP1(:));

surf(ZP1,XP1,YP1,'FaceAlpha',0.3,'FaceColor','c','EdgeAlpha',0);
hold
surf(-ZP1,XP1,YP1,'FaceAlpha',0.3,'FaceColor','c','EdgeAlpha',0);
%%
[xc,yc,z] = cylinder(200); xc = 51.5*xc/400; yc = 51.5*yc/400;
zc = (z-0.5).*3.23; 
hcylinder = surf(zc,xc,yc,'FaceAlpha',0.3,'FaceColor','b','EdgeAlpha',0.002);
up = (z*0.00001)+(3.23/2);
hcylinder = surf(up,xc,yc,'FaceAlpha',0.1,'FaceColor','g');
hcylinder = surf(-up,xc,yc,'FaceAlpha',0.1,'FaceColor','g');
ax = gca;
ax.XLim   	= [-30,30]; ax.XMinorGrid   	= 'on'; ax.XMinorTick   	= 'on';
ax.YLim   	= [-30,30]; ax.YMinorGrid   	= 'on'; ax.YMinorTick   	= 'on';
ax.ZLim   	= [-30,30]; ax.ZMinorGrid   	= 'on'; ax.XMinorTick   	= 'on';

PrinciplePlanePos = zeros(size(up))+D-PrincAx;
PrinciplePlaneNeg = -PrinciplePlanePos;
C = ones(size(up));
patch(PrinciplePlanePos(:),xc(:),yc(:),C(:),'FaceAlpha',0.3);
patch(PrinciplePlaneNeg(:),xc(:),yc(:),C(:),'FaceAlpha',0.3);
view(45, 22.5);


%Magnification illustration
if 1 == 0
ax.XLim   	= [-3500,1750]; ax.XMinorGrid   	= 'on'; ax.XMinorTick   	= 'on';
ax.YLim   	= [-260,260]; ax.YMinorGrid   	= 'on'; ax.YMinorTick   	= 'on';
ax.ZLim   	= [-260,260]; ax.ZMinorGrid   	= 'on'; ax.XMinorTick   	= 'on';

patch([150,150,150,150]*10,[5,5,-5,-5],[10,-10,-10,10],[1,1,1,1])
patch([-300,-300,-300,-300]*10,[5,5,-5,-5],[20,-20,-20,20],[1,1,1,1])
end