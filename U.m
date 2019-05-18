function [h]= U( x )
%se abrevia la funcion heaviside(x) (escalon unitario) como U(x)

   h=zeros(size(x));
   h(x>=0)=1;


end

