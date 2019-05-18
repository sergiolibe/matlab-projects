close;
nmax=10;


tol=5e-4;
n=0;
%psi=0.1;
%x=2;
r=5;
U=0.01:.01:.1;
raiz=0;


a=0;
b=10;
c=0;



x=-15:.1:15;
y=zeros(size(x));
psi=0.1;
size(y)
size(U)

matrizY=zeros(length(U),length(y));

ang=0:.05:2*pi;
xcirc=r.*cos(ang);
ycirc=r.*sin(ang);


tic

for i=1:length(U)
    y(:)=0;
    for j=1:length(x)
    n=0;c=0;
    
    
    
    if(abs(x(j))<r)
        a=sqrt(r^2-x(j)^2);
        b=sqrt(r^2-x(j)^2)+r;
       if(j>1)
          b=y(j-1)+r/2; 
       end
    else
        if(j>1)
            a=y(j-1)-r/2;
            b=y(j-1)+r/2;
        else
            a=0;
            b=10;
        end
    end
   
            
    
    
%     if(abs(x(j))<(r+1))
%         a=abs(x(j));
%         b=a+2;
%     else
%         a=0;
%         b=3;
%     end
    
    
    
while (n<=nmax)
    c=(a+b)/2;
    if(streamline_val(psi,U(i),x(j),r,c)==0 || ((b-a)/2)<tol )
       %raiz=c;
       y(j)=c;
       %disp(['raiz hayada   n=',num2str(n),'   c=',num2str(c)]);
       
       break;
    end
    n=n+1;
    if(sign(streamline_val(psi,U(i),x(j),r,c))==sign(streamline_val(psi,U(i),x(j),r,a)))
        a=c;
        %disp('hello2');
    else
        b=c;
        %disp('hello3');
    end
    %disp(['c=',num2str(c),'   n=',num2str(n),'   err=',num2str(c)]),
end
%raiz=c;
y(j)=c;

matrizY(i,j)=y(j);
    end
    plot(x,y,'m');hold on;
plot(x,-y,'b');
end


lim=[min(x),max(x)];
xlim(lim);
ylim(lim);
plot(xcirc,ycirc,'k')
axis equal

toc
%disp(num2str(raiz));
%disp(['f(a)=',num2str(streamline_val(psi,U,x,r,a)),'   f(b)=',num2str(streamline_val(psi,U,x,r,b))])


%streamline_val(psi,U,x,r,3)
%streamline_val(psi,U,x,r,0)
%streamline_val(psi,U,x,r,0.411)