function graf_cos(x,M,delta)
%Sergio Liberati C.I=24423357
%
%dado un rango x de la forma [x1 x2] tal que x1 es el limite izquierdo del 
%rango y x2 es el limite derecho
%M es la cantidad de elementos de serie de mclauren utilizados para estimar
%el coseno de cada valor x+k*delta
%delta es el incremento que se desea entre puntos del rango x
L=x(1):delta:x(2);
y=zeros(length(L));
for k=1:length(L)
    y(k)=aproxcos(x(1)+(k-1)*delta,M);
    plot(L,y)
end