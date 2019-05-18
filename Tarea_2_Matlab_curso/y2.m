function dy2dt=y2(t,y)
dy2dt=zeros(2,1);
dy2dt(1)=y(2);
dy2dt(2)=2.*(1-y(1).^2).*y(2)-y(1);
end