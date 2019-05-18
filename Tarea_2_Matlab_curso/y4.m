function dy4dt=y4(t,y)
dy4dt=zeros(2,1);
dy4dt(1)=y(2);
dy4dt(2)=4.*(1-y(1).^2).*y(2)-y(1);
end