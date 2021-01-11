%% Problem 2...Unperturbed, for 2 Body
%inital conditions/info
mu=398600.4415; %km^3/s^2
r0=[-5282.628;-4217.988;296.511];
    r_0=norm(r0);
v0=[-4.541972;5.885228;2.043106];
    v_0=norm(v0);
%Num Prop=Runge Kutta BOIIIII...
Y0=[r0 v0];

[orb_el] = cart2orb(r0,v0,mu);
a=orb_el(1);
    P=(2*pi)/sqrt(mu/a^3); %Orbit Period
    %20 s interval, for 3 orbit periods, t_span [s], but t_set sounds cute
    t_set=0:20:3*P;      
odeoptions=odeset('RelTol',1e-10,'AbsTol',1e-20);
[T,Y]=ode45(@orb_prop,t_set,Y0,odeoptions,mu);

%% Plotting A
r=sqrt(Y(:,1).^2+Y(:,2).^2+Y(:,3).^2);
    r_vect=[Y(:,1) Y(:,2) Y(:,3)];
v=sqrt(Y(:,4).^2+Y(:,5).^2+Y(:,6).^2);
    v_vect=[Y(:,4) Y(:,5)  Y(:,6)];
a=-(mu./r.^2);

figure
    subplot(3,1,1)
        plot(T/3600,r,'r')
        ylabel('Position[km]')
    subplot(3,1,2)
            plot(T/3600,v,'b')
        ylabel('Velocity[km/s]')
    subplot(3,1,3)
            plot(T/3600, a, 'k')
        ylabel('Acceleration[km/s^2]')
        xlabel('Time[hrs]')

%% Plotting B
%e(t)-e(t0)
energy=(v.^2/2)-(mu./r); %Units [DU^2/TU^2]
energy_0=(v_0.^2/2)-(mu./r_0);
diff=energy-energy_0;

figure
    plot(T/3600,diff,'r')
xlabel('Time[hrs]')
ylabel('\Delta Specific Energy km^2/s^2')
title('Change in Specific Energy')

%% Plotting C
o_el=zeros(843,6);
for i=1:843
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
    xlabel('Time [hrs]')
    