function concP=updatenodeconc(nP,convconcvert)
concP1=find(convconcvert==1); % list of the concave vertices
concP2=find(convconcvert==2); % list of collinear vertices
if length(concP2)<= nP/4
    concP=find(convconcvert>=1);
else
    concP=concP1;
end
end
