% A2implicit=@(x,y)1700+2500-20*(10*sqrt(17)*cos(y*FC)+50*sin(x*FC))+2*50*10*sqrt(17)*sin((x-y)*FC);
% A2zero=@(y)A2implicit(5,y);
% fzero(A2zero,75)
A2=A2-A2;
A2implicit=@(x,y)1700+2500-20*(10*sqrt(17)*cos(y*FC)+50*sin(x*FC))+2*50*10*sqrt(17)*sin((x-y)*FC);
for i=0:90;
A2zero=@(y)A2implicit(i,y);
A2(i+1)=fzero(A2zero,15);
end;

A2zero=@(y)A2implicit(5,y);
A2(5)=fzero(A2zero,75);
A2(5)