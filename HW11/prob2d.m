%% Problem 2 parts d)
clc
close all

mu=0.0121506037932213; 

%part d
    [la_1d,la_2d,la_3d,la_4d,la_5d]=lgn_pts(mu);
    r41=[la_1d]';
    r4=[r41 0];
    v4=[0 10e-5 0];
    [la_1dd,la_2dd,la_3dd,la_4dd,la_5dd]=hw11(mu,tf3,r4,v4);