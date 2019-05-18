clc;clear all;close all;clc;
syms y,A4=0:90;A2=zeros(size(A4));A3=A2;FC=pi/180;
for i=1:91;
A2(i)=vpasolve(1700+2500-20*(10*sqrt(17)*cos(y*FC)+50*sin(A4(i)*FC))+2*50*10*sqrt(17)*sin((A4(i)-y)*FC)==0,y,75);
end;

 for i=1:91;
A3(i)=vpasolve(1000-20*(50*sin(A4(i)*FC)-10*sin(y*FC))-2*50*10*cos((A4(i)-y)*FC)==0,y,[-1 190]);
end;

plot(A4,A2,'r');hold on;plot(A4,A3,'b');
legend('A2(A4)','A3(A4)')
plot(A4,A3,'b');hold off;

%modulo de vector 13
a=10.*sin(A2.*FC)./sin((90+A4-A2).*FC);

v13x=a.*cos(A4*FC);
v13y=-a.*sin(A4*FC);
%plot(v13x,v13y);

px=10*sqrt(17)*sin(A2*FC)+65*cos(A3*FC);
py=-10+10*sqrt(17)*cos(A2*FC)-65*sin(A3*FC);
%plot(px,py)

d1434=50;
d1334=50-a;
d3=15;
alpha=atan(3/4)/FC;
%F3=F*sin(alpha+A4)/2
F3=sin((alpha+A4)*FC)/2;
D4=sqrt((v13x-px).^2+(v13y-py).^2);

F4=d1434*F3*d3./(d1334.*D4);
b=zeros(size(A4));c=b;
syms w;
for i=1:91
    [b(i),c(i)]=vpasolve([-a(i)*sin(A4(i)*FC)-w*sin(A3(i)*FC)==-10+10*sqrt(17)*cos(A2(i)*FC)-65*sin(A3(i)*FC)-y*cos(A3(i)*FC),a(i)*cos(A4(i)*FC)+w*cos(A3(i)*FC)==10*sqrt(17)*sin(A2(i)*FC)+65*cos(A3(i)*FC)-y*sin(A3(i)*FC)],[w y]);
end;
F4R=d1434*F3*d3./(d1334.*b);
hold off;plot(A4,F4);hold on;plot(A4,F4R,'r');legend('F','FR')