function cp=cuentaprimos(n);
cp=1;
for a=1:n;
    c=0;
    for b=1:a;
        if(mod(a,b)==0);
            c=c+1;
        end;
    end;
    if (c==2);
        cp=cp+1;
    end;
end;