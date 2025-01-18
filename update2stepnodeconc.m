function concP=update2stepnodeconc(nP,concP)
 concPaux=zeros(1,nP);
   for iv=concP
       ivm1=mod(iv-2,nP)+1; % index of the previous vertex
       ivp1=mod(iv,nP)+1;    % index of the next vertex
       concPaux(iv)=iv;
       concPaux(ivp1)=ivp1; concPaux(ivm1)=ivm1;
   end
   concP=find(concPaux);
end
