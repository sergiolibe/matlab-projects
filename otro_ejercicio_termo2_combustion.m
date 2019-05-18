clc;clear;
%Se quema propano C3H8 con aire con una relacion molar de 1:27,
%Determinar
%a)porcentaje del vapor de agua condensado si los productos se enfrian
%hasta 20?c
% CxHy+lambda(x+y/4)*(O2+3.76N2)->xCO2+y/2H2O+(lambda-1)*(x+y/4)O2+lambda*(x+y/4)3.76N2
% C3H8+27(O2+3.76N2)->3*CO2+4*H2O+X*O2+27*3.76N2
%O
%27*2 <--> 3*2+4*1+X*2
X=(27*2-(3*2+4*1))/2;
x=3;y=8;
lambda=1;
%%%%%productos
%hFormacion (kj/mol)
hfCO2=-393.52;
hfO2=0;
hfH2Og=-241.82;
hfH2Ol=-285.83;
hfN2=0;
%delta h a T1 y T2(298 y 800 ?K) (hT1-hT2) (kj/mol)
dhO2p=-(8.682-24.523);
dhN2p=-(8.669-23.714);
dhCO2=-(9.364-32.179);
dhH2O=-(9.904-27.896);
%moles productos
molCO2=x;
molH2O=y/2;
molO2p=(lambda-1)*(x+y/4);
molN2p=lambda*(x+y/4)*3.76;
%masas molares
mmCO2=44.01;
mmO2=32;
mmH2O=18.02;
mmN2=28.01;

%%%%%reactivos
%tengo 1 mol de mezcla , es decir, .6moles de C3H8 y .4moles de C4H10

%hFormacion (kj/mol)
hfC3H8=-103.85;
hfC4H10=-126.15;
%delta h a T1 y T2(298 y 800 ?K)
dhO2r=0;
dhN2r=0;
dhC3H8=0;
dhC4H10=0;
%moles reactivos
molO2r=lambda*(x+y/4);
molN2r=lambda*(x+y/4)*3.76;
molC3H8=0.6;
molC4H10=0.4;
%masas molares g/mol
mmC3H8=44.09;
mmC4H10=58.12;


%calor liberado por reaccion QL=sum Hproductos - sum Hreactivos
%Hproductos mol*(hformacion+deltah)
%Hreactivos mol*(hformacion+deltah)
Hproductos=molCO2*(hfCO2+dhCO2)+molH2O*(hfH2Og+dhH2O)+molO2p*(hfO2+dhO2p)+molN2p*(hfN2+dhN2p);
Hreactivos=molC3H8*(hfC3H8+dhC3H8)+molC4H10*(hfC4H10+dhC4H10)+molO2r*(hfO2+dhO2r)+molN2r*(hfN2+dhN2r);
Ql=Hproductos-Hreactivos;%kJ/mol(combustible)
ql=Ql*1;%1 mol de mezcla, kJ
mmMezcla=0.6*mmC3H8+.4*mmC4H10;%g/mol
Ql=Ql/mmMezcla;%kJ/g(comb)
Ql=Ql*1000/1%kJ/kg(comb)

%hhv de C3H8 y C4H10 kj/kg
hhvC3H8=50350;lhvC3H8=46360;lhvC4H10=45720;
hhvC4H10=49500;
qh=-(hhvC3H8*mmC3H8/1000*0.6+hhvC4H10*mmC4H10/1000*0.4);%kJ
qh1=-(lhvC3H8*mmC3H8/1000*0.6+lhvC4H10*mmC4H10/1000*0.4);%kJ
%qh=2220*molC3H8+2877*molC4H10
(qh-ql)/qh
(qh1-ql)/qh1