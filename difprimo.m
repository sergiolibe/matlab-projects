function vdif=difprimo(s)
vprimo=primo(s);
vdif(length(vprimo)-1)=0;
for a=1:length(vdif);
    vdif(a)=vprimo(a+1)-vprimo(a);
end; 