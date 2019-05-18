close all;clear all;clc
%(1) Considere la ecuación de Van der Waals(Eq 1). Se considera el benceno para el cual
%a=18.78 atml2/mol2, b=0.1208 l/mol. Representar sobre una misma gráfica las dos
%subgráficas correspondientes a:
%Isotermas de 100, 200, 300 y 400 ºC
%Isobaras de 25, 35, 45 y 55 atm
%Cada curva debe ir con trazo diferenciado, con el texto que indique la isolínea que se ha
%representado, así como el título de la gráfica y la etiqueta de los ejes. R=0.0821 y
%V=[2:100];

%EQ1  (P+a/V^2)*(V-b)=R*T

%se trazaran dos grupos de gráficas, P(V) con las isotermas, y T(V) con las
%isobaras

a=18.78;b=0.1208;R=0.0821;%R esta en funcion de grados kelvin asi que se deben
%transfomar las temperaturas a ºK
T=[100 200 300 400]+273.15;
P=[25 35 45 55];
PV=zeros(4,99);TV=PV;
V=2:100;

for i=1:4
    PV(i,:)=(R*T(i))./(V-b)-a./V.^2;
    TV(i,:)=(P(i)+a./V.^2).*(V-b)/R-273.15;
end


figure('Name','Pregunta 1 Isotermas');
semilogx(V,PV(1,:),'x-r');hold on;semilogx(V,PV(2,:),'.-k');
semilogx(V,PV(3,:),'b');semilogx(V,PV(4,:),'o-m','MarkerSize',2)
title('Isotermas Van der Waals (Benceno)');legend('100ºC','200ºC','300ºC','400ºC')
xlabel('Volumen [L/mol]');ylabel('Presión [atm]')
%plot(V,PV(1,:),'r');hold on;plot(V,PV(2,:),'k');plot(V,PV(3,:),'b');plot(V,PV(4,:),'m')
figure('Name','Pregunta 1 Isobaras')
semilogx(V,TV(1,:),'x-c');hold on;semilogx(V,TV(2,:),'.-g');
semilogx(V,TV(3,:),'k');semilogx(V,TV(4,:),'o-b','MarkerSize',2)
title('Isobaras Van der Waals (Benceno)');legend('25 atm','35 atm','45 atm','55 atm')
xlabel('Volumen [L/mol]');ylabel('Temperatura [ºC]')

%%%%2da pregunta

% Dada la función f(x,y)=xy, obtener sobre una ventana gráfica las representaciones siguientes:
% -La superficie definida por la función sobre el dominio x=[-10,10] y=[-10,10].
% -Las líneas de contorno sobre la superficie
% -La proyección de las líneas de contorno sobre el domino de definición
% -La proyección de las líneas de contorno sobre el plano xy correspondientes a los valores –4,-1, 1 y 4.

%close all;
%clear all;clc
x=-10:0.1:10;y=-10:0.1:10;
[X,Y]=meshgrid(x,y);
Z=X.*Y;
figure('Name','Pregunta 2')
subplot(2,2,1)
surf(X,Y,Z);shading flat;colorbar;
axis square;title('superficie f(x,y)=x*y')
xlabel('x');ylabel('y')
subplot(2,2,2);
contour3(X,Y,Z,20);shading flat;colorbar;
h=findobj('Type','patch');set(h,'LineWidth',2)
axis square;title('Lineas de contorno sobre f(x,y)=x*y')
xlabel('x');ylabel('y')

subplot(2,2,3)
contour(X,Y,Z,20);shading flat;colorbar;
axis square;title({'Proyección de lineas de';'contorno sobre el plano xy'})
xlabel('x');ylabel('y')

subplot(2,2,4)
zlevs=[-4 -1 1 4];
contour(X,Y,Z,zlevs);
axis square;
colorbar;
xlabel('x');ylabel('y')
title({'Lineas de contorno para';'Z=-4 Z=-1 Z=1 Z=4'});


%3ra pregunta
% 
% (3) Se ha medido experimentalmente la conductividad eléctrica del 
%acero a distintas temperaturas, recogiéndose los siguientes valores:
% Obtener los polinomios de regresión de primero y segundo grado. 
%Calcular para los polinomios obtenidos cuál sería el valor estimado 
%de la conductividad eléctrica a los 600 y a los 1000ºC.

T=[100 300 500 700 900];
K=[51813 28571 17483 11696 9116];
p1=polyfit(T,K,1);
p2=polyfit(T,K,2);
TEstimada=[polyval(p1,600) polyval(p2,600) polyval(p1,1000) polyval(p2,1000)];
disp(['la conductividad a 600ºC es ' num2str(TEstimada(1)) ' Ohm*cm^-1 según la regresion de 1er grado'])
disp(['la conductividad a 600ºC es ' num2str(TEstimada(2)) ' Ohm*cm^-1 según la regresion de 2do grado'])
disp(['la conductividad a 1000ºC es ' num2str(TEstimada(3)) ' Ohm*cm^-1 según la regresion de 1er grado'])
disp(['la conductividad a 1000ºC es ' num2str(TEstimada(4)) ' Ohm*cm^-1 según la regresion de 2do grado'])
figure('Name','Pregunta 3')
plot(T,K,'.k');hold on
Tp=0:1100;
K1=polyval(p1,Tp);
K2=polyval(p2,Tp);
plot(Tp,K1,'r');plot(Tp,K2,'b');
legend('Puntos Estimados','Regresión 1^e^r grado','Regresión 2^d^o grado')
axis square
xlabel('Temperatura [ºC]');ylabel('Conductividad eléctrica [ \Omega cm^-^1]');
title({'Conductividad Electrica del Acero';' en función de la Temperatura'});

%%%%4ta pregunta
%clear;

% Resuelva la siguiente ecuación diferencial con condiciones iniciales: [2;0]
% y1''-u*(1-y1^2)y1'+y1=0
% Haga las gràficas correspondientes para ?=1,2,3,4,5

%Se debe crear la funcion dy1dt que corresponde a la condicion de cada
%derivada de la funcion y1, se crearan 5 funciones correspondientes a los
%valores de u=1,2,3,4,5, se crearan y1 y2 y3 y4 y5m con su correspondiente
%dy1dt dy2dt dy3dt dy4dt dy5dt

%decimos que y1'=y2;por ende y2' será y1''
% tendremos y1''==u*(1-y1^2)y1'-y1->y2'=u*(1-y1^2)y2-y1

%function dy1dt=y1(t,y)
%dy1dt=zeros(2,1);
%dy1dt(1)=y(2);
%dy1dt(2)=u*(1-y(1)^2)y(2)-y(1);
%end

%se resolveran las ODE para un intervalo de tiempo de 0 a 10

%u=1
[T1,Y1]=ode45('y1',[0 10],[2 0]);
figure('Name','Pregunta 4 para u=1')
plot(T1,Y1(:,1));hold on;plot(T1,Y1(:,2),'r');
title('y_2´-\mu*(1-y_1^2)*y_2+y_1=0  para \mu=1')
legend('y_1','y_2')
%u=2
[T2,Y2]=ode45('y2',[0 10],[2 0]);
figure('Name','Pregunta 4 para u=2')
plot(T2,Y2(:,1));hold on;plot(T2,Y2(:,2),'r');
title('y_2´-\mu*(1-y_1^2)*y_2+y_1=0  para \mu=2')
legend('y_1','y_2')
%u=3
[T3,Y3]=ode45('y3',[0 10],[2 0]);
figure('Name','Pregunta 4 para u=3')
plot(T3,Y3(:,1));hold on;plot(T3,Y3(:,2),'r');
title('y_2´-\mu*(1-y_1^2)*y_2+y_1=0  para \mu=3')
legend('y_1','y_2')
%u=4
[T4,Y4]=ode45('y4',[0 10],[2 0]);
figure('Name','Pregunta 4 para u=4')
plot(T4,Y4(:,1));hold on;plot(T4,Y4(:,2),'r');
title('y_2´-\mu*(1-y_1^2)*y_2+y_1=0  para \mu=4')
legend('y_1','y_2')
%u=5
[T5,Y5]=ode45('y5',[0 10],[2 0]);
figure('Name','Pregunta 4 para u=5')
plot(T5,Y5(:,1));hold on;plot(T5,Y5(:,2),'r');
title('y_2´-\mu*(1-y_1^2)*y_2+y_1=0  para \mu=5')
legend('y_1','y_2')