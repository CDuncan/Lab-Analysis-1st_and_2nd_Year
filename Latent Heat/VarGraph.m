%----------------------------------------------------
% Callum Duncan 2017-02-06
% University of Manchester
%----------------------------------------------------
%Variance Analysis

%-----------------------
% Variance 1
%-----------------------
% Data Set
load('Raw 1.mat');
% Voltage
V1           = V_rec;
I1           = SIConv(I_rec,'milli');
IV1          = I1.*V1;
% Flow
Q_rec_sec   = SIConv(Q_rec,'/minute');
Q           = SIConv(Q_rec_sec,'litre');
var1        = var(Q);
%-----------------------
% Variance 2
%-----------------------
% Data Set
load('Raw 2.mat');
% Voltage
V2           = V_rec;
I2           = SIConv(I_rec,'milli');
IV2          = I2.*V2;

% Flow
Q_rec_sec   = SIConv(Q_rec,'/minute');
Q           = SIConv(Q_rec_sec,'litre');
var2        = var(Q);

%-----------------------
% Plot
%-----------------------
scatter(IV1,var1,'p');
hold;
scatter(IV2,var2,'b');

%Plot settings
ax = gca;
ax.Box = 'off';
ax.TickDir = 'out';
ax.TickLength = [0.01 0.035];
%
ax.XGrid = 'on';
ax.XMinorGrid = 'on';
ax.XMinorTick = 'on';
%
ax.YAxisLocation = 'origin';
ax.YGrid = 'on';
ax.YMinorGrid = 'on';
ax.YMinorTick = 'on';
%
