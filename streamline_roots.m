close;
clear;



nmax=10;


tol=5e-4;
n=0;
%psi=0.1;
%x=2;
r=.25*20;
U=0.5;
raiz=0;


a=0;
b=10;
c=0;



x=-15:.1:15;
y=zeros(size(x));
%psi=[0.02,0.06,0.1:.5:4];
psi=[0.1,0.25,0.5,0.7,1];
%size(y)
%size(psi)

matrizY=zeros(length(psi),length(y));

ang=0:.05:2*pi;
xcirc=r.*cos(ang);
ycirc=r.*sin(ang);


%tic

for i=1:length(psi)
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
    
while (n<=nmax)
    c=(a+b)/2;
    if(streamline_val(psi(i),U,x(j),r,c)==0 || ((b-a)/2)<tol )
        
       y(j)=c;
       break;
       
    end
    n=n+1;
    if(sign(streamline_val(psi(i),U,x(j),r,c))==sign(streamline_val(psi(i),U,x(j),r,a)))
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
    
end


% lim=[min(x),max(x)];
% xlim(lim);
% ylim(lim);
% plot(xcirc,ycirc,'Color',[1,1,1])
% axis equal
% hold on;
% toc





%disp(num2str(raiz));
%disp(['f(a)=',num2str(streamline_val(psi,U,x,r,a)),'   f(b)=',num2str(streamline_val(psi,U,x,r,b))])


%streamline_val(psi,U,x,r,3)
%streamline_val(psi,U,x,r,0)
%streamline_val(psi,U,x,r,0.411)
%length(matrizY(1,:))
matrizX=zeros(size(matrizY));
for i=1:length(matrizX(:,i))
    matrizX(i,:)=x;
end
%matrizX.*matrizY



v=-U.*(2.*r.^2.*matrizX.*matrizY)./((matrizX.^2+matrizY.^2).^2);
u=U.*(r.^2.*(matrizY.^2-matrizX.^2)+(matrizX.^2+matrizY.^2).^2)./((matrizX.^2+matrizY.^2).^2);
Uabs=sqrt(v.^2+u.^2);

disp([r min(min(Uabs)) max(max(Uabs))])

 
% cmax=max(max(Uabs));
% cmin=min(min(Uabs));
% for i=1:length(Uabs(:,1))
%     
%     plot(matrizX(i,:),matrizY(i,:),'Color',[1,1,1]*40/255)
%     plot(matrizX(i,:),-matrizY(i,:),'Color',[1,1,1]*40/255)
%     for j=1:length(Uabs(1,:))
%         plot(matrizX(i,j),matrizY(i,j),'.','MarkerSize',10,'Color',mapeo(Uabs(i,j),cmin,cmax,0,1).*[-1,1,1]+[1,0,0]);hold on;
%         plot(matrizX(i,j),-matrizY(i,j),'.','MarkerSize',10,'Color',mapeo(Uabs(i,j),cmin,cmax,0,1).*[-1,1,1]+[1,0,0]);
%     end
%     
% end
% 
% set(gca,'color',[0 0 0])
% fill(xcirc,ycirc,[1,1,1]*5/8)
% 
% div=100;
% colormap=zeros(div+1,3);
% c=1;
% for i=0:255/div:255
%     colormap(c,:)=[255-i,i,i]/255;   
%     c=c+1;
% end
% set(gcf, 'Colormap', colormap);
% colorbar