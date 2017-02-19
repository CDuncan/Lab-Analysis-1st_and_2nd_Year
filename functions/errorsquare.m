function errorsquare(X,eX,Y,eY)
ax = gca;
hold;
for A = 1:length(X)
    pX = [X(A)+eX(A),X(A)-eX(A),X(A)-eX(A),X(A)+eX(A)];
    pY = [Y(A)+eY(A),Y(A)+eY(A),Y(A)-eY(A),Y(A)-eY(A)];
    patch(pX,pY,'or','FaceAlpha',0.3);
end
scatter(X,Y,'b.');
end