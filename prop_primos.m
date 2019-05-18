function v=prop_primos(n)
v(n)=0;
for i=1:n;
    v(i)=100*cuentaprimos(i)/i;
end;