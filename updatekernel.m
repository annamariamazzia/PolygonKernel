function [kernP1,kernx1,kerny1,ii,iindp1]=updatekernel(ii,indsp1,iindp1,p,kernP1,kernx1,kerny1,xu,yu,pold,takenyes)  
% function [kernP1,kernx1,kerny1,ii,iindp1]=updatekern(ii,indsp1,iindp1,p,kernP1,kernx1,kerny1,xu,yu,pold,takenyes)  
% input    ii: index of x_s in kernp1
%          index: index of the new point inserted in the kernel
%          indsp1: index of x_(s+1) in kernp
%          iindp1: index of the next point labeled as ii in kernp1 
%                  (initially x_(s+1))
%          p: index of the new point inserted in the kernel
%          kernP1, kernx1, kerny1: kernel data structures
%          xu,yu: coordinates of the new point inserted in the kernel
%          pold: index of the point inserted in step (a) for the 
%                 current x_v and x_s pair
%          takenyes: flag indicating whether a point has been 
%                    inserted in step (a) (0 or 1)
%    
% output:  kernP1, kernx1, kerny1, ii,iindp1 updated
if nargin==9 || takenyes==0
if indsp1==1           
       kernP1=[kernP1(1:ii), p];
       kernx1=[kernx1(1:ii),xu];
       kerny1=[kerny1(1:ii),yu];
else
        kernP1=[kernP1(1:ii), p, kernP1(iindp1:end)];
        kernx1=[kernx1(1:ii),xu, kernx1(iindp1:end)];
        kerny1=[kerny1(1:ii),yu, kerny1(iindp1:end)];
end
elseif nargin==11 && takenyes==1
     [~,ind]=find(kernP1==pold);
     xua=kernx1(ind); yua=kerny1(ind);
     indm=ind-1; 
     nua=norm([kernx1(indm)-xua,kerny1(indm)-yua]);
     nub=norm([kernx1(indm)-xu,kerny1(indm)-yu]);
     if nub<nua && indsp1==1  
       % x_u, x_ua 
       kernP1=[kernP1(1:indm), p,pold];
       kernx1=[kernx1(1:indm),xu,xua];
       kerny1=[kerny1(1:indm),yu,yua];
     elseif nub>nua && indsp1==1  
       %  x_ua, x_u 
       kernP1=[kernP1(1:ii), p];
       kernx1=[kernx1(1:ii),xu];
       kerny1=[kerny1(1:ii),yu];
     elseif nub<nua && indsp1~=1
         %  x_u, x_ua
        kernP1=[kernP1(1:indm), p, pold, kernP1(ind+1:end)];
        kernx1=[kernx1(1:indm),xu,xua, kernx1(ind+1:end)];
        kerny1=[kerny1(1:indm),yu, yua,kerny1(ind+1:end)];
     elseif nub>nua && indsp1~=1
          %  x_ua, x_u 
         kernP1=[kernP1(1:ii), p, kernP1(iindp1)];
         kernx1=[kernx1(1:ii),xu, kernx1(iindp1)];
         kerny1=[kerny1(1:ii),yu,kerny1(iindp1)];
     end
end
ii=length(kernP1); iindp1=ii+1;
  end