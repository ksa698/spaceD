%% Problem 3
%inital conditions/info
mu=398600.4415; %km^3/s^2
R=6378.1363; %Earth Radius [km]
J2=0.00108248; %Oblateness
r0=[-5282.628;-4217.988;296.511];
v0=[-4.541972;5.885228;2.043106];

Y0=[r0 v0];

%calc all orbital elements
[orb_el] = cart2orb(r0,v0,mu);
semi=orb_el(1);
ecc=orb_el(2);
inc=(orb_el(3)*pi)/180;
    d_OMEGA=-((3/2)*(sqrt(mu)*J2*R^2)/(((1-ecc^2)^2)*semi^(7/2)))*cos(inc);
    t_set=0:100:86400;        %t_span [s], but t_set sounds cute
odeoptions=odeset('RelTol',1e-10,'AbsTol',1e-20);
[T,Y]=ode45(@orb_propJ2,t_set,Y0,odeoptions,mu,J2,R);

%% Plotting A
r=sqrt(Y(:,1).^2+Y(:,2).^2+Y(:,3).^2);
    r_vect=[Y(:,1) Y(:,2) Y(:,3)];
v=sqrt(Y(:,4).^2+Y(:,5).^2+Y(:,6).^2);
    v_vect=[Y(:,4) Y(:,5) Y(:,6)];
acc=-(mu./r.^2);

figure
    subplot(3,1,1)
        plot(T/3600,r,'r')
        ylabel('Position[km]')
    subplot(3,1,2)
        
        plot(T/3600,v,'b')
        ylabel('Velocity[km/s]')
    subplot(3,1,3)
        
            plot(T/3600, acc, 'k') 
        ylabel('Acceleration[km/s^2]')
        xlabel('Time[Hours]')

%% Plotting B        
%Orbital Elements Y is 865,6
o_el=zeros(865,6);
for i=1:865
    o_el(i,:)=cart2orb(r_vect(i,:),v_vect(i,:),mu);
end

figure
subplot(6,1,1)
    plot(T/3600,o_el(:,1),'r')
    ylabel('a [km]')
subplot(6,1,2)
    plot(T/3600,o_el(:,2),'b')
    ylabel('e')
subplot(6,1,3)
    plot(T/3600,o_el(:,3),'k')
    ylabel('i [\circ]')
subplot(6,1,4)
    plot(T/3600,o_el(:,4),'r')
    ylabel('OMEGA [\circ]')
subplot(6,1,5)
    plot(T/3600,o_el(:,5),'b')
    ylabel('w [\circ]')
subplot(6,1,6)
    plot(T/3600,o_el(:,6),'k')
    ylabel('\theta [\circ]')
    xlabel('Time [Hours]') 
    
%% Part C
%compute OMEGA dot
disp('OMEGA dot [deg]:')
disp(d_OMEGA)

%% Part D
U=(mu./r)-((mu./r).*(J2/2).*(R./r).^2.*(3*(r_vect(3)./r).^2)-1);
U0=(mu/norm(r0))-((mu/norm(r0))*(J2/2)*(R/norm(r0))^2*(3*(r0(3)/norm(r0))^2)-1);
for i=1:865
    energy=(dot(v_vect(i,:),v_vect(i,:))/2)-U;
end
energy_0=(dot(v0,v0)/2)-U0;

diff=energy-energy_0;

figure
    plot(T/3600,diff,'r')
xlabel('Time[Hours]')
ylabel('\Delta Specific Energy km^2/s^2')
title('Change in Specific Energy')
