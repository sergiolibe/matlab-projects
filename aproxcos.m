%funcion aproxcos
%Sergio Liberati C.I=24423357
function [y] = aproxcos(x,N)
%calculo de cos(x) mediante n terminos de serie mclauren
n=0:N;
y=sum((-1).^(n).*(x).^(2.*n)./factorial(2*n));
end