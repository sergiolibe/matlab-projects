function dy5dt=y5(t,y)
dy5dt=zeros(2,1);
dy5dt(1)=y(2);
dy5dt(2)=5.*(1-y(1).^2).*y(2)-y(1);
end