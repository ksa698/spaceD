function [phi_gd,lamda]=grnd_TRACK(Y0,t0,t_G0,w_rat,T,t,mu,f) 
odeoptions=odeset('RelTol',1e-10,'AbsTol',1e-20);
[T,Y]=ode45(@orb_prop,t,Y0,odeoptions,mu);
    for j=1:length(t)
      tG=t_G0+w_rat*(t(j));
        %position for ECI
        r_ECI=[Y(:,1) Y(:,2) Y(:,3)];
            r=norm(r_ECI(j, :));
            R3=[cos(tG) sin(tG) 0;-sin(tG) cos(tG) 0;0 0 1];
        r_ECF=R3*r_ECI(j, :)';
        sabs_why = r_ECF(3)/r;
        phi_gc=asin(sabs_why);
        lamda(j)=atan2(r_ECF(2),r_ECF(1));
        phi_gd(j)=atan2(tan(phi_gc),(1-f)^2);
    end
    figure
    load earth_coastline.mat
        plot(earth_coastline(:,1),earth_coastline(:,2),'k')
        hold on
        grid on
        axis equal
        xlabel('Longtitude [deg]')
        ylabel('Latitude [deg]')
        xlim([-180,180])
        ylim([-90,90])
    scatter(lamda*(180/pi),phi_gd*(180/pi))
    hold off
end
