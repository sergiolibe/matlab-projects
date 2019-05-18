function dxdt=pendulo(t,x)
L=1;
g=9.81;
theta=x(1);
gamma=x(2);
dtheta=gamma;
dgamma=-g/L*sin(theta);
dxdt=zeros(2,1);
dxdt(1)=dtheta;
dxdt(2)=dgamma;
end