%% HW 11 Problem 2 a & b
clc
close all
%% Sections
mu=0.0121506037932213; 
     tf=15;
%part a 
    r1=[0.05 -0.05 0];
    v1=[4.0 2.6 0];
    [la_1a,la_2a,la_3a,la_4a,la_5a]=hw11(mu,tf,r1,v1);
    %part b
    tf2=6;
    r2=[1.04058272632674 0 0];
    v2=[0 0.620929915462175 0];
    [la_1b,la_2b,la_3b,la_4b,la_5b]=hw11(mu,tf2,r2,v2);