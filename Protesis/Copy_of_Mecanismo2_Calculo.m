clc;clear;close all
%Mecanismo2_Calculo
%A3=f(A2)
%con A2o=16.4299; comenzamos el for en 16 hasta 106; 
%A2o=11.0648 con r2=52.1053
AnguloBarra3=input('Ingrese angulo inicial de de barra3 ');
a=20/sqrt(2);
r1=20;r3=20;r4=50;
fc=180/pi;
A4o=asin(a/r4)*fc;
b=r3*cosd(AnguloBarra3);
l1=50*cosd(A4o)-a+b;
l2=r3*sind(AnguloBarra3);

r2=abs(l1+i*l2);

Ang2o=angle(l1+i*l2)*fc;
disp('barra1 tierra, barra2 impulsor, barra3 seguidor, barra4 seguidor');
disp(['barra1 r1=',num2str(r1),' ang1=-135°(ctte), barra4 r4=',num2str(r4),' ang4=',num2str(A4o),'°, barra 3(acoplador) r3=20;'])
disp(['Inclinacion inicial de barra 3=-',num2str(AnguloBarra3),'°',', r2=',num2str(r2),', Angulo inicial de la Barra2= ',num2str(Ang2o),'°']);
A2o=round(Ang2o);A3prima=AnguloBarra3;
A2=A2o:(A2o+95);

A3=zeros(size(A2));A4=A3;
A3Implicit=@(x,y)r2^2-r4^2+2*a^2+r3^2-2*r2*r3*cosd(y-x)+2*a*r3*(sind(y)-cosd(y))+2*a*r2*(cosd(x)-sind(x));
for i=A2o:(A2o+95)
    A3zero=@(y)A3Implicit(i,y);
    A3(i+1-A2o)=fzero(A3zero,30+i);
end

A4Implicit=@(x,y)2*a^2-r3^2+r4^2+r2^2-2*a*r4*(cosd(y)+sind(y))+2*a*r2*(cosd(x)-sind(x))-2*r2*r4*cosd(x+y);
for i=A2o:(A2o+95)
    A4zero=@(y)A4Implicit(i,y);
    A4(i+1-A2o)=fzero(A4zero,25-i);
end


close all
subplot(1,3,1)
plot(A2,A3,'r');hold on
A3Falange=A3-A3prima;
plot(A2,A3Falange,'b');hold off
legend('\theta_3 barra','\theta_3* Falange2');
xlabel(['\theta_2, con \theta_2_o=',num2str(Ang2o)])
ylabel('\theta_3 y \theta_3*');

subplot(1,3,2)
plot(-A2,A4,'r');
legend('\theta_4');
xlabel(['\theta_2, con \theta_2_o=',num2str(Ang2o)])
ylabel('\theta_4');

if A4>0
    AngTransmision=180+A4-A3;
else
    AngTransmision=180-A4-A3;
end
subplot(1,3,3)
plot(A2,AngTransmision,'k');
legend('\theta_T_r_a_n_s_m_i_s_i_o_n');
xlabel(['\theta_2, con \theta_2_o=',num2str(Ang2o)])
ylabel('\gamma (angulo de transmision entre barras 3 y 4)');

i=0;
k=A3Falange(i+1);
while k<=179
    i=i+1;
    k=A3Falange(i);
end
disp(['estudio valido hasta Angulo2=',num2str(A2(i)),'º',' (indice',num2str(i)])
disp(['Angulo de transmision  max=',num2str(max(AngTransmision)),'º, min=',num2str(AngTransmision(i)),'º'])

p1x=-a/2;p1y=-a/2;
p2x=-a+r4.*cosd(A4)+.5*r3.*cosd(-A3);
p2y=-a+r4.*sind(A4)+.5*r3.*sind(-A3);
%figure(2);dp1p2=sqrt((p1x-p2x).^2+(p1y-p2y).^2);
%plot(A2,dp1p2)
p34x=-a+r4.*cosd(A4);
p34y=-a+r4.*sind(A4);
dop34=sqrt(p34x.^2+p34y.^2);
figure(2);subplot(2,2,1);plot(A3Falange,dop34);title('distncia perno 34 con respecto a tierra(perno 12)')
xlabel('\theta_3* Falange2')
ylabel('distancia O-34 [mm]')

p23x=r2.*cosd(-A2);
p23y=r2.*sind(-A2);
d14p23=sqrt((-a-p23x).^2+(-a-p23y).^2);
subplot(2,2,2);plot(A3Falange,d14p23);title('distncia perno 23 con respecto a tierra(perno 14)')
xlabel('\theta_3* Falange2')
ylabel('distancia 14-23 [mm]')

%distancia de origen (tierra-2, perno 12)a interseccionBarras24

do24=sind(45-A4).*r1./sind(A2+A4);
subplot(2,2,3);plot(A3Falange,do24);title('distancia perno 12 a interseccion Barras 2 y 4')
xlabel('\theta_3* Falange2')
ylabel('distancia 12-24 [mm]')
%%%
close all
plot(-A2,-A2);hold on
plot(-A2,-A3,'m')
plot(-A2,A4,'r')
