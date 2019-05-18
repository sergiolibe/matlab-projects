function dy1dt=y1(t,y)
dy1dt=zeros(2,1);
dy1dt(1)=y(2);
dy1dt(2)=1.*(1-y(1).^2).*y(2)-y(1);
end