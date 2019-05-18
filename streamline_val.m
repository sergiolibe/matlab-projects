function val=streamline(psi,U,x,r,y)
val=y^3*(U)+y^2*(-psi)+y*(U*(x^2-r^2))-psi*x^2;
end