function [xu, yu]=intersect(xa, ya, xb,yb, xs,ys,xt,yt)
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
end
