function [kernP1,kernx1,kerny1,ii,iindp1]=updatekern(ii,indsp1,iindp1,p,kernP1,kernx1,kerny1,xu,yu)  
% function [kernP1,kernx1,kerny1,ii,iindp1]=updatekern(ii,indsp1,iindp1,p,kernP1,kernx1,kerny1,xu,yu)  
% input:   ii: index corresponding to the position of point x_s in kernp1
%          index: variable corresponding to the index of the new point
%          that is inserted in the kernel
%          indsp1: index corresponding to the position of point x_(s+1)
%          in kernp
%          iindp1: index corresponding to the position of next point 
%          labeled as ii, in kernp1 (at the beginning, iindp1 gives
%          the position of x_(s+1)
%          p: variable corresponding to the index of the new point
%          that is inserted in the kernel
%          kernP1, kernx1, kerny1
%          xu,yu: coordinates of the new point inserted in the kernel
% output:  kernP1, kernx1, kerny1 updated
if indsp1==1           
       kernP1=[kernP1(1:ii), p];
       kernx1=[kernx1(1:ii),xu];
       kerny1=[kerny1(1:ii),yu];
       ii=length(kernP1); iindp1=ii+1; % update ii and iindp1
       % in case an other point will be inserted 
else
        kernP1=[kernP1(1:ii), p, kernP1(iindp1:end)];
        kernx1=[kernx1(1:ii),xu, kernx1(iindp1:end)];
        kerny1=[kerny1(1:ii),yu, kerny1(iindp1:end)];
        %  ii=length(kernP1); iindp=ii+1;
end
  end