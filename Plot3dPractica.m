clear;clc;
hold off
x=linspace(0,1,500);y=-pi:0.01:pi;
[X,Y]=meshgrid(x,y);
Z=sin(2*X)./(2+cos(2*Y));
%Z=sin(-3*X)./(2-cos(1.5*Y));
%surf(X,Y,Z);
%surfl(X,Y,Z);
%surfc(X,Y,Z);
%hading faceted
%shading flat
%shading interp
%colormap(gray)
%colorbar
contour(X,Y,Z,'LineWidth',2)
colorbar
hold on
mesh(X,Y,Z)

clear;clc;hold off;close all;
%%%%%Ejercicio
%
%para la funcion f(x,y)=sin(4x).exp(xy/5)/(2+cos(3y)) grafique 
%en la figura 1 con efectos de luz para 2<x<4 (paso 0.001) 2pi<y<3pi (paso 
%0.01)
% en la figura 2 las curvas de nivel de la funcion
x=2:0.01:4;y=2*pi:0.01:3*pi;
[X,Y]=meshgrid(x,y);
Z=sin(4*X).*exp(X.*Y/5)./(2+cos(3*Y));
subplot(2,1,1)
%figure(1)
surfl(X,Y,Z);shading flat;colorbar

subplot(2,1,2)
%figure(2)
contour(X,Y,Z,45,'LineWidth',2);colorbar
%%%%%%%%%%%%%%%%%%%%%%
%close all;clear;clc


%graficas varias

%bar(1:10,rand(1,10))
%
%stem(0:10,exp((0:10)/3))
%
%[X,Y]=meshgrid(1:10,1:10);
%quiver(X,Y,rand(10),rand(10))
%
%fill([0 0.5 1 0.5],[0 1 0 -2],'r')
%




%%% Vectorizacion

%generar un vector random y encontrar valores tal que x<0.6 y x>0.4
%x=rand(1,100);
%inds=find(x>0.4 & x<0.6)



%%%ejercicio

%extraer los valores de la funcion sin(x) (para 0<x<5pi) tal que sin(x)>0.7
%verificar que toma mas tiempo: utilizar un for con if y contador ... o
%utilizar find con length
x=0:0.0001:5*pi;
y=sin(x);

tic
contador=0;
for n=1:length(y)
    if(y(n)>0.7)
        contador=contador+1;
    end
end
toc

disp('este fue el tiempo utilizado por el ciclo for+if+contador  ^^^^  ')
disp(['resultado, contador =',int2str(contador)])

tic
contador1=length(find(y>0.7));
toc

disp('este fue el tiempo utilizado por el find+length^^^^  ')
disp(['resultado, contador =',int2str(contador1)])