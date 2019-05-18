I=6083.33;E=2.1e6;
P=4500;a=0.6;b=0.3;
M=P*b;
angM=M*a/(3*I);

ya=zeros(92);yb=ya;
xa=0:0.01:a;
xa=[xa zeros(1,31)];
ya=((M.*xa)/(6*a)).*(1-xa.^2/a^2)./(E*I);

xb=0:0.01:b;
xb=[zeros(1,61) xb];
yb=-(angM.*xb+(P*xb.^2/6).*(3*b-xb)./(E*I));

xab=0:0.01:(a+b+0.01);
plot(xab,ya);hold on;plot(xab,yb,'r');
