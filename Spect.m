%Inputs
LPI = 2000;
invInch2invMetre = 39.3701;
a = 1./(LPI*invInch2invMetre); %Line Spacing

SpectData
%Red
LambdaL             = [LambdafromAngle(a,RedLeft,Centre)];
LambdaR             = [LambdafromAngle(a,RedRight,Centre)];
RedLambda           = [LambdaL,LambdaR];

if 1 == 0
%Blue-Green
LambdaL             = [LambdafromAngle(a,BGLeft,Centre)];
LambdaR             = [LambdafromAngle(a,BGRight,Centre)];
BGLambda            = [LambdaL,LambdaR];
end

if 1 == 0
%Blue
LambdaL             = [LambdafromAngle(a,BlueLeft,Centre)];
LambdaR             = [LambdafromAngle(a,BlueRight,Centre)];
BlueLambda          = [LambdaL,LambdaR];
end
