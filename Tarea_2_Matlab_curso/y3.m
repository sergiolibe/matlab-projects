function dy3dt=y3(t,y)
dy3dt=zeros(2,1);
dy3dt(1)=y(2);
dy3dt(2)=3.*(1-y(1).^2).*y(2)-y(1);
end