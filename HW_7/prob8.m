%% Problem 8
%i for satellite for critical inclined & sun-synch orbit
%plot e v.s. a 
mu=398600.4415;
R=6378.1363;
J2=0.00108248;
d_OMEGA=1.991e-7;
f=3.353e-3;
i=116.6;
i_deg=(i*pi)/180; %inclination for critically inclined

e=0:0.01:1; %pass through all possible eccentricities from circle to elliptical
a=(-(((3/2)*sqrt(mu)*J2*R^2)./(d_OMEGA./cos(i_deg)))./(1-e.^2).^2).^(2/7); %using eqn from sunny function and OMEGA dot

%Figure TIMEEEE WOOOO
disp('Inclination for critically inclined & sun-synchronous orbit: ')
disp(i)
plot(e,a,'r')
xlabel('Eccentricities e')
ylabel('Semimajor Axis a [km]')
title('Problem 8 Critically Inclined & Sun-Synchronous')
