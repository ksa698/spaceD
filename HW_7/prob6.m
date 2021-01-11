%% Problem 6
%information
mu=398600.4415;

%initial conditions
a1=8000;
e1=0.1;
i1=(50*pi)/180;
OMEGA1=(45*pi)/180;
w1=(300*pi)/180;
theta1=0;
    [r1,v1] = orb2cart(mu,a1,e1,i1,OMEGA1,w1,theta1); %from HW5
    %unit vector
    r_un=(r1./norm(r1)); 
    %initial momentum 
    h1=cross(r1,v1);

%second orbit
a2=8500;
e2=0.15294;
i2=(50*pi)/180;
OMEGA2=(45*pi)/180;
w2=(300*pi)/180;
theta2=0;
    [r2,v2] = orb2cart(mu,a2,e2,i2,OMEGA2,w2,theta2);

%all v
disp('difference in v: ')
    diff=v2-v1
vr=dot(diff,r_un)
perp=cross(h1,r1);
    vp=sqrt(norm(diff)^2-vr^2)


