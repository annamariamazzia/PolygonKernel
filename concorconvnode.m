function convconcvert=concorconvnode(nP,xvert,yvert,iv)
% function convconcvert=concorconvnode(nP,xvert,yvert,iv)
% input nP #of points of the polygon
%       xvert and yvert coordinates of the polygon in 
%       counterclockwise order
%       iv  vertex
% output convconcvert =1 if iv is a concave vertex
%        convconvvert=0  if iv is a convex vertex
     toll=1e-14;
    ivm1=mod(iv-2,nP)+1;
    ivp1=mod(iv,nP)+1;
    vetta=[xvert(ivp1)- xvert(iv),yvert(ivp1)- yvert(iv) ];
    vettb=[xvert(ivm1)- xvert(iv),yvert(ivm1)- yvert(iv) ];
    alpha = atan2((det([vetta;vettb])),dot(vetta,vettb)); 
    alpha = mod(alpha,2*pi);
    if alpha-pi> toll 
        convconcvert=1; %concave vertex
    else
        convconcvert=0; %convex vertex
    end  
end
