function ori=orientation(xcoord, ycoord)
toll=eps;
xcoord=xcoord(:);
ycoord=ycoord(:);
orien=det([ones(3,1), xcoord, ycoord]);
if orien>toll 
    ori=1;  % counter-clockwise
elseif orien<-toll
    ori=-1;  %clockwise
else
    ori=0;
end
end
