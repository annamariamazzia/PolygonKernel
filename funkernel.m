function [kernx,kerny,kernP]=funkernel(xvert,yvert)
nP=length(xvert); vert=1:nP;
kernP=vert; kernx=xvert(vert); kerny=yvert(vert);
convconcvert=zeros(1,nP);
for iv=1:nP 
    convconcvert(iv)=concorconvnode(nP,xvert,yvert,iv);
end
concP=find(convconcvert); % list of the concave vertices
if ~isempty(concP)
  kernP1=kernP;  kernx1=kernx; kerny1=kerny;
  index=nP; p=vert;
  for iv=concP
    if ~isempty(kernP)
      [xvi, yvi, xvim1, yvim1, xvip1, yvip1]=xycoord(nP,xvert,yvert,iv);
      i=1; ind=i; lk=length(kernP);
      while i<=lk
         s=kernP(i); ii=find(kernP1==s);
         takenyes=0;
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
              [xu, yu]=intersect(xvim1, yvim1, xvi,yvi,...
                                     xs,ys,xsp1,ysp1);
              index=index+1; 
              p(index)=index;
              takenyes=1;
              [kernP1,kernx1,kerny1,ii,iindp1]=updatekern(ii,indsp1,...
                    iindp1,p(index),kernP1,kernx1,kerny1,xu,yu); 
            end 
            sarea3=orientation([xvi xvip1 xs],[yvi yvip1 ys]);
            sarea4=orientation([xvi xvip1 xsp1],[yvi yvip1 ysp1]);
            if sarea3==-sarea4 && sarea3~=0  && ...
                      (takenyes==0 || sarea1~=sarea3)      
               [xu, yu]=intersect(xvi, yvi, xvip1,yvip1, ...
                                         xs,ys,xsp1,ysp1);
                index=index+1; 
                p(index)=index;
               [kernP1,kernx1,kerny1]=updatekern(ii,indsp1,...
                  iindp1,p(index),kernP1,kernx1,kerny1,xu,yu); 
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
    end % end of if-statement on kernP
  end % end of for loop
end % end of if-statement on concP
end
                    
