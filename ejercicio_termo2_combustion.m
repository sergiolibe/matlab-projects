clc;clear;
%Se quema 60% de C3H8 y 40% de C4H10 en volumen con 10% de aire en esceso, 
%donde los reactantes entran a la camara de combustion a 25ºC y los 
%productos la abandonan a 527ºC
%Determinar
%a)calor liberado por la reaccion (kj/kg(combustible))
%b)en que porcentaje se reduce el calor liberado en la reaccion, en
%comparacion con el poder calorifico del combustible
t1=25+273;t2=527+273;
lambda=1.1; %debido a 10% exceso
% CxHy+lambda(x+y/4)*(O2+3.76N2)->xCO2+y/2H2O+(lambda-1)*(x+y/4)O2+lambda*(x+y/4)3.76N2

%como tengo 60% de C3H8 y 40% de C4H10 en volumen asumo que por cada mol de
%mezcla tengo .6moles de C3H8 y .4moles de C4H10
%asumo que tengo 10 moles de mezcla

%por cada mol de mezcla tengo 3.4 moles de c y 8.8 moles de h
x=3.4;y=8.8;

%%%
%Verificando el balance 
%%%
c1=x;
c2=x;
%disp('balance c')
%[c1 c2]
o1=lambda*(x+y/4)*2;
o2=2*x+y/2+2*(lambda-1)*(x+y/4);
%disp('balance o')
%[o1 o2]
n1=lambda*(x+y/4)*2*3.76;
n2=lambda*(x+y/4)*2*3.76;
%disp('balance n')
%[n1 n2]
h1=y;
h2=y/2*2;
%disp('balance h')
%[h1 h2]

%%%
%Verificado el balance 
%%%

%%%%%productos
%hFormacion (kj/mol)
hfCO2=-393.52;
hfO2=0;
hfH2Og=-241.82;
hfH2Ol=-285.83;
hfN2=0;
%delta h a T1 y T2(298 y 800 ºK) (hT1-hT2) (kj/mol)
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
%delta h a T1 y T2(298 y 800 ºK)
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