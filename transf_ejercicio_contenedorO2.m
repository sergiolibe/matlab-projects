clear;clc
kaci=26;kf=0.015;kace=56;
to=-180+273;ts=20+273;
tex=25+273;hex=15;
eai=0.006;eae=0.003;
syms ef
L=2;r1=0.6;r2=r1+eai;r3=r2+ef;r4=r3+eae;
Rkaic=log(r2/r1)/(2*pi*kaci*L);
Rkfc=log(r3/r2)/(2*pi*kf*L);
Rkaec=log(r4/r3)/(2*pi*kace*L);
Rkaie=(r2-r1)/(4*pi*kaci*r1*r2);
Rkfe=(r3-r2)/(4*pi*kf*r3*r2);
Rkaee=(r4-r3)/(4*pi*kace*r3*r4);
Resf=Rkaie+Rkfe+Rkaee;
Rcil=Rkaic+Rkfc+Rkaec;
A=(2*pi*r4*L)+4*pi*r4^2;
Rc=1/(hex*A);

e=solve((ts-to)*(1/Resf+1/Rcil)==(tex-ts)/Rc,ef)

L=2;r1=0.6;r2=r1+eai;r3=r2+e;r4=r3+eae;
Rkaic=log(r2/r1)/(2*pi*kaci*L);
Rkfc=log(r3/r2)/(2*pi*kf*L);
Rkaec=log(r4/r3)/(2*pi*kace*L);
Rkaie=(r2-r1)/(4*pi*kaci*r1*r2);
Rkfe=(r3-r2)/(4*pi*kf*r3*r2);
Rkaee=(r4-r3)/(4*pi*kace*r3*r4);
Resf=Rkaie+Rkfe+Rkaee;
Rcil=Rkaic+Rkfc+Rkaec;
A=(2*pi*r4*L)+4*pi*r4^2;
Rc=1/(hex*A);

qcil=double((ts-to)/Rcil)
qesf=double((ts-to)/Resf)
qt=double((tex-ts)/Rc)

qcil+qesf

 
 