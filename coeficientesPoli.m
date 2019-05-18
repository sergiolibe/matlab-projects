% conseguir los coeficientes de [(x+1)*(2x+3)]*(x+3)
a=[1 1];b=[2 3];c=[0 1 3];
x=a'*b
x1=[x(1) sum(diag(x)) x(4)]
y=x1'*c
y1=flipud(y)
y1=[sum(diag(y1,-1)) sum(diag(y1,0)) sum(diag(y1,1)) sum(diag(y1,2))]
