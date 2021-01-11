%% Problem 4

% plot e=0,0.2,0.4,0.6,0.8 ; r_pari=10,000 km
r_p=10000;

hold on
    title('Elliptical Orbits')
    set(gca,'fontsize',12)
    xlabel('Distance [R]')
    ylabel('Distance [R]')
    grid on
    axis equal
%Graphing the first body    
    theta=linspace(0,2*pi, 100);
    x_cir = cos(theta);
    y_cir = sin(theta);
    plot(x_cir, y_cir, 'black');
    fill(x_cir,y_cir, 'black')

    for e=0:.2:0.8
        theta=linspace(0,360,361);
        radius=(r_p.*(1+e))./(1+e.*cos(theta.*pi./180));
        lin_radius=radius./6300;                          %radius of earth to linearize...
        x=lin_radius.*cos(theta.*pi./180);
        y=lin_radius.*sin(theta.*pi./180);
        plot(x,y)
    end
legend('outline of first body','first body','e=0','e=0.2','e=0.4','e=0.6','e=0.8', 'Location','northwest')




%% Problem 6 

r=[-1.2;1.5;0]; %DU
v=[0;0;0.922];  %DU/TU
mu=1; %DU ^3 /TU^2

h= cross(r,v)
    disp('            Units [DU^2/TU]')
sp_energy = ((norm(v)^2)./2)-(mu/norm(r))
    disp('            Units [DU^2/TU^2]')
e_vect = ((cross(v,h))/mu)-(r./norm(r)) 
cos_ang = [((norm(h)).^2)/(norm(r)*mu)-1]/norm(e_vect);
    theta = acos(cos_ang); 
        fprintf('Theta in rad= %d \n',real(theta)); %unclude real to not have wonky values
    if dot(r,v)<0 %quadrant check
        real_ang = (2*pi)-theta
            fprintf('Theta in rad= %d \n',real(real_ang));
    end

e= norm(e_vect)
a=[norm(r)*(1+e*cos(theta))]/((1-e)*(1+e))
        if dot(r,v)<0 %quadrant check
           a=[norm(r)*(1+e*cos(real_ang))]/((1-e)*(1+e))
        end
   disp('            Units [DU]')
rp=a*(1-e)
    disp('            Units [DU]')
ra=a*(1+e)
    disp('            Units [DU]')

%% PROBLEM 7

thet=linspace(0,360,361);
r_new=(a*(1-e)*(1+e))./(1+e*cos(thet*pi/180));  %Orbit equation
v_new= sqrt((mu.*((2./r_new)-(1/a))));          %Vis Viva manipulation Lecture 8, slide 16
    KE=(v_new.*v_new)./2;
    PE= -(mu./r_new);
    change= KE(1)+PE(1);        %positive change since PE is negative
    dt_total=(KE+PE)-change;    %positive change since PE is negative

figure
title('Plotting Energy')
subplot(3,1,1);
    plot(thet, KE)
    xlim([0 360])
    xlabel('Theta in Degrees')
    ylabel('KE [DU^2/TU^2]')
    set(gca,'fontsize',10)
subplot(3,1,2);
    plot(thet, PE)
    xlim([0 360])
    xlabel('Theta in Degrees')
    ylabel('PE [DU^2/TU^2]')
    set(gca,'fontsize',10)
subplot(3,1,3);
    plot(thet, dt_total)
    xlim([0 360])
    xlabel('Theta in Degrees')
    ylabel('Change DU^2/TU^2')
    set(gca,'fontsize',10)