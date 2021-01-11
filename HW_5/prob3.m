%% Problem 3
mu=398600; % km^3/s^2
mu1=1; % DU^3/TU^2

% disp('Part a:')
% r1=[0;6767.01;0];
% v1=[4.7681;0;6.0244];
% [orb_el] = cart2orb(r1,v1,mu1)

% disp('Part b:')
% r2=[-4070.369;639.517;-2085.780];
% v2=[-0.672297;10.052175;-7.055156];
% [orb_el] = cart2orb(r2,v2,mu)
% 
% disp('Part c:')
% r3=[21000*sqrt(2);21000*sqrt(2);0];
% v3=[-0.05*sqrt(mu/210);0.05*sqrt(mu/210);0];
% [orb_el] = cart2orb(r3,v3,mu)

    p=6800; %rounded up from 6790.984
    r_earth=6378;
    altitude=p-r_earth; %[km]
    w=sqrt(mu/p^3);
    T=2*pi/w;
    r_i=p/sqrt(2)*[-cos(w); sqrt(2)*sin(w); cos(w)];
    rdot_i=w*p/sqrt(2)*[sin(w); sqrt(2)*cos(w); -sin(w)];
    [orb_el] = cart2orb(r_i,rdot_i,mu)