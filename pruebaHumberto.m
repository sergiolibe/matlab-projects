
Xg=-3;
Yg=0;
if Xg<0 & Yg~=0
                 c = atan(Yg/Xg) + pi;c=0;
            elseif Xg>0 & Yg~=0
                c = atan(Yg/Xg);c=1;
            elseif Xg==0 & Yg<0;
                c = 3*pi/2;c=2;
            elseif Xg==0 & Yg>0;
                c = pi/2;c=3;
            elseif Yg==0 & Xg>0;
                c = 0;c=4;
            elseif Yg==0 & Xg<0;
               c = pi;c=5;
end
               c