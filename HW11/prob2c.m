%% Problem 2 parts c)
clc
close all
%% Sections
% mu=0.0121506037932213; 
% 
%part c
    tf3=3;
    [la_1c,la_2c,la_3c,la_4c,la_5c]=lgn_pts(mu);
    r31=[la_1c]';
    r3=[r31 0];
    v3=[0 0 0];
    [la_1cc,la_2cc,la_3cc,la_4cc,la_5cc]=hw11(mu,tf3,r3,v3);
