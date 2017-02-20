function errorsquare(X,eX,Y,eY,Size)
% For errors in both x and y a rectangle is drawn containing the region of possible values given one SD 

ax = gca;
hold;
for A = 1:length(X)
    pX = [X(A)+eX(A),X(A)-eX(A),X(A)-eX(A),X(A)+eX(A)];
    pY = [Y(A)+eY(A),Y(A)+eY(A),Y(A)-eY(A),Y(A)-eY(A)];
    patch(pX,pY,'or','FaceAlpha',0.3);
end
switch Size
	case 'default'
		scatter(X,Y,'b.');
	otherwise
		scatter(X,Y,Size,'b.');
end
end
