clc;clear
t1=24;phi1=.45;V1=232.196;%V en m3/min, T em ºK%
t2=30;phi2=.58;V2=144.414;
P=100;
Ra=0.2879097;Rv=0.4615;


Pg_20=2.3393;
Pg_25=3.1698;
Pg_30=4.2469;

Pg1=Pg_20+(Pg_25-Pg_20)*(t1-20)/(25-20);
Pg2=Pg_30;

w1sat=0.622*Pg1/(P-Pg1);
w2sat=0.622*Pg2/(P-Pg2);

w1=phi1*w1sat;
w2=phi2*w2sat;

cp=1.005;
h1=cp*t1+w1*(2501.3+1.82*t1);
h2=cp*t2+w2*(2501.3+1.82*t2);

%Pv+Pa=P, P=mRT/V, T en ºK
syms ma1 mv1 ma2 mv2
[ma1,mv1]=vpasolve(mv1/ma1==w1,P==mv1*Rv*(t1+273.15)/V1+ma1*Ra*(t1+273.15)/V1,ma1,mv1);
[ma2,mv2]=vpasolve(mv2/ma2==w2,P==mv2*Rv*(t2+273.15)/V2+ma2*Ra*(t2+273.15)/V2,ma2,mv2);


ma3=ma1+ma2;
w3=(ma1*w1+ma2*w2)/ma3;
h3=(ma1*h1+ma2*h2)/ma3;

syms t3
t3=vpasolve(h3==cp*t3+w3*(2501.3+1.82*t3));

Pg3=Pg_25+(Pg_30-Pg_25)*(t3-25)/(30-25);
w3sat=0.622*Pg3/(P-Pg3);

phi3=w3/w3sat;

w6=w1;
ma4=ma3;
ma5=ma4;
ma6=ma5;

mv6=w6*ma6;

mv=0.0115;%kg/s se debe llevar a kg/min

mv5=mv6-mv*60/1;

w5=mv5/ma5;
w4=w5;

syms Pv4
Pv4=vpasolve(w4==0.622*Pv4/(P-Pv4));
%en 4 phi=100%
phi4=1;
Pg4=Pv4/phi4;

Pg_5=0.8725;
Pg_10=1.2281;
t4=5+(10-5)*(Pg4-Pg_5)/(Pg_10-Pg_5);

t6=t1;
h6=cp*t6+w6*(2501.3+1.82*t6);

Q56=100;%kW
%Q56=ma5*(h6-h5); Q está en kW, llevar a kJ/min
h5=h6-Q56*(60/1)/ma5;

syms t5
t5=vpasolve(h5==cp*t5+w5*(2501.3+1.82*t5));
Pg_15=1.7057;

Pg5=Pg_10+(Pg_15-Pg_10)*(t5-10)/(15-10);

phi5=w5*P/((0.622+w5)*Pg5);
t5=single(t5);phi5=single(phi5);
disp(['T5=',num2str(t5),'ºC. phi5=',num2str(phi5*100),'%']);

h4=cp*t4+w4*(2501.3+1.82*t4);
Q34=ma3*(h4-h3);%kJ/min llevar a ton-ref; 1kJ/s=0.284345ton-ref
Q34=Q34*(1/60)*(0.284345/1);

mcond=ma3*(w3-w4);
vf_t4=0.001;
Vcond=mcond*vf_t4;%m3/min, llevar a galon/hora, 1galon=3.7854L, 1m3=1000L
Vcond=Vcond*(60/1)*(1000/1)*(1/3.7854);

Q34=single(Q34);Vcond=single(Vcond);
disp(['Q34=',num2str(Q34),'','ton-ref.   ','Vcond=',num2str(Vcond),'gal/h']);

Q45=ma5*(h5-h4);%está en kJ/min, llevar a kW=kJ/s
Q45=Q45*(1/60);
Q45=single(Q45);
disp(['Q45=',num2str(Q45),'kW']);

