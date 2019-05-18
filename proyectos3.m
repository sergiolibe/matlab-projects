close
ang=0:0.1:2*pi+.1;
R=5;
plot(R*cos(ang),R*sin(ang),'k');hold on;axis square

R=3.2;%plot(R*cos(ang),R*sin(ang),'k')
fill(R*cos(ang),R*sin(ang),[153,217,234]/255)
R=3;%plot(R*cos(ang),R*sin(ang),'k')
fill(R*cos(ang),R*sin(ang),'w')

R=2;plot(R*cos(ang),R*sin(ang),'k')





R=5;

n=24;
tflecha=0.3;
angflecha=15/180*pi;
for i=1:n
v=(R+0)*[cos(i/n*2*pi) sin(i/n*2*pi)];
p2=v+(tflecha)*[cos(i/n*2*pi+angflecha) sin(i/n*2*pi+angflecha)];
p3=v+(tflecha)*[cos(i/n*2*pi-angflecha) sin(i/n*2*pi-angflecha)];
p4=(R+1.5)*[cos(i/n*2*pi) sin(i/n*2*pi)];
plot([v(1) p2(1)],[v(2) p2(2)],'k');
plot([v(1) p3(1)],[v(2) p3(2)],'k');
plot([v(1) p4(1)],[v(2) p4(2)],'k');
end

n=12;
R=2;
for i=1:n
v=(R+0)*[cos(i/n*2*pi) sin(i/n*2*pi)];
p2=v-(tflecha)*[cos(i/n*2*pi+angflecha) sin(i/n*2*pi+angflecha)];
p3=v-(tflecha)*[cos(i/n*2*pi-angflecha) sin(i/n*2*pi-angflecha)];
p4=(R-.6)*[cos(i/n*2*pi) sin(i/n*2*pi)];
plot([v(1) p2(1)],[v(2) p2(2)],'k');
plot([v(1) p3(1)],[v(2) p3(2)],'k');
plot([v(1) p4(1)],[v(2) p4(2)],'k');
end
text(-1.2,.4,'p_i')

plot([-.2 .2],[0 0],'k')
plot([0 0],[-.2 .2],'k')


i=255;n=360;
v=(R+0)*[cos(i/n*2*pi) sin(i/n*2*pi)];
p2=v-(tflecha)*[cos(i/n*2*pi+angflecha) sin(i/n*2*pi+angflecha)];
p3=v-(tflecha)*[cos(i/n*2*pi-angflecha) sin(i/n*2*pi-angflecha)];
p4=[0,0];
plot([v(1) p2(1)],[v(2) p2(2)],'k');
plot([v(1) p3(1)],[v(2) p3(2)],'k');
plot([v(1) p4(1)],[v(2) p4(2)],'k');
plot([v(1) v(1)-.2 v(1)+.2],[v(2) v(2)-.4 v(2)-.4],'k')
text(v(1)+.3,v(2)-.4,'r_i')



text(1.8,1.7,'r')
i=45;n=360;R=3;
v=(R+0)*[cos(i/n*2*pi) sin(i/n*2*pi)];
p2=v-(tflecha)*[cos(i/n*2*pi+angflecha) sin(i/n*2*pi+angflecha)];
p3=v-(tflecha)*[cos(i/n*2*pi-angflecha) sin(i/n*2*pi-angflecha)];
p4=[0,0];
plot([v(1) p2(1)],[v(2) p2(2)],'k');
plot([v(1) p3(1)],[v(2) p3(2)],'k');
plot([v(1) p4(1)],[v(2) p4(2)],'k');

R=3.2;
v=(R+0)*[cos(i/n*2*pi) sin(i/n*2*pi)];
p2=v+(tflecha)*[cos(i/n*2*pi+angflecha) sin(i/n*2*pi+angflecha)];
p3=v+(tflecha)*[cos(i/n*2*pi-angflecha) sin(i/n*2*pi-angflecha)];
p4=(R+1)*[cos(i/n*2*pi) sin(i/n*2*pi)];
plot([v(1) p2(1)],[v(2) p2(2)],'k');
plot([v(1) p3(1)],[v(2) p3(2)],'k');
plot([v(1) p4(1)],[v(2) p4(2)],'k');

plot([v(1) v(1)+.6],[v(2) v(2)-.2],'k')
text(v(1)+.6,v(2)-.2,'dr')

i=312;R=5;
v=(R+0)*[cos(i/n*2*pi) sin(i/n*2*pi)];
p2=v-(tflecha)*[cos(i/n*2*pi+angflecha) sin(i/n*2*pi+angflecha)];
p3=v-(tflecha)*[cos(i/n*2*pi-angflecha) sin(i/n*2*pi-angflecha)];
p4=[0,0];
plot([v(1) p2(1)],[v(2) p2(2)],'k');
plot([v(1) p3(1)],[v(2) p3(2)],'k');
plot([v(1) p4(1)],[v(2) p4(2)],'k');
text(v(1)-.3,v(2)+.7,'r_o')

text(cos(55/360*2*pi)*6,sin(55/360*2*pi)*6,'p_o')


close all;
%%%%%%%%%%%%%%%%%%%%
ri=2;ro=5;p_i=100;
r=[ri:.1:ro];
sigmat=(p_i*ri^2)/(ro^2-ri^2)*(1+ro^2./r.^2);
sigmar=(p_i*ri^2)/(ro^2-ri^2)*(1-ro^2./r.^2);
plot(r,sigmat,'b');hold on;
plot(r,sigmar,'r');
grid on;plot([ri,ro],[0,0],'k')
ylabel('\sigma_t    y    \sigma_r')
xlabel('r')
legend('\sigma_t','\sigma_r')

close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%
ri=2;ro=5;p_i=100;w=1;v=0.28;p=7000;
r=[ri:.1:ro];
sigmat=p*w^2*((3+v)/8)*(ri^2+ro^2+(ri^2*ro^2)./r.^2-r.^2*(1+3*v)/(3+v));
sigmar=p*w^2*((3+v)/8)*(ri^2+ro^2-(ri^2*ro^2)./r.^2-r.^2);
plot(r,sigmat,'b');hold on;
plot(r,sigmar,'r');
grid on;

r_sr_crit=sqrt(ri*ro);
sigmar_crit=p*w^2*((3+v)/8)*(ri^2+ro^2-(ri^2*ro^2)/r_sr_crit^2-r_sr_crit^2);

plot(r_sr_crit,sigmar_crit,'kv');
text(r_sr_crit,sigmar_crit+0.5e4,'$$\sigma_r max @r_{crit}=\sqrt{r_i*r_o}$$','Interpreter','latex');
ylabel('\sigma_t    y    \sigma_r')
xlabel('r')
legend('\sigma_t','\sigma_r')

close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ri=0;ro=5;p_i=100;w=1;v=0.28;p=7000;
r=[ri:.1:ro];
sigmat=p*w^2*((3+v)/8)*(ri^2-r.^2*(1+3*v)/(3+v));
sigmar=p*w^2*((3+v)/8)*(ri^2-r.^2);
plot(r,sigmat,'b');hold on;
plot(r,sigmar,'r');
grid on;

ylabel('\sigma_t    y    \sigma_r')
xlabel('r')
legend('\sigma_t','\sigma_r')
