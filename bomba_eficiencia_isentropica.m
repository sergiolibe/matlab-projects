a(3,2)=0;
nb=0.85;
h7=191.83;
s7=0.6493;

s8a=.3664;
h8a=104.9;
s8b=.7035;
h8b=209.3;
h8s=interp1([s8a s8b],[h8a h8b],s7);
syms x
h8=vpasolve(nb==(h8s-h7)/(x-h7),x);
a(1,:)=[h8s h8];
%con cengel
h7=191.81;
s7=0.6492;
h8s=417.51;
h8=vpasolve(nb==(h8s-h7)/(x-h7),x);
a(2,:)=[h8s h8];
%con v y presiones 
h7=191.81;
v7=0.001010;
p7=10;
p8=100;
h8s=v7*(p8-p7)+h7;
h8=vpasolve(nb==(h8s-h7)/(x-h7),x);
a(3,:)=[h8s h8];
a