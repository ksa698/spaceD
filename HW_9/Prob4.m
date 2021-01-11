%% Problem 4
%non-geo sync, pass over austrailia once a day
%state orb el & reasoning
%plot track over 72 hours
%initial values
    t0=0;
    t_G0=0; %theta G,0 [rad] @t0
    f=3.35e-3;
    w_rat=(2*pi)/86164; %rotation rate [rad/s]
    mu=398600;
M=1; %primary body goes once 
N=8; %s/c orbits 8 times, gives it more time to 
e=0.7;
i=35*pi/180; %logitude limits that fits 
OMEGA=270*pi/180; %shift right and left
w=-270*pi/180;%horizontal stretch 270, and if negative it flips across x axis
a=(mu*(M/(N*w_rat))^2)^(1/3); %depends on M&N
    disp('RGT Semi-Major Axis [km]:')
    disp(a)
theta=45*pi/180;
    [cart4] = orb2cart(mu,a,e,i,OMEGA,w,theta);
    Y=cart4;
    T=2*pi*sqrt(a^3/mu);
    %time interval
    t=0:60:86400*3;
    [phi_gd,lamda]=grnd_TRACK(Y,t0,t_G0,w_rat,T,t,mu,f);
    title('Problem 4')