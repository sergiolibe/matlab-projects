%streamlines

%Eq streamline forma circular
%polar
%psi=U·sin(theta)·(r-R^2/r);    psi:    Linea de flujo en m2/s
%                               U:      velocidad en m/s
%                               R:      Radio en m
%Cartesiana
%psi=U·y·(1-R^2/(x^2+y^2));     

U=6;R=2;
ang=0:.05:2*pi;
xcirc=R.*cos(ang);
ycirc=R.*sin(ang);

x_=-4:.25:4;
y_=zeros(size(x_));
psi=0.1:.2:1;
syms y real;

tic
for p=1:length(psi)
for t=1:length(x_)
    %disp(['t ',num2str(t),'... p ',num2str(p)])
    S=solve(psi(p)==U*y*(1-R^2/(x_(t)^2+y^2)),y);
    y_(t)=double(S);
end
plot(x_,y_,'m');hold on;
plot(x_,-y_,'b');
end
lim=[-5,5];
xlim(lim);
ylim(lim);
plot(xcirc,ycirc,'k')
axis square
toc