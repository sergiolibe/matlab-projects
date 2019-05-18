 function dvdt=RC(t,v)
 R=1500;
 C=5e-6;
 dvdt=-v/(R*C);
 end