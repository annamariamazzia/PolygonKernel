function [xu, yu]=intersect(xa, ya, xb,yb, xs,ys,xt,yt)
%   dtr = ((xb-xa)*(yd-yc)-(yb-ya)*(xd-xc));
%      if abs(dtr)<1e-16
%          disp('linee parallele caso degenere')
%          xu=NaN; yu=NaN;
%      else
%      r=(ya-yc)*(xd-xc)-(xa-xc)*(yd-yc)/dtr;
%      s=(ya-yc)*(xb-xa)-(xa-xc)*(yb-ya)/dtr;
%        if r>=0 && r<=1 && s>=0 && s<=1
%            xu=xa+r*(xb-xa);
%            yu=ya+r*(yb-ya);
%        elseif abs(norm([xa,ya]-[xc yc])+norm([xb,yb]-[xc,yc])-norm([xa,ya]-norm([xb,yb])))<=1e-12
%            xu=xc;
%            yu=yc;
%        elseif abs(norm([xa,ya]-[xd yd])+norm([xb,yb]-[xd,yd])-norm([xa,ya]-norm([xb,yb])))<=1e-12
%            xu=xd;
%            yu=yd;
%        else
%            disp('nessun valore')
%            xu=NaN;
%            yu=NaN;
%        end
%      end
toll=1e-10;
if abs(xa-xb)>toll 
    m1=(ya-yb)/(xa-xb);
    if abs(xs-xt)>toll
        m2=(ys-yt)/(xs-xt);
        xu=(yb-yt+m2*xt-m1*xb)/(m2-m1);
        yu=m2*(xu-xt)+yt;
    else
        xu=xt;
        yu=m1*(xu-xb)+yb;
    end
else
    xu=xb;
    if abs(xs-xt)>toll
        m2=(ys-yt)/(xs-xt);
        yu=m2*(xu-xt)+yt;
    end
end
% a1=norm([xa,ya]-[xu,yu]);
% a2=norm([xb,yb]-[xu,yu]);
% a3=norm([xs,ys]-[xu,yu]);
% a4=norm([xt,yt]-[xu,yu]);
% aa=min([a1,a2,a3,a4]);
% if aa<1e-6
%     coincyes=1;
% else
%     coincyes=0;
% end
end