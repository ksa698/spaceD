%% Problem 6
%plot a v.s. i sun-synchronous orbit
%i range 95-180 [deg]
%e=0.1,0.3,0.5
mu=1*10^15;
MU=1;
r=1*10^10;
R=1;
J2=-0.01;

e1=0.1;
    [a1]=sunSyn(e1,mu,MU,J2,R,r);
e2=0.3;
    [a2]=sunSyn(e2,mu,MU,J2,R,r);
e3=0.5;
    [a4]=sunSyn(e3,mu,MU,J2,R,r);
title('Problem 6 Sun-Synchronous Orbits')
legend('e=0.1','e=0.3','e=0.5')