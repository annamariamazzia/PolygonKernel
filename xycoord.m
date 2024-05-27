function [xvi, yvi, xvim1, yvim1, xvip1, yvip1]=xycoord(nP,xvert,yvert,iv)
% function [xvim1, xvi, xvp1, yvim1, yvi, yvp1]=xycoord(nP,xvert,yvert,iv)
% input: nP  # of points of the polygon
%        xvert, yvert  coordinates of the vertices
%        iv  current vertex
% output: coordinate of the current vertex iv and of the previous and next
           ivm1=mod(iv-2,nP)+1; % index of the previous vertex
           ivp1=mod(iv,nP)+1;    % index of the next vertex
           xvi=xvert(iv);  % x-coordinate of iv
           yvi=yvert(iv);  % y-coordinate of iv
           xvim1=xvert(ivm1);  % x-coordinate of ivm1
           yvim1=yvert(ivm1);  % x-coordinate of ivm1
           xvip1=xvert(ivp1);  % x-coordinate of ivp1
           yvip1=yvert(ivp1);  % x-coordinate of ivp1
end