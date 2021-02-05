%% Problem 4
mu=398600; % km^3/s^2
mu1=1;
r_earth=6378; 
    p=6800;
    altitude=p-r_earth; %[km]
    w=sqrt(mu/p^3);
    T=2*pi/w;
    r_i=p/sqrt(2)*[-cos(w); sqrt(2)*sin(w); cos(w)]
    rdot_i=w*p/sqrt(2)*[sin(w); sqrt(2)*cos(w); -sin(w)]
    
    [a,e,i,O,o,nu,truLon,argLat,lonPer,p] = rv2orb(r_i,rdot_i,mu);
    [r,v] = orb2rv(a,e,i,O,o,nu,truLon,argLat,lonPer,mu);
    
%%
disp('Part a:')
mu=398600;
a=6800;
e=0;
i=(pi-2.3562)*180/pi
OMEGA=(pi-6.2832)*180/pi
w=(pi-4.7146)*180/pi
theta=0;
[cart] = orb2cart(mu,a,e,i,OMEGA,w,theta);
[r,v] = orb2rv(a,e,i,OMEGA,w,theta,truLon,argLat,lonPer,mu)
%% 
disp('Orbital Elements:')
mu=398600;
r_earth=6378; 
a=6603.1;  %semi-major axis
e=0;  %eccentricity
i=(51.63*pi)/180;  %inclination
OMEGA=(352.6*pi)/180;  %RAAN (right ascension of the ascending node)
w=(76.15*pi)/180;  %argument of periapsis
theta=(323.7*pi)/180;  %true anomaly

ang_vel = sqrt(mu/a^3);
Time=(2*pi)/ang_vel;
    disp('Altitude is [km]:')
    disp(a-r_earth)
    disp('Orbit Period [s]:')
    disp(Time)
   % [cart] = orb2cart(mu,a,e,i,OMEGA,w,theta);
[r,v] = orb2rv(a,e,i,OMEGA,w,theta,mu)

ww = sqrt(mu/a^3);
Time=(2*pi)/ww;
    disp('Altitude is [km]:')
    disp(a-r_earth)
    disp('Orbit Period [s]:')
    disp(Time)
    [cart] = orb2cart(mu,a,e,i,OMEGA,w,theta)
%[r,v] = orb2rv(a,e,i,OMEGA,w,theta,mu)
    r_i=a/sqrt(2)*[-cos(ww*0); sqrt(2)*sin(ww*0); cos(ww*0)]
    rdot_i=ww*a/sqrt(2)*[sin(ww*0); sqrt(2)*cos(ww*0); -sin(ww*0)]
%%
mu=398600;
r_earth=6378; 
a=r_earth+820;
e=0;
i=98.8*pi/180; %DEG
OMEGA=60*pi/180;
w=25*pi/180; %DEG
theta=0;
ww = sqrt(mu/a^3);
Time=(2*pi)/ww;
    disp('Altitude is [km]:')
    disp(a)
    disp(a-r_earth)
    disp('Orbit Period [s]:')
    disp(Time)
 [cart] = orb2cart(mu,a,e,i,OMEGA,w,theta)
[r,v] = orb2rv(a,e,i,OMEGA,w,theta,mu)
