%% Problem 3 Ground Tracks
%plot 60 [s] increments
%PLOT GEODETIC values
%initial values
    t0=0;
    t_G0=0; %theta G,0 [rad] @t0
    f=3.35e-3;
    w_rat=(2*pi)/86164; %rotation rate [rad/s]
    mu=398600;
    
%% part a
%3 orb periods
%what is period of orbit based on GT
%how does it compare to orbit period computed via a?
a=7000;
e=0.01;
i=45*pi/180; %DEG
OMEGA=0;
w=-65*pi/180; %DEG
theta=0;
    [cart] = orb2cart(mu,a,e,i,OMEGA,w,theta);
    Y0=cart;
    T=2*pi*sqrt(a^3/mu);
    %time interval
    t=0:60:3*T; 
    [phi_gd,lamda]=grnd_TRACK(Y0,t0,t_G0,w_rat,T,t,mu,f);
    title('Part a')
    %Period from ground track
    disp('Period (via a) of part a [s]:')
    disp(T)
    
%% part b
%2 orb periods 
%based on GT whwat is period of orbit
%how does it compare to orbit period computed via a?
a2=60000;
e2=0.1;
i2=145*pi/180;
OMEGA2=20*pi/180;
w2=-15*pi/180;
theta2=0;
    %change from orb2cart
    [cart2] = orb2cart(mu,a2,e2,i2,OMEGA2,w2,theta2);
    Y2=cart2;
    %compute orbit period
    T2=2*pi*sqrt(a2^3/mu);
    %time interval
    t2=0:60:2*T2;
    [phi_gd2,lamda2]=grnd_TRACK(Y2,t0,t_G0,w_rat,T2,t2,mu,f);
    title('Part b')
    disp('Period (via a)of part b [s]:')
    disp(T2)
%% part c
%3 orb periods
%based on GT whwat is period of orbit
%how does it compare to orbit period computed via a?
a3=2*6378;
e3=0.5;
i3=135*pi/180;
OMEGA3=-100*pi/180;
w3=-45*pi/180;
theta3=-135*pi/180;
    [cart3] = orb2cart(mu,a3,e3,i3,OMEGA3,w3,theta3);
    Y3=cart3;
    T3=2*pi*sqrt(a3^3/mu);
    %time interval
    t3=0:60:3*T3;
    [phi_gd3,lamda3]=grnd_TRACK(Y3,t0,t_G0,w_rat,T3,t3,mu,f);
    title('Part c')
    disp('Period (via a) of part c [s]:')
    disp(T3)
%% part d
%7 orb periods 3:5 (M:N)RGT
%what is the a for this case?
M=3;
N=5;
e4=0;
i4=60*pi/180;
OMEGA4=100*pi/180;
u4=0;
a4=(mu*(M/(N*w_rat))^2)^(1/3);
    disp('RGT Semi-Major Axis [km]:')
    disp(a4)
theta4=u4;
    [cart4] = orb2cart(mu,a4,e4,i4,OMEGA4,u4,theta4);
    Y4=cart4;
    T4=2*pi*sqrt(a4^3/mu);
    %time interval
    t4=0:60:7*T4;
    [phi_gd4,lamda4]=grnd_TRACK(Y4,t0,t_G0,w_rat,T4,t4,mu,f);
    title('Part d')
    
%% Experiment
a=7198;
e=0;
i=98.8*pi/180; %DEG
OMEGA=60*pi/180;
w=25*pi/180; %DEG
theta=0;
    [cart] = orb2cart(mu,a,e,i,OMEGA,w,theta)
    Y0=cart;
    T=2*pi*sqrt(a^3/mu);
    %time interval
    t=0:60:3*T; 
    [phi_gd,lamda]=grnd_TRACK(Y0,t0,t_G0,w_rat,T,t,mu,f);
    title('Part a')
    %Period from ground track
    disp('Period (via a) of part a [s]:')
    disp(T)


