function [ t ] = rampa(x)
% de acuerdo a la teoria la rampa R(x) se puede definir como 
% R(x)=(x)*H(x), siendo H(x) la funcion escalon unitario
% la cual en MATLAB se conoce como heaviside(x)

t=x*U(x);
end


