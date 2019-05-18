clc;clear all;close all;clc;
A4=0:90;A2=zeros(size(A4));A3=A2;FC=pi/180;
r1=20;r2=;r4=r3=10;

A2implicit=@(x,y)r2+2500-20*(10*sqrt(17)*cosd(y)+50*sind(x))+2*50*10*sqrt(17)*sind(x-y);
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
close all;clc
ax=-10;
ay=-10;
P2x=10*sqrt(17).*cosd(90-A2);
P2y=-10+10*sqrt(17).*sind(90-A2);
extensionL12=sqrt((ax-P2x).^2+(ay-P2y).^2);
plot(A4,extensionL12)
max(extensionL12)-min(extensionL12)