clc;clear all;close all;clc;
A4=0:90;A2=zeros(size(A4));A3=A2;FC=pi/180;

A2implicit=@(x,y)1700+2500-20*(10*sqrt(17)*cosd(y)+50*sind(x))+2*50*10*sqrt(17)*sind(x-y);
for i=0:90;
A2zero=@(y)A2implicit(i,y);
A2(i+1)=fzero(A2zero,75);
end;

A3implicit=@(x,y)1000-20*(50*sind(x)-10*sind(y))-2*50*10*cosd(x-y);
 for i=0:90;
A3zero=@(y)A3implicit(i,y);
A3(i+1)=fzero(A3zero,2*i);
end;

plot(A4,A2,'r');hold on;
plot(A4,A3,'b');
legend('A2(A4)','A3(A4)');
hold off;

%modulo de vector 13
a=10.*sind(A2)./sind(90+A4-A2);

v13x=a.*cosd(A4);
v13y=-a.*sind(A4);
%plot(v13x,v13y);

px=10*sqrt(17)*sind(A2)+65*cosd(A3);
py=-10+10*sqrt(17)*cosd(A2)-65*sind(A3);
%plot(px,py)

d1434=50;
d1334=50-a;
d3=15;
alpha=atan(3/4)/FC;
%F3=F*sin(alpha+A4)/2
%F3=sind(alpha+A4)/2;
F3=zeros(size(A4))+0.3;
D4=sqrt((v13x-px).^2+(v13y-py).^2);


dp00=sqrt(px.^2+py.^2);
F4=F3.*d1334./D4;
%F4=F3*50./D4;
%F4=F3*50./dp00;

%hold off;plot(A4,F4);hold on;plot(A4,F3,'r');

ang13p=atan((v13y-py)./(v13x-px))/FC;
ang13p(1:47)=ang13p(1:47)+180;
ang13p=-(ang13p-180);
Fr=F4./cosd(A3-ang13p);
plot(A4,A3,'m');hold on;plot(A4,ang13p,'k')
legend('A3','ang13p')

figure(2);
plot(A4,F4);hold on;plot(A4,F3,'r');plot(A4,Fr,'k')
legend('F4','F3','Fr')
