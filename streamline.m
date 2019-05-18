%streamlines

%Eq streamline forma circular
%polar
%psi=U·sin(theta)·(r-R^2/r);    psi:    Linea de flujo en m2/s
%                               U:      velocidad en m/s
%                               R:      Radio en m
%Cartesiana
%psi=U·y·(1-R^2/(x^2+y^2));     

U=5;R=0.2;
theta=(15:165)*pi/180;
radios=zeros(length(theta));
psi=-5:5;
syms var positive;
for p=1:length(psi)
for t=1:length(theta)
    solve(psi(p)==U*sin(theta(t))*(var-R^2/var),var);
    radios(t)=double(ans);
    %disp(t)
end
end
