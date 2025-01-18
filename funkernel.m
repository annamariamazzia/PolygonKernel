function [kernx,kerny,kernP,areak]=funkernel(xvert,yvert)
% function [kernx,kerny,kernP]=funkernel(xvert,yvert)
% input: xvert, yvert  - coordinates of the polygon
% output: kernx, kerny - coordindates of the kernel points
%         kernP  - list of kernel points 
%                  (if not empty)
nP=length(xvert); vert=1:nP;
kernP=vert; kernx=xvert(vert); kerny=yvert(vert);
convconcvert=zeros(1,nP);
for iv=1:nP 
    convconcvert(iv)=concorconvnode(nP,xvert,yvert,iv);
end
concP=updatenodeconc(nP,convconcvert);
   fprintf(1,'numero concPprima = %i \n', length(concP));
if ~isempty(concP)
  kernP1=kernP;  kernx1=kernx; kerny1=kerny;
  index=nP; p=vert;
  concP=update2stepnodeconc(nP,concP); 
 fprintf(1,'numero concPdopo = %i \n', length(concP));
  %%%%%%
  for iv=concP
    if ~isempty(kernP)
      [xvi, yvi, xvim1, yvim1, xvip1, yvip1]=xycoord(nP,xvert,yvert,iv);
      i=1; ind=i; lk=length(kernP);
      while i<=lk
         s=kernP(i); ii=find(kernP1==s);
         takenyes=0; pold=[];
         if  s~=iv
           indsp1=mod(i,lk)+1;
           iindp1=mod(ii,length(kernP1))+1;
           xs=kernx(i);
           ys=kerny(i);
           xsp1=kernx(indsp1);
           ysp1=kerny(indsp1);
           sarea1=orientation([xvim1 xvi xs],[yvim1 yvi ys]);
           sarea2=orientation([xvim1 xvi xsp1],[yvim1 yvi ysp1]);
           if sarea1==-sarea2 && sarea1~=0 
              [xu, yu]=intersectline(xvim1, yvim1, xvi,yvi,xs,ys,xsp1,ysp1);
              index=index+1; 
              p(index)=index;
              takenyes=1; pold=index;
              [kernP1,kernx1,kerny1,ii,iindp1]=updatekernel(ii,indsp1,...
                    iindp1,p(index),kernP1,kernx1,kerny1,xu,yu); 
            end 
            sarea3=orientation([xvi xvip1 xs],[yvi yvip1 ys]);
            sarea4=orientation([xvi xvip1 xsp1],[yvi yvip1 ysp1]);
            if sarea3==-sarea4 && sarea3~=0  && ...
                     (takenyes==0 || sarea1~=sarea3)
               [xu, yu]=intersectline(xvi, yvi, xvip1,yvip1,xs,ys,xsp1,ysp1);
                index=index+1; 
                p(index)=index;
               [kernP1,kernx1,kerny1]=updatekernel(ii,indsp1,...
                  iindp1,p(index),kernP1,kernx1,kerny1,xu,yu,pold,takenyes); 
             end
             if (sarea1==-1 || sarea3==-1) 
               [kernP1,indi]=setdiff(kernP1, s,'stable');
               kernx1=kernx1(indi);
               kerny1=kerny1(indi);
             end
             i=i+1; ind=ind+1;
         else %if s==iv
             i=i+1; ind=i;
         end % end of if-statement on s
      end  % end of while loop
       kernP=kernP1;
       kernx=kernx1;
       kerny=kerny1;
       figure(1)
%        plot([kernx,kernx(1)],[kerny,kerny(1)],'--')
%        fprintf(1,'%i \n', kernP)
%        fprintf(1,'------\n')
    end % end of if-statement on kernP
  end % end of for loop
end % end of if-statement on concP
%%%%%% final checks
% computation of the kernel area  
% If the points lie are on the same line  areak=0
if isempty(kernx)
         areak=0;
 else
 area_components=kernx.*kerny([2:end,1]) - ...
                      kernx([2:end,1]).*kerny;
 areak= 0.5*sum((area_components));
end
if abs(areak)<=1e-10
    areak=0; kernx=[]; kerny=[];
end
end
                    

                    
