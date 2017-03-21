%RecordedVals
% Format XX°YY.Y?

% Central line
%~~~~~~~~~~~~~~~~~~
LeftEdgeD               = [86,266];
LeftEdgeAM              = [35,35];
RightEdgeD              = [86,266];
RightEdgeAM             = [31,31];
CentreL                 = LeftEdgeD+LeftEdgeAM./60; %Left Edge Position
CentreR                 = RightEdgeD+RightEdgeAM./60; %Right Edge Position
Centre                  = (CentreL+CentreR)./2;
clearvars -except Centre a


%Red
%~~~~~~~~~~~~~~~~~~
%Left
LLeftEdge_degrees       = [89,269;92,272;95,275];
LLeftEdge_minutes       = [30.5,30.5;33,33;32,32];
LRightEdge_degrees      = [89,269;92,272;95,275];
LRightEdge_minutes      = [28,28;27,27;27,27];
%Right
RLeftEdge_degrees       = [83,263;80,260;77,257];
RLeftEdge_minutes       = [38,38;38,38;41,41];
RRightEdge_degrees      = [83,263;80,260;77,257];
RRightEdge_minutes      = [33,33.5;33.5,33.5;38,38];
%Combining
RedLeft                 = LineCentres(LLeftEdge_degrees,LLeftEdge_minutes,LRightEdge_degrees,LRightEdge_minutes);
RedRight                = LineCentres(RLeftEdge_degrees,RLeftEdge_minutes,RRightEdge_degrees,RRightEdge_minutes);
clearvars -except Centre a RedLeft RedRight

if 1 == 0
%Blue-Green
%~~~~~~~~~~~~~~~~~~
LLeftEdge_degrees       = [];
LLeftEdge_minutes       = [];
LRightEdge_degrees      = [];
LRightEdge_minutes      = [];
%Right
RLeftEdge_degrees       = [];
RLeftEdge_minutes       = [];
RRightEdge_degrees      = [];
RRightEdge_minutes      = [];
%Combining
BGLeft                  = LineCentres(LLeftEdge_degrees,LLeftEdge_minutes,LRightEdge_degrees,LRightEdge_minutes);
BGRight                 = LineCentres(RLeftEdge_degrees,RLeftEdge_minutes,RRightEdge_degrees,RRightEdge_minutes);
clearvars -except Centre a RedLeft RedRight BGLeft BGRight
end

if 1 == 0
%Blue
%~~~~~~~~~~~~~~~~~~
LLeftEdge_degrees       = [];
LLeftEdge_minutes       = [];
LRightEdge_degrees      = [];
LRightEdge_minutes      = [];
%Right
RLeftEdge_degrees       = [];
RLeftEdge_minutes       = [];
RRightEdge_degrees      = [];
RRightEdge_minutes      = [];
%Combining
BlueLeft                = LineCentres(LLeftEdge_degrees,LLeftEdge_minutes,LRightEdge_degrees,LRightEdge_minutes);
BlueRight               = LineCentres(RLeftEdge_degrees,RLeftEdge_minutes,RRightEdge_degrees,RRightEdge_minutes);
clearvars -except Centre a RedLeft RedRight BGLeft BGRight BlueLeft BlueRight
end
