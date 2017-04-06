function ans=linearfit(x,y)
% Linear least-squares fit and error
[p,s]=polyfit(x,y,1);
deltaf=s.normr/sqrt(s.df);
C=deltaf^2*inv(s.R)*inv(s.R)';
deltap=sqrt(diag(C));
ans = [p ; deltap'];

