%*Creo la matriz M1
disp('Tarea numero 1, Sergio Liberati C.I=24423357 (comentarios en el script)')
disp('Matriz M1')
M1=[1 2 3; -3 -4 4; 3 7 2]
%*Calculo la traspuesta de M1 ya asigno a M2
disp('M2=traspuesta(M1)')
M2=M1'
%*Calculo producto elemento a elemento M1 y M2
disp('producto elemento a elemento M1 y M2')
M1.*M2
%*Calculo la suma de M1 y M2
disp('suma matricial M1+M2')
M1+M2
%*Calculo la division elemento a elemento de M1 y M2
disp('Division elemento a elemtno M1 y M2')
M1./M2
%*calculo el producto matricial M1*M2 y lo asigno a prodM1M2
disp('producto matricial prodM1M2=M1*M2')
prodM1M2=M1*M2
%*calculo el producto matricial M2*M1 y lo asigno a prodM2M1
disp('producto matricial prodM2M1=M2*M1')
prodM1M2=M2*M1
%*calculo la division matricial de M1 y M2(equivalente a M1*inv(M2) )
disp('division matricial M1/M2')
M1/M2
%*cambio M1(2,2) a 9
disp('M1(2,2)=9')
M1(2,2)=9
%*creo la matriz esquinasM1(2x2) con los elementos de las esquinas de M1
disp('matriz con las esquinas de M1')
esquinasM1=[M1(1,1) M1(1,3) ;M1(3,1) M1(3,3)]
%*guardar en un vector fila V los elementos de la diagonal principal de M1
disp('diagonal principal de M1 en vector fila V')
V=diag(M1)'
%*guardar en vector columna W los elementos d ela diagonal secundaria de M1
disp('diagonal secundaria de M1 en vector columna')
W=diag(rot90(M1))
%*realizar el producto escalar y vecorial de V y W
%el producto vectorial de dos vectores a y b es obtenido mediante 
%la sarisfaccion de 3 postulados (como direccion, modulo, y perpendicularidad
% del vecor resultante axb), los cuales llevan a operaciones con matrices 
%de 3x3 que una vez clculado el determinante, se consigue el vector 
% resultante axb. el producto escalar es calculado como A*B(producto 
%matricial)
disp('producto vectorial VxW')
pvecVW=[(V(2)*W(3)-V(3)*W(2)) (V(3)*W(1)-V(1)*W(3)) (V(1)*W(2)-V(2)*W(1))]
disp('producto escalar V*W')
pescVW=V*W
%*guardo los elementos de la 1ra fila de M1 en un vector fila fila1
disp('vector fila1, primera fila de M1')
fila1=M1(1,:)
%*guardo los elementos de 1ra columna de M1 en un vector columna columna1
disp('vector columna1, primera columna de M1')
columna1=M1(:,1)
%*convierto fila1 en vector columna y columna1 en vector fila
disp('convierto fila1 a vector columna y columna1 a vector fila')
fila1=fila1'
columna1=columna1'
%*genero un vector angulos que tenga los angulos entre 30 y 360 con paso 30
disp('vector angulos, con angulos de 30 a 360 con paso 30')
angulos=30:30:360
%*añado el elemento 0 en la primera posicion al vector angulos
disp('añado 0 en la primera posicion de ¡l vector angulos')
angulos=[0 angulos]
%*extraigo del vector angulos los elementos con indice par y lo guardo en
%angulosPar
disp('angulosPar=elementos con indice par del vector angulos')
angulosPar=angulos(2:2:length(angulos))
%*extraigo del vector angulos los elementos con indice impar y lo guardo en
%angulosImpar
disp('angulosImpar=elementos con indice impar del vector angulos')
angulosImpar=angulos(1:2:(length(angulos)-1))
%*concateno el vector angulosPar con angulosImpar
disp('concatenar angulosPar con angulosImpar')
[angulosPar angulosImpar]
%*genere una funcion graf_cos que grafique la funcion coseno para un rango
%aproximado x(x debe ser un vector) con incrementos delta entre punto, y
%utilizando M terminos de mclauren aproximar el coseno

%se utilizara la funcion aprox_cos desarrollada en clase

%la funcion graf_cos utilizara 3 variables 
%graf_cos(x,M,delta)
%donde x es un vector con dos elementos de la forma [x1 x2] los cuales 
%representan los limites izquierdo y derecho del rango a plotear.
% M es el numero de temrinos de mclauren que deseo utilizar para aproximar
% el coseno, y delta es el incremento entre x1 y x2 que me definira la
% cantidad de puntos a utilizar en el ploteo