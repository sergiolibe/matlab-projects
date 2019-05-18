% integracion por metodo de simpson
%q=quad('mifun',lim1,lim2)

%funcion anonima @(x) sin(x)*x

quad(@(x)sin(x).*x,0,pi)
clc;clear;%%%%CLEAN

%metodo trapecios, se debe dar el vector equiespaciado
x=0:0.01:pi;
trapz(x,sin(x))
trapz(x,sqrt(exp(x))./x)
% plot(x,sqrt(exp(x))./x)

clc;clear;%%%%CLEAN


%Ecuaciones diferenciales

%la ecuacion diferencial que define el comportamiento de un circuito rc
%viene dada por C*dv/dt+V/R=0
% function dvdt=RC(t,v)
% R=1500;
% C=5e-6;
% dvdt=-v/(R*C)

close all;clear all;clc
%voy a guardar en los vectores 't' e 'y' la soluciona a la ecuacion
%diferencial para el intervalo t=[0 0.025] con condicion inicial V(0)=1
[t,y]=ode45('RC2',[0,25e-3],[1]);
plot(t,y(:,1),'k','LineWidth',1.5)
legend('Vc')
xlabel('Tiempo (ms)')
ylabel('Voltaje (V)')
title('Voltaje del condensador en un circuito RC')


%%%close all;clear all;clc


%otro ejemplo con la ecuacion diferencial de un pendulo que viene dada por
%la ecuacion theta''+g*L*sin(theta)=0

[t,x]=ode45('pendulo',[0,10],[0.9*pi 0]);%asumiendo que el pendulo esta 
%casi horizontal
plot(t,x(:,1));
hold on;
plot(t,x(:,2),'r');
legend('Posicion','Velocidad')
title('Movimiento de un pendulo')



