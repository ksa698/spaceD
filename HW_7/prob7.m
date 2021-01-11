%% Problem 7
%plot a v.s. i sun-synchronous orbit
%i range 95-180 [deg]
%5 lines (e=0.1,0.3,0.4,0.5,0.9
%only plot orbit rp>R
mu=398600.4415;
R=6378.1363;
J2=0.00108248;
d_OMEGA=1.991e-7;

e1=0.1;
    [a1]=sunny(e1,mu,J2,d_OMEGA,R);
e2=0.3;
    [a2]=sunny(e2,mu,J2,d_OMEGA,R);
e3=0.4;
    [a3]=sunny(e3,mu,J2,d_OMEGA,R);
e4=0.5;
    [a4]=sunny(e4,mu,J2,d_OMEGA,R);
e5=0.9;
    [a5]=sunny(e5,mu,J2,d_OMEGA,R);
title('Problem 7 Sun-Synchronous Orbits')
legend('e=0.1','e=0.3','e=0.4','e=0.5','e=0.9')