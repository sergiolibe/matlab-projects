function vp=primo(q)
cp=1;
vp(cp)=1;
for a=1:q;
    c=0;
    for b=1:a;
        if(mod(a,b)==0);
            c=c+1;
        end;
    end;
    if (c==2);
        cp=cp+1;
        vp(cp)=a;
    end;
end;
