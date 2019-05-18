function vespectro=espectroFList(lista);
vespectro(max(lista))=0;
for u=1:length(lista);
   vespectro(lista(u))=vespectro(lista(u))+1;
end;